-- job_id: job_7t_T5FT7yT41xEuTLab25RuEwZtA
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:22.054000+00:00
-- started: 2026-07-28T13:10:22.145000+00:00
-- ended: 2026-07-28T13:10:22.318000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`Recent_CAC`) AS `Recent_CAC_74f92`, sum(`Net_BC4_ARPU`) AS `Net_BC4_ARPU_81622` 
FROM `CWC`.`CWC_App_Level` 
WHERE `Report_date` >= CAST('2026-07-27' AS DATE) AND `Report_date` < CAST('2026-07-28' AS DATE) AND `App_Name` IN ('CN') GROUP BY `Report_date` ORDER BY `Recent_CAC_74f92` DESC
 LIMIT 10000
