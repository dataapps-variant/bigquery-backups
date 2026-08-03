-- job_id: job_yuMcSsO5Pjpz5Ow3be2AN3M5Zoj0
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:21.804000+00:00
-- started: 2026-07-28T13:09:21.918000+00:00
-- ended: 2026-07-28T13:09:22.088000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('PD') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
