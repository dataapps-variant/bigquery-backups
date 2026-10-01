-- ============================================================
-- Post-Cancellation Repurchase Curve | App x AFID_Channel x Month
-- THIRD CANCELLATION
--
-- Churn      = expected next bill date passed with no further
--              order in that chain
-- Expected   = last order date + Trial_Period (BC0) or Reg_BC_Period (BC1+)
-- Cohort     = customer's THIRD churn within that app, bucketed
--              by the month of THAT churn
-- Repurchase = new chain in the SAME APP (any product, ANY CHANNEL)
--              after the third churn
-- CT is split into CT-JP / CT-Non-JP on Spend_Country_Code_AFID
-- Bands are NON-OVERLAPPING; censored cells returned as NULL
--
-- HOW THIS DIFFERS FROM THE EARLIER TABLES
--   Only a customer who came back after churn 2 can reach churn 3,
--   so this cohort is a SUBSET of the SECOND table's repurchasers,
--   which is itself a subset of the first table's. These are your
--   most cycle-prone customers by construction. Read the shares
--   within this table across months, and compare the curve as a
--   whole against the first and second curves to answer "do
--   win-backs get easier or harder with each cycle?" Do NOT read
--   these shares against the original first-cancellation
--   population.
--
--   Sanity check: Third_Time_Cancelled here should be somewhat
--   BELOW Repurchased_Total_730d in the SECOND-cancellation table.
--   The gap is customers who returned but have not yet churned
--   again. If this table is LARGER, concurrent overlapping chains
--   are inflating the sequence -- see CONCURRENCY below.
--
--   EXPECT THIN CELLS. After three sequential survivorship filters
--   the month x channel grid will be mostly single digits. Roll up
--   to app-level or quarterly before drawing any conclusion.
--
-- CONCURRENCY
--   A customer running overlapping chains in the same app will
--   churn each of them, producing a "third cancellation" with no
--   return in between. That is not a win-back cycle, and the
--   distortion COMPOUNDS at level 3: a single pair of overlapping
--   chains at level 1 shifts every subsequent sequence number.
--   The optional filter in third_churn restricts to chains that
--   genuinely STARTED after the second churn. Strongly consider
--   enabling it at this level.
--
-- CHANNEL SEMANTICS
--   AFID_Channel is the acquisition channel of the chain that
--   produced the THIRD churn -- i.e. the channel that acquired the
--   customer for their third run, not their original acquisition
--   channel. The
--   repurchase join is intentionally NOT channel-matched.
-- ============================================================

CREATE TEMP FUNCTION channel_name(c INT64) AS (
  CASE c
    WHEN  1 THEN 'GOOG_D'
    WHEN  2 THEN 'GOOG_S'
    WHEN  3 THEN 'QUOR'
    WHEN  5 THEN 'GOOG_VID'
    WHEN  6 THEN 'GOOG_PMAX'
    WHEN  7 THEN 'GOOG_DMGN'
    WHEN  8 THEN 'TBLA'
    WHEN  9 THEN 'FBOK'
    WHEN 10 THEN 'TKTK'
    WHEN 11 THEN 'LINK_SIM'
    WHEN 12 THEN 'GOOG_AIMX'
    WHEN 13 THEN 'LINK_SUP'
    WHEN 15 THEN 'SWT_GR'
    WHEN 16 THEN 'SWT_GR_V4'
    WHEN 20 THEN 'MSFT_S'
    WHEN 21 THEN 'MSFT_AUD'
    WHEN 22 THEN 'MSFT_PMAX'
    WHEN 30 THEN 'YHOO_SD'
    WHEN 40 THEN 'OPEN_AI'
    WHEN 90 THEN 'SEOP'
    WHEN 91 THEN 'EMAL'
    WHEN 99 THEN 'ORGC'
    WHEN NULL THEN NULL
    ELSE CONCAT('CH_', CAST(c AS STRING))
  END
);

CREATE OR REPLACE TABLE
  `variant-finance-data-project.Sticky_Data.Third_Cancellation_Resubscribers`
PARTITION BY cohort_month
CLUSTER BY App_Name, channel_code
OPTIONS (
  description = "Post-cancellation repurchase curve by App x AFID_Channel x churn month, for each customer's THIRD inferred churn per app. Churn is inferred (expected next bill date passed with no further order in the chain), so this table RESTATES on every rebuild as chains in dunning recover. This cohort is a SUBSET of the second-cancellation table's repurchasers, itself a subset of the first table's -- do not read its shares against the original first-cancellation population. Cells are thin; roll up to app or quarter. AFID_Channel is the acquisition channel of the chain that produced the third churn. Censored bands are NULL, not zero."
)
AS
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
    UPPER(TRIM(IFNULL(Spend_Country_Code_AFID,''))) AS spend_country,
    SAFE_CAST(AFID_CHANNEL AS INT64) AS afid_channel
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Final_Order_Status = 2
    AND IFNULL(LOWER(Test), '0') NOT IN ('1','true','yes')
),

-- spend country AND acquisition channel taken from the chain's
-- FIRST order (single pass, one ROW_NUMBER for both attributes)
chain_attrs AS (
  SELECT Customer_Number, chain_id, spend_country, afid_channel
  FROM (
    SELECT Customer_Number, chain_id, spend_country, afid_channel,
           ROW_NUMBER() OVER (
             PARTITION BY Customer_Number, chain_id
             ORDER BY Date_of_Sale, billing_cycle, Order_Id) AS rn
    FROM base
  )
  WHERE rn = 1
),

chain_starts AS (
  SELECT App_Name, Customer_Number, chain_id, MIN(Date_of_Sale) AS chain_start
  FROM base GROUP BY 1,2,3
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
    st.chain_start,
    c.spend_country,
    c.afid_channel,
    DATE_ADD(e.last_bill_date,
      INTERVAL IF(IFNULL(e.last_bc, 1) = 0, e.trial_period, e.reg_bc_period) DAY) AS churn_date
  FROM chain_end e
  LEFT JOIN chain_attrs c
    ON e.Customer_Number = c.Customer_Number AND e.chain_id = c.chain_id
  LEFT JOIN chain_starts st
    ON st.Customer_Number = e.Customer_Number AND st.chain_id = e.chain_id
  WHERE DATE_ADD(e.last_bill_date,
          INTERVAL IF(IFNULL(e.last_bc, 1) = 0, e.trial_period, e.reg_bc_period) DAY)
        < CURRENT_DATE()
),

-- ***** THIRD churn per customer + app *****
-- (the first-cancellation table uses rn = 1, the second rn = 2)
-- prev_churn_date is carried so concurrency can be filtered out.
third_churn AS (
  SELECT * EXCEPT(rn, prev_churn_date) FROM (
    SELECT *,
      ROW_NUMBER() OVER w    AS rn,
      LAG(churn_date) OVER w AS prev_churn_date
    FROM churned
    WINDOW w AS (
      PARTITION BY Customer_Number, App_Name
      ORDER BY churn_date, chain_id
    )
  )
  WHERE rn = 3
    -- STRICT CYCLE DEFINITION (optional): uncomment to exclude
    -- concurrent overlapping chains and count only genuine
    -- return-then-churn-again cycles.
    -- AND chain_start > prev_churn_date
),

-- earliest same-app repurchase after the third churn
repurchase AS (
  SELECT
    f.Customer_Number, f.App_Name, f.churn_date,
    MIN(s.chain_start) AS repurchase_date
  FROM third_churn f
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
    -- code retained purely for numeric ordering; not displayed
    f.afid_channel                  AS channel_code,
    channel_name(f.afid_channel)    AS AFID_Channel,
    DATE_TRUNC(f.churn_date, MONTH) AS cohort_month,
    f.Customer_Number,
    DATE_DIFF(r.repurchase_date, f.churn_date, DAY) AS days_to_repurchase
  FROM third_churn f
  LEFT JOIN repurchase r
    ON  r.Customer_Number = f.Customer_Number
    AND r.App_Name        = f.App_Name
    AND r.churn_date      = f.churn_date
)

-- ---------------- FINAL OUTPUT ----------------
SELECT
  cohort_month,                                       -- real DATE, for filtering/partitioning
  FORMAT_DATE('%b-%y', cohort_month)     AS Month,    -- display label only
  App_Name,
  channel_code,
  AFID_Channel,
  COUNT(DISTINCT Customer_Number)        AS Third_Time_Cancelled,

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
           COUNT(DISTINCT Customer_Number)), 4), NULL)               AS Share_Total_730d,

  -- stamped because this table restates: two rebuilds on different
  -- days will not agree, and you need to know which run a figure came from
  CURRENT_TIMESTAMP()                                                AS Built_At
FROM cohort
WHERE cohort_month >= DATE '2024-01-01'
  AND cohort_month <  DATE_TRUNC(CURRENT_DATE(), MONTH)
GROUP BY cohort_month, App_Name, channel_code, AFID_Channel;
