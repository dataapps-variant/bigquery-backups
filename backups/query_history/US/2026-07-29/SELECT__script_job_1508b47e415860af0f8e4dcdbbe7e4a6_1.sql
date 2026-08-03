-- job_id: script_job_1508b47e415860af0f8e4dcdbbe7e4a6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:59:34.666000+00:00
-- started: 2026-07-29T14:59:34.730000+00:00
-- ended: 2026-07-29T14:59:35.399000+00:00

SELECT COUNT(DISTINCT Plan_Name) AS icarus_plans
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
WHERE Metric_Name = '05. Gross Retention Rate'
  AND Table_Type = 'Regular'
  AND Reporting_Date = (SELECT MAX(Reporting_Date) FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted` WHERE Metric_Name = '05. Gross Retention Rate')
