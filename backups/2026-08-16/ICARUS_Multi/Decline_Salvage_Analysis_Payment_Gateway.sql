-- =============================================================================
-- DECLINE & SALVAGE ANALYSIS V1.0
-- =============================================================================
--
-- PURPOSE:
--   Reuses the V2.6 rolling-cohort selection logic to measure decline rates,
--   decline fault classification (Customer vs Platform), retry/salvage engine
--   effectiveness, and gross/net retention — all at the grain of:
--
--     Report_Date × Product_Name_Final_Merged × App_Name × Gateway_Id × Payment × Billing_Cycle
--
-- DESIGN DECISIONS:
--   1. Gateway_Id is locked at the ANCHOR BC (Option A), like Payment.
--   2. 7K cap applies per Gateway_Id × Payment sub-cohort.
--   3. Decline_Users = Attempted_Users - Approved_Users (arithmetic).
--   4. Decline fault: Platform takes absolute priority — if even ONE platform-
--      fault decline exists for a user, they are Decline_Users_Platform.
--      Only if ALL declines are customer-fault → Decline_Users_Customer.
--   5. Salvage_Engine_Users: any transaction at target BC with Retry_Attempt > 1
--      at the Updated_Cust_ID level.
--   6. Salvaged_Users: subset of Salvage_Engine_Users with ≥1 approved order.
--   7. Gross_Retention_Rate: cumulative product of (Approved / Cohort_Size),
--      excluding refund/chargeback deductions.
--   8. Net_Retention_Rate: Gross_Retention_Rate - Refund_Ratio (blank for now).
--   9. All counts use DISTINCT Updated_Cust_ID.
--
-- =============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Decline_Salvage_Analysis_Payment_Gateway` AS

WITH

-- =============================================================================
-- CONFIG
-- =============================================================================
config AS (
  SELECT
    50 AS min_cohort_size
),

-- =============================================================================
-- REPORT DATES: 2025-01-01 to yesterday
-- =============================================================================
report_dates AS (
  SELECT report_date
  FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2025-01-01'), CURRENT_DATE() - 1, INTERVAL 1 DAY)
  ) AS report_date
),

-- =============================================================================
-- BILLING CYCLES: BC0 through BC4
-- =============================================================================
billing_cycles AS (
  SELECT bc FROM UNNEST(GENERATE_ARRAY(0, 4)) AS bc
),

-- =============================================================================
-- BASE DATA
-- =============================================================================
base_data AS (
  SELECT
    CL.* EXCEPT(Product_Name_Final, Product_Name_Final_Merged),
    CL.Product_Name_Final AS Product_Name_Final_Original,
    CL.Product_Name_Final_Merged AS Product_Name_Final,
    COALESCE(plan_map.`Delay days`, 30) AS Regular_BC_period,
    -- Country segment
    CASE
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID <> 'JP' THEN 'Non-JP'
      ELSE 'ALL'
    END AS Country_Segment,
    -- Modified App_Name
    CASE
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID <> 'JP' THEN 'CT-Non-JP'
      ELSE CL.App_Name
    END AS App_Name_Modified
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` CL
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` plan_map
    ON CL.Product_Name_Final = plan_map.`Plan Name`
  WHERE CL.Trial_Type <> 'SS'
),

-- =============================================================================
-- ANCHOR ATTRIBUTES: Payment + Gateway_Id locked at anchor BC
-- Priority: most recent approved transaction; fallback to most recent overall
-- =============================================================================
anchor_attributes_deduped AS (
  SELECT
    Updated_Cust_ID,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id
  FROM (
    SELECT
      Updated_Cust_ID,
      Product_Name_Final,
      Country_Segment,
      Payment,
      Gateway_Id,
      ROW_NUMBER() OVER (
        PARTITION BY Updated_Cust_ID, Product_Name_Final, Country_Segment
        ORDER BY
          CASE WHEN Final_Order_Status IN (2, 6, 8) THEN 0 ELSE 1 END,
          Date_of_Sale DESC
      ) AS rn
    FROM base_data
    WHERE
      (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
      OR (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
  )
  WHERE rn = 1
),

-- =============================================================================
-- PRODUCT TRIAL INFO
-- =============================================================================
product_trial_info AS (
  SELECT
    Product_Name_Final,
    MAX(Trial_Period) AS Trial_Period,
    MAX(Entity_Name) AS Entity_Name,
    MAX(App_Name) AS App_Name,
    MAX(Trial_Type) AS Trial_Type
  FROM base_data
  WHERE
    (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
    OR (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
  GROUP BY Product_Name_Final
),

-- =============================================================================
-- SEGMENTS: Product + Country (NO Payment/Gateway — same grid strategy as V2.6)
-- =============================================================================
segments AS (
  SELECT DISTINCT
    p.Product_Name_Final,
    p.Entity_Name,
    CASE
      WHEN p.App_Name = 'CT' AND b.Country_Segment = 'JP' THEN 'CT-JP'
      WHEN p.App_Name = 'CT' AND b.Country_Segment = 'Non-JP' THEN 'CT-Non-JP'
      ELSE p.App_Name
    END AS App_Name,
    p.Trial_Type,
    p.Trial_Period,
    COALESCE(plan_map.`Delay days`, 30) AS Regular_BC_period,
    b.Country_Segment
  FROM product_trial_info p
  CROSS JOIN (
    SELECT DISTINCT
      Product_Name_Final,
      Country_Segment
    FROM base_data
  ) b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` plan_map
    ON p.Product_Name_Final = plan_map.`Plan Name`
  WHERE b.Product_Name_Final = p.Product_Name_Final
),

-- =============================================================================
-- ANALYSIS GRID: report_date × segment × billing_cycle
-- =============================================================================
analysis_grid AS (
  SELECT
    rd.report_date,
    s.Product_Name_Final,
    s.Entity_Name,
    s.App_Name,
    s.Trial_Type,
    s.Trial_Period,
    s.Regular_BC_period,
    s.Country_Segment,
    bc.bc AS Billing_Cycle,
    30 AS Retry_Engine_Period,
    30 AS Limiting_Days,

    -- BC_start_date
    CASE
      WHEN bc.bc = 0 THEN rd.report_date
      WHEN bc.bc = 1 AND s.Trial_Type <> 'NT' THEN
        DATE_SUB(rd.report_date, INTERVAL (s.Trial_Period + 30) DAY)
      WHEN bc.bc = 1 AND s.Trial_Type = 'NT' THEN rd.report_date
      ELSE DATE_SUB(rd.report_date, INTERVAL (s.Regular_BC_period + 30) DAY)
    END AS BC_start_date,

    -- Base BC
    CASE
      WHEN bc.bc = 0 THEN 0
      WHEN bc.bc = 1 AND s.Trial_Type = 'NT' THEN 1
      ELSE bc.bc - 1
    END AS base_bc_updated,

    -- Target BC
    bc.bc AS target_bc_updated

  FROM report_dates rd
  CROSS JOIN segments s
  CROSS JOIN billing_cycles bc
  WHERE NOT (s.Trial_Type = 'NT' AND bc.bc = 0)
),

-- =============================================================================
-- STEP A: Deduplicate to one row per customer per segment
-- Attach anchor Payment + Gateway_Id
-- =============================================================================
base_customers_deduped AS (
  SELECT
    ag.report_date,
    ag.Product_Name_Final,
    ag.Country_Segment,
    aa.Payment,
    aa.Gateway_Id,
    ag.Billing_Cycle,
    ag.BC_start_date,
    ag.Limiting_Days,
    ag.base_bc_updated,
    ag.target_bc_updated,
    ag.Entity_Name,
    ag.App_Name,
    ag.Trial_Type,
    ag.Trial_Period,
    ag.Regular_BC_period,
    ag.Retry_Engine_Period,
    bd.Updated_Cust_ID,
    MAX(bd.Date_of_Sale) AS Latest_Date_of_Sale
  FROM analysis_grid ag
  INNER JOIN base_data bd
    ON bd.Product_Name_Final = ag.Product_Name_Final
    AND bd.Country_Segment = ag.Country_Segment
    AND bd.Billing_Cycle_Updated = ag.base_bc_updated
    AND bd.Date_of_Sale <= ag.BC_start_date
  -- Attach anchor attributes (Payment + Gateway_Id)
  INNER JOIN anchor_attributes_deduped aa
    ON aa.Updated_Cust_ID = bd.Updated_Cust_ID
    AND aa.Product_Name_Final = bd.Product_Name_Final
    AND aa.Country_Segment = bd.Country_Segment
  WHERE
    -- Anchor: no pre-filter
    (ag.Billing_Cycle = 0 AND ag.Trial_Type <> 'NT')
    OR (ag.Billing_Cycle = 1 AND ag.Trial_Type = 'NT')
    OR (
      -- Retention steps: pre-filter to clean approved
      (
        (ag.Trial_Type <> 'NT' AND ag.Billing_Cycle > 0)
        OR (ag.Trial_Type = 'NT' AND ag.Billing_Cycle > 1)
      )
      AND bd.Final_Order_Status IN (2, 6, 8)
      AND COALESCE(bd.Is_Refund, 'no') <> 'yes'
      AND COALESCE(bd.Is_Chargeback, '0') <> '1'
    )
  GROUP BY
    ag.report_date,
    ag.Product_Name_Final,
    ag.Country_Segment,
    aa.Payment,
    aa.Gateway_Id,
    ag.Billing_Cycle,
    ag.BC_start_date,
    ag.Limiting_Days,
    ag.base_bc_updated,
    ag.target_bc_updated,
    ag.Entity_Name,
    ag.App_Name,
    ag.Trial_Type,
    ag.Trial_Period,
    ag.Regular_BC_period,
    ag.Retry_Engine_Period,
    bd.Updated_Cust_ID
),

-- =============================================================================
-- RANK: per Gateway_Id × Payment sub-cohort (7K cap)
-- =============================================================================
base_cohort_ranked AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY
        report_date,
        Product_Name_Final,
        Country_Segment,
        Payment,
        Gateway_Id,
        Billing_Cycle
      ORDER BY Latest_Date_of_Sale DESC
    ) AS rn
  FROM base_customers_deduped
),

-- =============================================================================
-- STEP B: 7K cap per Gateway_Id × Payment, compute BC_end_date
-- =============================================================================
cohort_bounds AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id,
    Billing_Cycle,
    BC_start_date,
    Limiting_Days,
    COUNT(*) AS total_unique_customers_in_7k,
    MIN(Latest_Date_of_Sale) AS oldest_transaction_date,
    DATE_SUB(BC_start_date, INTERVAL Limiting_Days DAY) AS threshold_date,
    CASE
      WHEN COUNT(*) >= 7000
        AND MIN(Latest_Date_of_Sale) > DATE_SUB(BC_start_date, INTERVAL Limiting_Days DAY)
      THEN MIN(Latest_Date_of_Sale)
      ELSE DATE_SUB(BC_start_date, INTERVAL Limiting_Days DAY)
    END AS BC_end_date
  FROM base_cohort_ranked
  WHERE rn <= 7000
  GROUP BY
    report_date,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id,
    Billing_Cycle,
    BC_start_date,
    Limiting_Days
),

-- =============================================================================
-- STEP C: Final cohort customers with BC_end_date filter
-- =============================================================================
cohort_customer_ids AS (
  SELECT
    bcr.report_date,
    bcr.Product_Name_Final,
    bcr.Country_Segment,
    bcr.Payment,
    bcr.Gateway_Id,
    bcr.Billing_Cycle,
    bcr.BC_start_date,
    cb.BC_end_date,
    bcr.Entity_Name,
    bcr.App_Name,
    bcr.Trial_Type,
    bcr.Trial_Period,
    bcr.Regular_BC_period,
    bcr.Retry_Engine_Period,
    bcr.Limiting_Days,
    bcr.base_bc_updated,
    bcr.target_bc_updated,
    bcr.Updated_Cust_ID
  FROM base_cohort_ranked bcr
  INNER JOIN cohort_bounds cb
    ON bcr.report_date = cb.report_date
    AND bcr.Product_Name_Final = cb.Product_Name_Final
    AND bcr.Country_Segment = cb.Country_Segment
    AND bcr.Payment = cb.Payment
    AND bcr.Gateway_Id = cb.Gateway_Id
    AND bcr.Billing_Cycle = cb.Billing_Cycle
  WHERE bcr.rn <= 7000
    AND bcr.Latest_Date_of_Sale >= cb.BC_end_date
),

-- =============================================================================
-- STEP D: Distinct cohort customers (denominator)
-- =============================================================================
cohort_customers AS (
  SELECT DISTINCT
    report_date,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id,
    Billing_Cycle,
    BC_start_date,
    BC_end_date,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Regular_BC_period,
    Retry_Engine_Period,
    Limiting_Days,
    target_bc_updated,
    Updated_Cust_ID
  FROM cohort_customer_ids
),

-- =============================================================================
-- STEP E: Target BC transactions — pre-aggregate per customer at target BC
-- Does NOT filter on Payment or Gateway_Id (Option A — track regardless)
-- =============================================================================
target_customer_summary AS (
  SELECT
    Updated_Cust_ID,
    Product_Name_Final,
    Country_Segment,
    Billing_Cycle_Updated,

    -- Attempted: has any row
    1 AS is_attempted,

    -- Approved: at least one approved status
    MAX(CASE WHEN Final_Order_Status IN (2, 6, 8) THEN 1 ELSE 0 END) AS has_approved,

    -- Salvage engine: any transaction with Retry_Attempt > 1
    MAX(CASE WHEN SAFE_CAST(Retry_Attempt AS INT64) > 1 THEN 1 ELSE 0 END) AS has_retry,

    -- Platform fault: any declined transaction with Platform fault
    MAX(CASE
      WHEN Final_Order_Status NOT IN (2, 6, 8)
        AND drf.Fault = 'Platform'
      THEN 1
      ELSE 0
    END) AS has_platform_fault,

    -- Customer fault: any declined transaction with Customer fault
    MAX(CASE
      WHEN Final_Order_Status NOT IN (2, 6, 8)
        AND drf.Fault = 'Customer'
      THEN 1
      ELSE 0
    END) AS has_customer_fault,

    -- Transaction counts
    COUNT(*) AS attempted_transaction_count,
    COUNTIF(Final_Order_Status IN (2, 6, 8)) AS approved_transaction_count

  FROM base_data bd
  LEFT JOIN `variant-finance-data-project.Daedalus.Dim_Decline_Reason_Fault_Category` drf
    ON bd.Decline_Reason_Category = drf.Final_Category
  GROUP BY
    Updated_Cust_ID,
    Product_Name_Final,
    Country_Segment,
    Billing_Cycle_Updated
),

-- =============================================================================
-- STEP F: Join cohort to target, classify each customer
-- =============================================================================
target_orders AS (
  SELECT
    cc.report_date,
    cc.Product_Name_Final,
    cc.Country_Segment,
    cc.Payment,
    cc.Gateway_Id,
    cc.Billing_Cycle,
    cc.BC_start_date,
    cc.BC_end_date,
    cc.Entity_Name,
    cc.App_Name,
    cc.Trial_Type,
    cc.Trial_Period,
    cc.Regular_BC_period,
    cc.Retry_Engine_Period,
    cc.Limiting_Days,
    cc.Updated_Cust_ID,

    -- Attempted
    CASE WHEN tgt.is_attempted = 1 THEN 1 ELSE 0 END AS is_attempted,

    -- Approved
    COALESCE(tgt.has_approved, 0) AS is_approved,

    -- Declined = attempted but never approved
    CASE
      WHEN tgt.is_attempted = 1 AND COALESCE(tgt.has_approved, 0) = 0
      THEN 1 ELSE 0
    END AS is_declined,

    -- Decline fault classification (only for declined users)
    -- Platform takes priority: even one platform fault → Platform
    CASE
      WHEN tgt.is_attempted = 1
        AND COALESCE(tgt.has_approved, 0) = 0
        AND tgt.has_platform_fault = 1
      THEN 1 ELSE 0
    END AS is_decline_platform,

    -- Customer fault only if zero platform faults
    CASE
      WHEN tgt.is_attempted = 1
        AND COALESCE(tgt.has_approved, 0) = 0
        AND COALESCE(tgt.has_platform_fault, 0) = 0
        AND tgt.has_customer_fault = 1
      THEN 1 ELSE 0
    END AS is_decline_customer,

    -- Salvage engine user: any retry attempt > 1
    CASE
      WHEN tgt.is_attempted = 1 AND COALESCE(tgt.has_retry, 0) = 1
      THEN 1 ELSE 0
    END AS is_salvage_engine,

    -- Salvaged: salvage engine user who got approved
    CASE
      WHEN tgt.is_attempted = 1
        AND COALESCE(tgt.has_retry, 0) = 1
        AND COALESCE(tgt.has_approved, 0) = 1
      THEN 1 ELSE 0
    END AS is_salvaged,

    -- Transaction counts
    COALESCE(tgt.attempted_transaction_count, 0) AS attempted_transaction_count,
    COALESCE(tgt.approved_transaction_count, 0) AS approved_transaction_count

  FROM cohort_customers cc
  LEFT JOIN target_customer_summary tgt
    ON cc.Updated_Cust_ID = tgt.Updated_Cust_ID
    AND cc.Product_Name_Final = tgt.Product_Name_Final
    AND cc.Country_Segment = tgt.Country_Segment
    AND tgt.Billing_Cycle_Updated = cc.target_bc_updated
),

-- =============================================================================
-- STEP G: Aggregate metrics per grid row
-- =============================================================================
aggregated_metrics AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id,
    Billing_Cycle,
    BC_start_date,
    BC_end_date,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Regular_BC_period,
    Retry_Engine_Period,
    Limiting_Days,

    -- Cohort Size
    COUNT(DISTINCT Updated_Cust_ID) AS Cohort_Size,

    -- Attempted
    COUNT(DISTINCT CASE WHEN is_attempted = 1 THEN Updated_Cust_ID END) AS Attempted_Users,

    -- Approved
    COUNT(DISTINCT CASE WHEN is_approved = 1 THEN Updated_Cust_ID END) AS Approved_Users,

    -- Declined (attempted - approved, but computed directly for verification)
    COUNT(DISTINCT CASE WHEN is_declined = 1 THEN Updated_Cust_ID END) AS Decline_Users,

    -- Decline by fault
    COUNT(DISTINCT CASE WHEN is_decline_platform = 1 THEN Updated_Cust_ID END) AS Decline_Users_Platform,
    COUNT(DISTINCT CASE WHEN is_decline_customer = 1 THEN Updated_Cust_ID END) AS Decline_Users_Customer,

    -- Salvage
    COUNT(DISTINCT CASE WHEN is_salvage_engine = 1 THEN Updated_Cust_ID END) AS Salvage_Engine_Users,
    COUNT(DISTINCT CASE WHEN is_salvaged = 1 THEN Updated_Cust_ID END) AS Salvaged_Users,

    -- Transaction counts
    SUM(CASE WHEN is_attempted = 1 THEN attempted_transaction_count ELSE 0 END) AS Attempted_Retry_Count,
    SUM(CASE WHEN is_attempted = 1 THEN approved_transaction_count ELSE 0 END) AS Approved_Retry_Count

  FROM target_orders
  GROUP BY
    report_date,
    Product_Name_Final,
    Country_Segment,
    Payment,
    Gateway_Id,
    Billing_Cycle,
    BC_start_date,
    BC_end_date,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Regular_BC_period,
    Retry_Engine_Period,
    Limiting_Days
),

-- =============================================================================
-- STEP H: Compute rates and cumulative gross retention
-- =============================================================================
retention_calc AS (
  SELECT
    *,

    -- Approval Rate
    SAFE_DIVIDE(Approved_Users, Attempted_Users) AS Approval_Rate,

    -- Attempt Rate
    SAFE_DIVIDE(Attempted_Users, Cohort_Size) AS Attempt_Rate,

    -- Total Decline Percentage
    SAFE_DIVIDE(Decline_Users, Attempted_Users) AS Total_Decline_Percentage,

    -- Platform Decline Percentage (of all declines)
    SAFE_DIVIDE(Decline_Users_Platform, Decline_Users) AS Platform_Decline_Percentage,

    -- Per-cycle gross survival (no refund/CB deduction)
    CASE
      WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1)
        OR (Trial_Type <> 'NT' AND Billing_Cycle = 0)
      THEN SAFE_DIVIDE(Approved_Users, Approved_Users)  -- = 1 at anchor
      ELSE SAFE_DIVIDE(Approved_Users, Cohort_Size)
    END AS gross_survival

  FROM aggregated_metrics
),

cumulative_retention AS (
  SELECT
    *,

    -- Cumulative Gross Retention Rate (running product of gross_survival)
    EXP(SUM(LN(CASE WHEN gross_survival > 0 THEN gross_survival ELSE NULL END)) OVER (
      PARTITION BY report_date, Product_Name_Final, Country_Segment, Payment, Gateway_Id
      ORDER BY Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )) AS Gross_Retention_Rate

  FROM retention_calc
)

-- =============================================================================
-- FINAL OUTPUT
-- =============================================================================
SELECT
  cr.report_date AS Report_Date,
  cr.Product_Name_Final,
  cr.Billing_Cycle,
  cr.Entity_Name,
  cr.App_Name,
  cr.Trial_Type,
  cr.Trial_Period,
  cr.Regular_BC_period,
  cr.Country_Segment AS Country_Code,

  -- Gateway with alias lookup
  cr.Gateway_Id,
  gw.Gateway_Alias AS Gateway,

  -- Payment
  cr.Payment,

  -- Cohort window
  cr.BC_start_date,
  cr.BC_end_date,
  cr.Limiting_Days,

  -- Is_Salvage (hardcoded Yes for now)
  'Yes' AS Is_Salvage,

  -- Cohort
  cr.Cohort_Size,

  -- Core metrics (distinct users)
  cr.Attempted_Users,
  cr.Approved_Users,
  cr.Decline_Users,
  cr.Decline_Users_Customer,
  cr.Decline_Users_Platform,
  cr.Salvage_Engine_Users,
  cr.Salvaged_Users,

  -- Transaction counts
  cr.Attempted_Retry_Count,
  cr.Approved_Retry_Count,

  -- Rates
  cr.Approval_Rate,
  cr.Attempt_Rate,
  cr.Total_Decline_Percentage,
  cr.Platform_Decline_Percentage,
  cr.Gross_Retention_Rate,

  -- Refund_Ratio (placeholder)
  CAST(NULL AS FLOAT64) AS Refund_Ratio,

  -- Net_Retention_Rate = Gross - Refund (NULL for now)
  CAST(NULL AS FLOAT64) AS Net_Retention_Rate,

  -- Active/Inactive Status
  CASE
    WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
    ELSE 'Inactive'
  END AS Active_Inactive_Status

FROM cumulative_retention cr

-- Gateway alias lookup: match on Gateway_Id AND Entity_Name
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Gateways` gw
  ON SAFE_CAST(cr.Gateway_Id AS INT64) = gw.Gateway_ID
  AND cr.Entity_Name = gw.Entity

-- Active/Inactive lookup
LEFT JOIN (
  SELECT DISTINCT App_Name, Product_Name_Final
  FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
) ap
  ON cr.App_Name = ap.App_Name
  AND cr.Product_Name_Final = ap.Product_Name_Final

WHERE cr.Cohort_Size >= (SELECT min_cohort_size FROM config)

ORDER BY
  Report_Date,
  Product_Name_Final,
  Country_Code,
  Gateway_Id,
  Payment,
  Billing_Cycle
;
