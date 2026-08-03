-- job_id: job_zLfjdKNpQU9uZn38PsqnkVSQRIVA
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:51.859000+00:00
-- started: 2026-07-28T13:09:52.060000+00:00
-- ended: 2026-07-28T13:09:52.126000+00:00

SELECT sum(`Recent_CAC`) AS `SUM_Recent_CAC__a88d9` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE)
 LIMIT 5000
