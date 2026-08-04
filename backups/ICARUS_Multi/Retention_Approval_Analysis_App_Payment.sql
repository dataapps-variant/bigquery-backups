-- =============================================================================
-- RETENTION ANALYSIS V2.6 — APP-LEVEL ROLL-UP
-- =============================================================================
--
-- Grain: Report_Date × App_Name × Payment × Billing_Cycle
--
-- Source: Retention_Approval_Analysis_Payment (product-level grain)
--
-- Approach:
--   1. SUM all count columns grouped by App/Payment/BC
--   2. Recalculate all rates from summed counts
--   3. Net_Retention_Rate: BC0 uses Approved_Users as anchor denominator,
--      BC1+ uses Cohort_Size (Option A — simplified anchor rule)
--   4. Rolling averages recalculated at App grain
--
-- =============================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_App_Payment` AS

WITH

-- =============================================================================
-- CONFIG
-- =============================================================================
config AS (
  SELECT 50 AS min_cohort_size
),

-- =============================================================================
-- STEP 1: Aggregate counts from product-level to App-level
-- =============================================================================
app_aggregated AS (
  SELECT
    Report_Date,
    App_Name,
    Payment,
    Billing_Cycle,

    -- Summed counts
    SUM(Cohort_Size)              AS Cohort_Size,
    SUM(Attempted_Users)          AS Attempted_Users,
    SUM(Approved_Users)           AS Approved_Users,
    SUM(Refund_Users)             AS Refund_Users,
    SUM(Chargeback_Users)         AS Chargeback_Users,
    SUM(Attempted_Retry_Count)    AS Attempted_Retry_Count,
    SUM(Approved_Retry_Count)     AS Approved_Retry_Count

  FROM `variant-finance-data-project.ICARUS_Multi.Retention_Approval_Analysis_Payment`
  GROUP BY
    Report_Date,
    App_Name,
    Payment,
    Billing_Cycle
),

-- =============================================================================
-- STEP 2: Recalculate rates from summed counts
-- =============================================================================
retention_calc AS (
  SELECT
    *,

    -- Approval Rate
    SAFE_DIVIDE(Approved_Users, Attempted_Users) AS Approval_Rate,

    -- Attempt Rate
    SAFE_DIVIDE(Attempted_Users, Cohort_Size) AS Attempt_Rate,

    -- Net Survival (per-BC step)
    -- BC0: anchor denominator = Approved_Users
    -- BC1+: denominator = Cohort_Size
    CASE
      WHEN Billing_Cycle = 0
      THEN SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Approved_Users)
      ELSE SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Cohort_Size)
    END AS net_survival,

    -- Churn Rate (inverse of net_survival)
    CASE
      WHEN Billing_Cycle = 0
      THEN 1 - SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Approved_Users)
      ELSE 1 - SAFE_DIVIDE((Approved_Users - Refund_Users - Chargeback_Users), Cohort_Size)
    END AS Churn_Rate

  FROM app_aggregated
),

-- =============================================================================
-- STEP 3: Cumulative Net Retention Rate
-- =============================================================================
cumulative_retention AS (
  SELECT
    *,

    -- Cumulative Net Retention Rate (product of net_survival across BCs)
    EXP(SUM(LN(CASE WHEN net_survival > 0 THEN net_survival ELSE NULL END)) OVER (
      PARTITION BY Report_Date, App_Name, Payment
      ORDER BY Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )) AS Net_Retention_Rate

  FROM retention_calc
),

-- =============================================================================
-- STEP 4: 3-day rolling averages, shown every 3rd day from 2025-04-09
-- =============================================================================
avg_metrics AS (
  SELECT
    cr.*,

    -- Cohort_Size_Avg
    CASE
      WHEN MOD(DATE_DIFF(cr.Report_Date, DATE('2025-04-09'), DAY), 3) = 0
      THEN AVG(cr.Cohort_Size) OVER (
        PARTITION BY cr.App_Name, cr.Payment, cr.Billing_Cycle
        ORDER BY cr.Report_Date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      )
    END AS Cohort_Size_Avg,

    -- Approval_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.Report_Date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(cr.Approval_Rate * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Approval_Rate_Avg,

    -- Attempt_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.Report_Date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(cr.Attempt_Rate * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Attempt_Rate_Avg,

    -- Net_Retention_Rate_Avg: weighted by Cohort_Size
    CASE
      WHEN MOD(DATE_DIFF(cr.Report_Date, DATE('2025-04-09'), DAY), 3) = 0
      THEN SAFE_DIVIDE(
        SUM(cr.Net_Retention_Rate * cr.Cohort_Size) OVER w,
        SUM(cr.Cohort_Size) OVER w
      )
    END AS Net_Retention_Rate_Avg

  FROM cumulative_retention cr
  WINDOW w AS (
    PARTITION BY cr.App_Name, cr.Payment, cr.Billing_Cycle
    ORDER BY cr.Report_Date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  )
)

-- =============================================================================
-- FINAL OUTPUT
-- =============================================================================
SELECT
  Report_Date,
  App_Name,
  Payment,
  Billing_Cycle,

  -- Counts
  Cohort_Size,
  Attempted_Users,
  Approved_Users,
  Refund_Users,
  Chargeback_Users,
  Attempted_Retry_Count,
  Approved_Retry_Count,

  -- Rates
  Approval_Rate,
  Attempt_Rate,
  Net_Retention_Rate,
  Churn_Rate,

  -- 3-Day Rolling Averages
  Cohort_Size_Avg,
  Approval_Rate_Avg,
  Attempt_Rate_Avg,
  Net_Retention_Rate_Avg

FROM avg_metrics

WHERE Cohort_Size >= (SELECT min_cohort_size FROM config)

ORDER BY
  Report_Date,
  App_Name,
  Payment,
  Billing_Cycle
;
