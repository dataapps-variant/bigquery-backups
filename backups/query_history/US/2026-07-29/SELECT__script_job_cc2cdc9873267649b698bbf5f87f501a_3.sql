-- job_id: script_job_cc2cdc9873267649b698bbf5f87f501a_3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:59:36.799000+00:00
-- started: 2026-07-29T14:59:36.870000+00:00
-- ended: 2026-07-29T14:59:37.388000+00:00

SELECT COUNT(*) AS total_rows, COUNT(DISTINCT Churn_Curve_Name) AS unique_plans
FROM `variant-finance-data-project.Extension_Scenario_Retention.Extension_Retentions_Scenarios`
