-- job_id: job_-_ks2rUqUYVwk01n5sXQID0VXmlW
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:22.949000+00:00
-- started: 2026-07-28T13:10:22.994000+00:00
-- ended: 2026-07-28T13:10:23.157000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE) AND `App_Name` IN ('CT-JP') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
