-- job_id: job_jNWJHOGq5DCMtfINuw1IA3U7J67y
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:19.699000+00:00
-- started: 2026-07-28T13:09:19.776000+00:00
-- ended: 2026-07-28T13:09:19.950000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `AFID` IN (91) GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
