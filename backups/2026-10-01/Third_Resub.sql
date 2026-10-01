-- ============================================================
-- Post-Cancellation Repurchase Curve | App x Month
-- Churn      = expected next bill date passed with no further
--              order in that chain
-- Expected   = last order date + Trial_Period (BC0) or Reg_BC_Period (BC1+)
-- Cohort     = customer's FIRST churn within that app
-- Repurchase = new chain in the SAME APP (any product) after churn
-- CT is split into CT-JP / CT-Non-JP on Spend_Country_Code_AFID
-- Bands are NON-OVERLAPPING; censored cells returned as NULL
-- ============================================================

WITH base AS (
  SELECT
    App_Name,
    Customer_Number,
    COALESCE(NULLIF(Ancestor_Order_Id,''), Order_Id) AS chain_id,
    Order_Id,
    SAFE_CAST(Billing_Cycle AS INT64) AS billing_cycle,
    Date_of_Sale,
    IFNULL(Trial_Period, 0)   AS trial_period,
    IFNULL(Reg_BC_Period, 30) AS reg_bc_period,
    UPPER(TRIM(IFNULL(Spend_Country_Code_AFID,''))) AS spend_country
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Final_Order_Status = 2
    AND IFNULL(LOWER(Test), '0') NOT IN ('1','true','yes')
),

-- spend country taken from the chain's FIRST order (acquisition)
chain_country AS (
  SELECT Customer_Number, chain_id, spend_country
  FROM (
    SELECT Customer_Number, chain_id, spend_country,
           ROW_NUMBER() OVER (
             PARTITION BY Customer_Number, chain_id
             ORDER BY Date_of_Sale, billing_cycle, Order_Id) AS rn
    FROM base
  )
  WHERE rn = 1
),

-- last order of each chain, carrying its own period values
chain_end AS (
  SELECT
    App_Name, Customer_Number, chain_id,
    billing_cycle AS last_bc,
    Date_of_Sale  AS last_bill_date,
    trial_period, reg_bc_period
  FROM (
    SELECT *, ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, chain_id
      ORDER BY Date_of_Sale DESC, billing_cycle DESC, Order_Id DESC) AS rn
    FROM base
  )
  WHERE rn = 1
),

-- chains churned: expected next bill date has passed
churned AS (
  SELECT
    e.*,
    c.spend_country,
    DATE_ADD(e.last_bill_date,
      INTERVAL IF(IFNULL(e.last_bc, 1) = 0, e.trial_period, e.reg_bc_period) DAY) AS churn_date
  FROM chain_end e
  LEFT JOIN chain_country c
    ON e.Customer_Number = c.Customer_Number AND e.chain_id = c.chain_id
  WHERE DATE_ADD(e.last_bill_date,
          INTERVAL IF(IFNULL(e.last_bc, 1) = 0, e.trial_period, e.reg_bc_period) DAY)
        < CURRENT_DATE()
),

-- first churn per customer + app
first_churn AS (
  SELECT * EXCEPT(rn) FROM (
    SELECT *, ROW_NUMBER() OVER (
      PARTITION BY Customer_Number, App_Name
      ORDER BY churn_date, chain_id) AS rn
    FROM churned
  ) WHERE rn = 1
),

chain_starts AS (
  SELECT App_Name, Customer_Number, chain_id, MIN(Date_of_Sale) AS chain_start
  FROM base GROUP BY 1,2,3
),

-- earliest same-app repurchase after the churn date
repurchase AS (
  SELECT
    f.Customer_Number, f.App_Name, f.churn_date,
    MIN(s.chain_start) AS repurchase_date
  FROM first_churn f
  JOIN chain_starts s
    ON  s.Customer_Number = f.Customer_Number
    AND s.App_Name        = f.App_Name
    AND s.chain_start     > f.churn_date
  GROUP BY 1,2,3
),

cohort AS (
  SELECT
    CASE
      WHEN f.App_Name = 'CT' AND f.spend_country = 'JP' THEN 'CT-JP'
      WHEN f.App_Name = 'CT'                            THEN 'CT-Non-JP'
      ELSE f.App_Name
    END AS App_Name,
    DATE_TRUNC(f.churn_date, MONTH) AS cohort_month,
    f.Customer_Number,
    DATE_DIFF(r.repurchase_date, f.churn_date, DAY) AS days_to_repurchase
  FROM first_churn f
  LEFT JOIN repurchase r
    ON  r.Customer_Number = f.Customer_Number
    AND r.App_Name        = f.App_Name
    AND r.churn_date      = f.churn_date
)

-- ---------------- FINAL OUTPUT ----------------
SELECT
  FORMAT_DATE('%b-%y', cohort_month)     AS Month,
  App_Name,
  COUNT(DISTINCT Customer_Number)        AS First_Time_Cancelled,

  -- 0-30 days
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 30 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase <= 30), NULL)                        AS Repurchased_0_30d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 30 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase <= 30),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_0_30d,

  -- 31-90 days
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 90 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase BETWEEN 31 AND 90), NULL)            AS Repurchased_31_90d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 90 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase BETWEEN 31 AND 90),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_31_90d,

  -- 91-180 days
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 180 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase BETWEEN 91 AND 180), NULL)           AS Repurchased_91_180d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 180 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase BETWEEN 91 AND 180),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_91_180d,

  -- 181-365 days
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 365 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase BETWEEN 181 AND 365), NULL)          AS Repurchased_181_365d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 365 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase BETWEEN 181 AND 365),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_181_365d,

  -- 366-730 days
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 730 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase BETWEEN 366 AND 730), NULL)          AS Repurchased_366_730d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 730 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase BETWEEN 366 AND 730),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_366_730d,

  -- cumulative within 365d
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 365 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase <= 365), NULL)                       AS Repurchased_Total_365d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 365 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase <= 365),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_Total_365d,

  -- cumulative within 730d
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 730 DAY) <= CURRENT_DATE(),
     COUNTIF(days_to_repurchase <= 730), NULL)                       AS Repurchased_Total_730d,
  IF(DATE_ADD(LAST_DAY(cohort_month), INTERVAL 730 DAY) <= CURRENT_DATE(),
     ROUND(SAFE_DIVIDE(COUNTIF(days_to_repurchase <= 730),
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_Total_730d
FROM cohort
WHERE cohort_month >= DATE '2024-01-01'
  AND cohort_month <  DATE_TRUNC(CURRENT_DATE(), MONTH)
GROUP BY cohort_month, App_Name
ORDER BY App_Name, cohort_month;
