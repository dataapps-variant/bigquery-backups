-- job_id: scheduled_query_6a97a217-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:00:15.921000+00:00
-- started: 2026-08-02T09:00:16.307000+00:00
-- ended: 2026-08-02T09:03:45.007000+00:00

-- =============================================================================
-- RETENTION ANALYSIS V2.7: BC0 through BC12 with Rolling Cohorts
-- AFID_CHANNEL-level analysis (swapped in for Payment-level in V2.6)
-- =============================================================================
--
-- CHANGES FROM V2.6 (Payment) TO V2.7 (AFID_CHANNEL):
--   1. Grain swapped: Payment → AFID_CHANNEL
--      Report_Date × Product_Name_Final × Billing_Cycle × App_Name
--      × Country_Code × AFID_CHANNEL
--   2. AFID_CHANNEL is determined at the ANCHOR BC (BC0 for non-NT, BC1 for NT)
--      and carried forward to all subsequent BCs (Option B).
--      (AFID_CHANNEL can differ across a customer's transactions, so the anchor
--       logic is meaningful — same rationale as Payment in V2.6.)
--   3. NULL AFID_CHANNEL values are mapped to 80 — normalized at base_data
--      level so the value propagates everywhere consistently.
--   4. ARPU source switched from Final_Table (product-level) to
--      Final_Table_App_AFID_Level (app × country × AFID × BC level).
--      Join keys rebuilt accordingly:
--        - Un-modify App_Name: CT-JP / CT-Non-JP → CT
--        - Country = Country_Segment (JP / Non-JP / ALL)
--        - AFID = AFID_CHANNEL
--   5. Output table renamed: Retention_Approval_Analysis_AFID_Channel
--
-- PERFORMANCE NOTE (carried from V2.6):
--   AFID_CHANNEL is NOT added to the segments/analysis_grid cross join.
--   It is attached as a label in base_customers_deduped via
--   anchor_afid_channel_deduped, avoiding grid multiplication.
--
-- =============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_AFID_Channel` AS

WITH

-- =============================================================================
-- CONFIG: Adjustable inputs
-- =============================================================================
config AS (
  SELECT
    50 AS min_cohort_size   -- Exclude rows where Cohort_Size is below this value
),

-- =============================================================================
-- REPORT DATES: Generate all dates from 2025-01-01 to today
-- =============================================================================
report_dates AS (
  SELECT report_date
  FROM UNNEST(
    GENERATE_DATE_ARRAY(DATE('2025-01-01'), CURRENT_DATE()-1, INTERVAL 1 DAY)
  ) AS report_date
),

-- =============================================================================
-- BILLING CYCLES: BC0 through BC4 (keeping same range as V2.6)
-- =============================================================================
billing_cycles AS (
    SELECT bc FROM UNNEST(GENERATE_ARRAY(0, 4)) AS bc
),

-- =============================================================================
-- BASE DATA: Normalize NULL AFID_CHANNEL → 80 here so it propagates everywhere
-- SWAP: Product_Name_Final_Merged → Product_Name_Final
-- =============================================================================
base_data AS (
  SELECT
    CL.* EXCEPT(Product_Name_Final, Product_Name_Final_Merged, AFID_CHANNEL),
    CL.Product_Name_Final AS Product_Name_Final_Original,
    CL.Product_Name_Final_Merged AS Product_Name_Final,
    -- V2.7: NULL AFID_CHANNEL → 80
    COALESCE(CL.AFID_CHANNEL, 80) AS AFID_CHANNEL,
    -- Regular BC period from SOTDays map
    COALESCE(plan_map.`Delay days`, 30) AS Regular_BC_period,
    -- Country segment for internal grouping
    CASE
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN CL.App_Name = 'CT' AND CL.Spend_Country_Code_AFID <> 'JP' THEN 'Non-JP'
      ELSE 'ALL'
    END AS Country_Segment,
    -- Modified App_Name: CT-JP / CT-Non-JP for CT products
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
-- ANCHOR AFID_CHANNEL
-- Priority: most recent approved transaction; fallback to most recent overall
-- =============================================================================
anchor_afid_channel_deduped AS (
  SELECT
    Updated_Cust_ID,
    Product_Name_Final,
    Country_Segment,
    AFID_CHANNEL
  FROM (
    SELECT
      Updated_Cust_ID,
      Product_Name_Final,
      Country_Segment,
      AFID_CHANNEL,
      ROW_NUMBER() OVER (
        PARTITION BY Updated_Cust_ID, Product_Name_Final, Country_Segment
        ORDER BY
          -- Prefer approved transactions
          CASE WHEN Final_Order_Status IN (2, 6, 8) THEN 0 ELSE 1 END,
          -- Then most recent
          Date_of_Sale DESC
      ) AS rn
    FROM base_data
    WHERE
      -- Anchor BC rows only
      (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
      OR (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
  )
  WHERE rn = 1
),

-- =============================================================================
-- PRODUCT TRIAL INFO: Get MAX(Trial_Period) per Product_Name_Final
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
-- SEGMENTS: Unique Product + Country segments (NO AFID_CHANNEL — same as V2.5)
-- AFID_CHANNEL introduced later via anchor_afid_channel_deduped
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
-- CROSS JOIN: All combinations of report_date × segment × billing_cycle
-- NO AFID_CHANNEL here — grid stays same size as V2.5/V2.6
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

    -- BC_start_date calculation
    CASE
      WHEN bc.bc = 0 THEN rd.report_date
      WHEN bc.bc = 1 AND s.Trial_Type <> 'NT' THEN
        DATE_SUB(rd.report_date, INTERVAL (s.Trial_Period + 30) DAY)
      WHEN bc.bc = 1 AND s.Trial_Type = 'NT' THEN rd.report_date
      ELSE DATE_SUB(rd.report_date, INTERVAL (s.Regular_BC_period + 30) DAY)
    END AS BC_start_date,

    -- Base BC (previous cycle) Billing_Cycle_Updated value
    CASE
      WHEN bc.bc = 0 THEN 0
      WHEN bc.bc = 1 AND s.Trial_Type = 'NT' THEN 1
      ELSE bc.bc - 1
    END AS base_bc_updated,

    -- Target (current cycle) Billing_Cycle_Updated value
    bc.bc AS target_bc_updated

  FROM report_dates rd
  CROSS JOIN segments s
  CROSS JOIN billing_cycles bc
  WHERE NOT (s.Trial_Type = 'NT' AND bc.bc = 0)  -- NT has no BC0
),

-- =============================================================================
-- STEP A: Deduplicate to one row per customer per segment
-- V2.7: Join to anchor_afid_channel_deduped to LABEL each customer with their
--       anchor AFID_CHANNEL. Grid does NOT have AFID_CHANNEL — introduced here.
-- =============================================================================
base_customers_deduped AS (
  SELECT
    ag.report_date,
    ag.Product_Name_Final,
    ag.Country_Segment,
    ap.AFID_CHANNEL,             -- V2.7: AFID_CHANNEL from anchor lookup
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
  -- V2.7: Attach anchor AFID_CHANNEL label to each customer
  INNER JOIN anchor_afid_channel_deduped ap
    ON ap.Updated_Cust_ID = bd.Updated_Cust_ID
    AND ap.Product_Name_Final = bd.Product_Name_Final
    AND ap.Country_Segment = bd.Country_Segment
  WHERE
    -- Anchor: no pre-filter (Non-NT BC0 or NT BC1)
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
    ap.AFID_CHANNEL,
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

-- Rank unique customers by most recent Date_of_Sale DESC
-- V2.7: AFID_CHANNEL added to PARTITION BY for per-AFID_CHANNEL 7K cap
base_cohort_ranked AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY
        report_date,
        Product_Name_Final,
        Country_Segment,
        AFID_CHANNEL,
        Billing_Cycle
      ORDER BY Latest_Date_of_Sale DESC
    ) AS rn
  FROM base_customers_deduped
),

-- =============================================================================
-- STEP B: Apply 7K cap per AFID_CHANNEL sub-cohort, compute BC_end_date
-- =============================================================================
cohort_bounds AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Segment,
    AFID_CHANNEL,
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
    AFID_CHANNEL,
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
    bcr.AFID_CHANNEL,
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
    AND bcr.AFID_CHANNEL = cb.AFID_CHANNEL
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
    AFID_CHANNEL,
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
-- STEP E: Match cohort customers to target BC orders
-- NOTE: Target subquery does NOT filter on AFID_CHANNEL (Option B — track
--       customer regardless of their channel at the target BC)
-- =============================================================================
target_orders AS (
  SELECT
    cc.report_date,
    cc.Product_Name_Final,
    cc.Country_Segment,
    cc.AFID_CHANNEL,
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

    -- ORIGINAL: Attempted (any target BC row)
    CASE WHEN tgt.Updated_Cust_ID IS NOT NULL THEN 1 ELSE 0 END AS is_attempted,

    -- ORIGINAL: Approved — has at least one approved status (2, 6, or 8)
    CASE
      WHEN tgt.has_approved_status = 1 THEN 1
      ELSE 0
    END AS is_approved,

    -- SPLIT: Refund only
    CASE
      WHEN tgt.has_approved_status = 1
        AND tgt.Is_Refund = 'yes' THEN 1
      ELSE 0
    END AS is_refunded,

    -- SPLIT: Chargeback only
    CASE
      WHEN tgt.has_approved_status = 1
        AND tgt.Is_Chargeback = '1' THEN 1
      ELSE 0
    END AS is_chargebacked,

    -- Retry counts
    COALESCE(tgt.attempted_transaction_count, 0) AS attempted_transaction_count,
    COALESCE(tgt.approved_transaction_count, 0) AS approved_transaction_count

  FROM cohort_customers cc
  LEFT JOIN (
    SELECT
      Updated_Cust_ID,
      Product_Name_Final,
      Country_Segment,
      Billing_Cycle_Updated,

      MAX(CASE WHEN Final_Order_Status IN (2, 6, 8) THEN 1 ELSE 0 END) AS has_approved_status,
      MAX(Is_Refund) AS Is_Refund,
      MAX(Is_Chargeback) AS Is_Chargeback,
      COUNT(*) AS attempted_transaction_count,
      COUNTIF(Final_Order_Status IN (2, 6, 8)) AS approved_transaction_count

    FROM base_data
    GROUP BY Updated_Cust_ID, Product_Name_Final, Country_Segment, Billing_Cycle_Updated
  ) tgt
    ON cc.Updated_Cust_ID = tgt.Updated_Cust_ID
    AND cc.Product_Name_Final = tgt.Product_Name_Final
    AND cc.Country_Segment = tgt.Country_Segment
    AND tgt.Billing_Cycle_Updated = cc.target_bc_updated
),

-- =============================================================================
-- STEP F: Aggregate metrics per grid row (now including AFID_CHANNEL)
-- =============================================================================
aggregated_metrics AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Segment,
    AFID_CHANNEL,
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

    -- Cohort Size (denominator)
    COUNT(DISTINCT Updated_Cust_ID) AS Cohort_Size,

    -- ORIGINAL: Attempted — distinct users
    COUNT(DISTINCT CASE WHEN is_attempted = 1 THEN Updated_Cust_ID END) AS Attempted_Users,

    -- ORIGINAL: Approved — distinct users
    COUNT(DISTINCT CASE WHEN is_approved = 1 THEN Updated_Cust_ID END) AS Approved_Users,

    -- SPLIT: Refund
    COUNT(DISTINCT CASE WHEN is_refunded = 1 THEN Updated_Cust_ID END) AS Refund_Users,

    -- SPLIT: Chargeback
    COUNT(DISTINCT CASE WHEN is_chargebacked = 1 THEN Updated_Cust_ID END) AS Chargeback_Users,

    -- Retry counts
    SUM(CASE WHEN is_attempted = 1 THEN attempted_transaction_count ELSE 0 END) AS Attempted_Retry_Count,
    SUM(CASE WHEN is_attempted = 1 THEN approved_transaction_count ELSE 0 END) AS Approved_Retry_Count

  FROM target_orders
  GROUP BY
    report_date,
    Product_Name_Final,
    Country_Segment,
    AFID_CHANNEL,
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
-- STEP G: Compute cumulative retention rates
-- V2.7: AFID_CHANNEL added to PARTITION BY
-- =============================================================================
retention_calc AS (
  SELECT
    *,
    SAFE_DIVIDE(Attempted_Users, Cohort_Size) AS gross_survival,
    CASE
      WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1)
        OR (Trial_Type <> 'NT' AND Billing_Cycle = 0)
      THEN SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Approved_Users)
      ELSE SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Cohort_Size)
    END AS net_survival
  FROM aggregated_metrics
),

cumulative_retention AS (
  SELECT
    *,

    -- Cumulative Attempt Rate
    SAFE_DIVIDE(Attempted_Users, Cohort_Size) AS Attempt_Rate,

    -- Cumulative Net Retention Rate
    EXP(SUM(LN(CASE WHEN net_survival > 0 THEN net_survival ELSE NULL END)) OVER (
      PARTITION BY report_date, Product_Name_Final, Country_Segment, AFID_CHANNEL
      ORDER BY Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )) AS Net_Retention_Rate

  FROM retention_calc
),

-- =============================================================================
-- STEP H: 3-day rolling averages, shown every 3rd day from 2025-04-09
-- V2.7: AFID_CHANNEL added to PARTITION BY
-- =============================================================================
avg_metrics AS (
  SELECT
    cr.*,

    -- Cohort_Size_Avg
    CASE
      WHEN MOD(DATE_DIFF(cr.report_date, DATE('2025-04-09'), DAY), 3) = 0
      THEN AVG(cr.Cohort_Size) OVER (
        PARTITION BY cr.Product_Name_Final, cr.App_Name, cr.Billing_Cycle, cr.AFID_CHANNEL
        ORDER BY cr.report_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      )
    END AS Cohort_Size_Avg,

    -- Approval_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.report_date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(SAFE_DIVIDE(cr.Approved_Users, cr.Attempted_Users) * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Approval_Rate_Avg,

    -- Attempt_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.report_date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(cr.Attempt_Rate * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Attempt_Rate_Avg,

    -- Net_Retention_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.report_date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(cr.Net_Retention_Rate * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Net_Retention_Rate_Avg

  FROM cumulative_retention cr
  WINDOW w AS (
    PARTITION BY cr.Product_Name_Final, cr.App_Name, cr.Billing_Cycle, cr.AFID_CHANNEL
    ORDER BY cr.report_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  )
)

-- =============================================================================
-- FINAL OUTPUT
-- =============================================================================
SELECT
  cr.report_date AS Report_Date,
  cr.Product_Name_Final,
  cr.Billing_Cycle,
  cr.Limiting_Days AS Limiting_days,
  cr.Retry_Engine_Period,
  cr.Entity_Name,
  cr.App_Name,
  cr.Trial_Type,
  cr.Trial_Period,
  cr.Regular_BC_period,
  cr.Country_Segment AS Country_Code,
  cr.AFID_CHANNEL,
  cr.BC_start_date,
  cr.BC_end_date,

  -- Cohort
  cr.Cohort_Size,

  -- Original metrics (distinct users)
  cr.Attempted_Users,
  cr.Approved_Users,
  cr.Refund_Users,
  cr.Chargeback_Users,

  -- Retry counts
  cr.Attempted_Retry_Count,
  cr.Approved_Retry_Count,

  -- Rates
  SAFE_DIVIDE(cr.Approved_Users, cr.Attempted_Users) AS Approval_Rate,
  cr.Attempt_Rate,
  cr.Net_Retention_Rate,

  -- Churn Rate
  CASE
    WHEN (cr.Trial_Type = 'NT' AND cr.Billing_Cycle = 1)
      OR (cr.Trial_Type <> 'NT' AND cr.Billing_Cycle = 0)
    THEN 1 - SAFE_DIVIDE((cr.Approved_Users - cr.Refund_Users - cr.Chargeback_Users), cr.Approved_Users)
    ELSE 1 - SAFE_DIVIDE((cr.Approved_Users - cr.Refund_Users - cr.Chargeback_Users), cr.Cohort_Size)
  END AS Churn_Rate,

  -- ARPU Retention Rates (V2.7: App × Country × AFID × BC level)
  ft.Gross_ARPU_Retention_Rate,
  ft.Net_ARPU_Retention_Rate,

  -- Active/Inactive Status
  CASE
    WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
    ELSE 'Inactive'
  END AS Active_Inactive_Status,

  -- 3-Day Rolling Averages
  cr.Cohort_Size_Avg,
  cr.Approval_Rate_Avg,
  cr.Attempt_Rate_Avg,
  cr.Net_Retention_Rate_Avg

FROM avg_metrics cr

-- =============================================================================
-- V2.7 ARPU lookup: Final_Table_App_AFID_Level
-- Join keys:
--   Reporting_Date = report_date
--   App_Name       = un-modified App_Name (CT-JP / CT-Non-JP → CT)
--   Country        = Country_Segment (JP / Non-JP / ALL)
--   AFID           = AFID_CHANNEL
--   BC             = Billing_Cycle
-- Filter: Table = 'Regular' AND Cohort = '7K_30D'
-- =============================================================================
LEFT JOIN (
  SELECT
    Reporting_Date,
    App_Name,
    Country,
    AFID,
    BC,
    Gross_ARPU_Retention_Rate,
    Net_ARPU_Retention_Rate
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level`
  WHERE `Table` = 'Regular' AND Cohort = '7K_30D'
) ft
  ON ft.Reporting_Date = cr.report_date
  AND ft.App_Name = CASE
    WHEN cr.App_Name IN ('CT-JP', 'CT-Non-JP') THEN 'CT'
    ELSE cr.App_Name
  END
  AND ft.Country = cr.Country_Segment
  AND ft.AFID = cr.AFID_CHANNEL
  AND ft.BC = cr.Billing_Cycle

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
  AFID_CHANNEL,
  Billing_Cycle
;
