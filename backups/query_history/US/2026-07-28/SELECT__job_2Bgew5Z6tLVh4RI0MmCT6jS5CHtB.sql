-- job_id: job_2Bgew5Z6tLVh4RI0MmCT6jS5CHtB
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:51.954000+00:00
-- started: 2026-07-28T13:09:52.044000+00:00
-- ended: 2026-07-28T13:09:52.126000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('PD') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
