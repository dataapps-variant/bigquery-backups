-- job_id: job_NV1POqobIVy2_CmlWSQEPMjz003E
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:58:08.583000+00:00
-- started: 2026-07-29T14:58:08.692000+00:00
-- ended: 2026-07-29T14:58:09.396000+00:00

SELECT
  i.Input_ID,
  i.Retention_Curve,
  i.Extension_Scenarios_Retentions,
  CASE WHEN ext.Churn_Curve_Name IS NOT NULL THEN 'MATCHED' ELSE 'NO MATCH' END AS ext_status
FROM `variant-finance-data-project.R100.R100_Inputs_Full` i
LEFT JOIN (
  SELECT DISTINCT Churn_Curve_Name
  FROM `variant-finance-data-project.Extension_Scenario_Retention.Extension_Retentions_Scenarios`
) ext
  ON ext.Churn_Curve_Name = i.Extension_Scenarios_Retentions
WHERE i.Inputs_to_Process = TRUE
ORDER BY ext_status, i.Input_ID
