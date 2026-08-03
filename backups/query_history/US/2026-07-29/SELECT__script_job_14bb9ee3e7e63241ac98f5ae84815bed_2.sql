-- job_id: script_job_14bb9ee3e7e63241ac98f5ae84815bed_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:59:35.657000+00:00
-- started: 2026-07-29T14:59:35.753000+00:00
-- ended: 2026-07-29T14:59:36.506000+00:00

SELECT DISTINCT r.Retention_Curve, 
  CASE WHEN ic.Plan_Name IS NOT NULL THEN 'MATCHED' ELSE 'NO MATCH' END AS status
FROM `variant-finance-data-project.R100.R100_Inputs_Full` r
LEFT JOIN (
  SELECT DISTINCT Plan_Name
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  WHERE Metric_Name = '05. Gross Retention Rate'
    AND Table_Type = 'Regular'
    AND Reporting_Date = (SELECT MAX(Reporting_Date) FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted` WHERE Metric_Name = '05. Gross Retention Rate')
) ic ON ic.Plan_Name = r.Retention_Curve
WHERE r.Inputs_to_Process = TRUE
ORDER BY status, r.Retention_Curve
