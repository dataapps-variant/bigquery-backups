-- job_id: job_IpooLbnYKpvGXp-Mdkon7ifbAeFX
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:51.847000+00:00
-- started: 2026-07-28T13:09:52.051000+00:00
-- ended: 2026-07-28T13:09:52.116000+00:00

SELECT sum(`Net_BC4_ARPU`) AS `SUM_Net_BC4_ARPU__90c88` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE)
 LIMIT 5000
