-- job_id: sheets_dataconnector_1346934c-c95d-4959-9de3-e5aa2b30465c
-- user: dev@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T14:05:23.325000+00:00
-- started: 2026-07-30T14:05:23.403000+00:00
-- ended: 2026-07-30T14:05:23.521000+00:00

  SELECT `Reporting_Date` AS `Reporting_Date`, `Plan_Name` AS `Plan_Name`, `Active_Inactive` AS `Active_Inactive`, `Entity_Name` AS `Entity_Name`, `App_Name` AS `App_Name`, `Trial_Type` AS `Trial_Type`, `Country` AS `Country`, `Cohort` AS `Cohort`, `Table_Type` AS `Table_Type`, `Metric_Name` AS `Metric_Name`, `BC0` AS `BC0`, `BC1` AS `BC1`, `BC2` AS `BC2`, `BC3` AS `BC3`, `BC4` AS `BC4`, `BC5` AS `BC5`, `BC6` AS `BC6`, `BC7` AS `BC7`, `BC8` AS `BC8`, `BC9` AS `BC9`, `BC10` AS `BC10`, `BC11` AS `BC11`, `BC12` AS `BC12`
  FROM (
SELECT * FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
)
  WHERE ((`Reporting_Date` = '2026-7-29') AND ((UPPER(`Cohort`) NOT IN (UPPER('7K_30D'))) OR (UPPER(`Cohort`) IS NULL)) AND ((UPPER(`Table_Type`) NOT IN (UPPER('Crystal Ball'))) OR (UPPER(`Table_Type`) IS NULL)) AND ((UPPER(`Active_Inactive`) NOT IN (UPPER('Inactive'))) OR (UPPER(`Active_Inactive`) IS NULL)) AND (UPPER(`Metric_Name`) IN (UPPER('05. Gross Retention Rate'))))
  LIMIT 100000
