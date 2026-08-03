-- job_id: job_gujVIn9lNWdeRSEsekz3ui65F8ae
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-29T14:59:33.897000+00:00
-- started: 2026-07-29T14:59:33.941000+00:00
-- ended: 2026-07-29T14:59:37.611000+00:00

-- Check 1: How many unique Retention_Curves in R100 inputs
SELECT COUNT(DISTINCT Retention_Curve) AS input_curves,
       COUNT(DISTINCT Plan_Code) AS input_plans
FROM `variant-finance-data-project.R100.R100_Inputs_Full`
WHERE Inputs_to_Process = TRUE;

-- Check 2: How many unique plans in Icarus at latest date for Gross Retention Rate
SELECT COUNT(DISTINCT Plan_Name) AS icarus_plans
FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
WHERE Metric_Name = '05. Gross Retention Rate'
  AND Table_Type = 'Regular'
  AND Reporting_Date = (SELECT MAX(Reporting_Date) FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted` WHERE Metric_Name = '05. Gross Retention Rate');

-- Check 3: Which input curves DON'T match Icarus
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
ORDER BY status, r.Retention_Curve;

-- Check 4: Extension table status
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT Churn_Curve_Name) AS unique_plans
FROM `variant-finance-data-project.Extension_Scenario_Retention.Extension_Retentions_Scenarios`;
