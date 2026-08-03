-- job_id: scheduled_query_6aa35dfe-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:15:06.780000+00:00
-- started: 2026-07-30T09:15:07.035000+00:00
-- ended: 2026-07-30T09:15:10.317000+00:00

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
--   3. Net_Retention_Rate: Dynamic anchor — if BC0 exists for the
--      App×Date×Payment group, BC0 is anchor; otherwise BC1 is anchor.
--      Anchor BC uses Approved_Users as denominator; all others use Cohort_Size.
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
-- STEP 2: Detect anchor BC per Report_Date × App_Name × Payment
-- If BC0 exists → anchor is BC0; otherwise → anchor is BC1
-- =============================================================================
anchor_bc AS (
  SELECT
    Report_Date,
    App_Name,
    Payment,
    MIN(Billing_Cycle) AS anchor_billing_cycle
  FROM app_aggregated
  GROUP BY Report_Date, App_Name, Payment
),

-- =============================================================================
-- STEP 3: Recalculate rates from summed counts with dynamic anchor
-- =============================================================================
retention_calc AS (
  SELECT
    a.*,

    -- Approval Rate
    SAFE_DIVIDE(a.Approved_Users, a.Attempted_Users) AS Approval_Rate,

    -- Attempt Rate
    SAFE_DIVIDE(a.Attempted_Users, a.Cohort_Size) AS Attempt_Rate,

    -- Net Survival (per-BC step)
    -- Anchor BC: denominator = Approved_Users
    -- All other BCs: denominator = Cohort_Size
    CASE
      WHEN a.Billing_Cycle = ab.anchor_billing_cycle
      THEN SAFE_DIVIDE((a.Approved_Users - a.Refund_Users - a.Chargeback_Users), a.Approved_Users)
      ELSE SAFE_DIVIDE((a.Approved_Users - a.Refund_Users - a.Chargeback_Users), a.Cohort_Size)
    END AS net_survival,

    -- Churn Rate (inverse of net_survival)
    CASE
      WHEN a.Billing_Cycle = ab.anchor_billing_cycle
      THEN 1 - SAFE_DIVIDE((a.Approved_Users - a.Refund_Users - a.Chargeback_Users), a.Approved_Users)
      ELSE 1 - SAFE_DIVIDE((a.Approved_Users - a.Refund_Users - a.Chargeback_Users), a.Cohort_Size)
    END AS Churn_Rate

  FROM app_aggregated a
  INNER JOIN anchor_bc ab
    ON a.Report_Date = ab.Report_Date
    AND a.App_Name = ab.App_Name
    AND a.Payment = ab.Payment
),

-- =============================================================================
-- STEP 4: Cumulative Net Retention Rate
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
-- STEP 5: 3-day rolling averages, shown every 3rd day from 2025-04-09
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
