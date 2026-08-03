-- job_id: job_MHpiKeLxXUOZXBXjPj6B9RFrQGZ6
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:11.334000+00:00
-- started: 2026-07-28T13:09:11.442000+00:00
-- ended: 2026-07-28T13:09:11.680000+00:00

SELECT sum(`Net_BC4_ARPU`) AS `SUM_Net_BC4_ARPU__90c88` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE)
 LIMIT 5000
