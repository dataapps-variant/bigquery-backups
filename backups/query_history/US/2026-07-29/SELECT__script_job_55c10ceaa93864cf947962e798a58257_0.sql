-- job_id: script_job_55c10ceaa93864cf947962e798a58257_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:59:34.040000+00:00
-- started: 2026-07-29T14:59:34.139000+00:00
-- ended: 2026-07-29T14:59:34.369000+00:00

SELECT COUNT(DISTINCT Retention_Curve) AS input_curves,
       COUNT(DISTINCT Plan_Code) AS input_plans
FROM `variant-finance-data-project.R100.R100_Inputs_Full`
WHERE Inputs_to_Process = TRUE
