-- job_id: job_fyocM95QitoquUlrOyaGOLMPs8oL
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:43.760000+00:00
-- started: 2026-07-28T13:09:43.839000+00:00
-- ended: 2026-07-28T13:09:43.911000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `AFID` IN (12) GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
