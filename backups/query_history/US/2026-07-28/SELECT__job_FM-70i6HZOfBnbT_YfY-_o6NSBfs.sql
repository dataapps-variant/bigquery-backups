-- job_id: job_FM-70i6HZOfBnbT_YfY-_o6NSBfs
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:21.168000+00:00
-- started: 2026-07-28T13:10:21.221000+00:00
-- ended: 2026-07-28T13:10:21.415000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`Recent_CAC`) AS `Recent_CAC_74f92`, sum(`Net_BC4_ARPU`) AS `Net_BC4_ARPU_81622` 
FROM `CWC`.`CWC_App_Level` 
WHERE `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE) AND `App_Name` IN ('EN') GROUP BY `Report_date` ORDER BY `Recent_CAC_74f92` DESC
 LIMIT 10000
