-- job_id: job_zg79tzdERGNOnd_jCNMVFEwWMhuQ
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:46.704000+00:00
-- started: 2026-07-28T13:09:46.800000+00:00
-- ended: 2026-07-28T13:09:46.964000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`Recent_CAC`) AS `Recent_CAC_74f92`, sum(`Net_BC4_ARPU`) AS `Net_BC4_ARPU_81622` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('EN') GROUP BY `Report_date` ORDER BY `Recent_CAC_74f92` DESC
 LIMIT 10000
