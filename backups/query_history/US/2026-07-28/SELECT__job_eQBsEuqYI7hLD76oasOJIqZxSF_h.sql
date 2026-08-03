-- job_id: job_eQBsEuqYI7hLD76oasOJIqZxSF_h
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:44.945000+00:00
-- started: 2026-07-28T13:09:45.028000+00:00
-- ended: 2026-07-28T13:09:45.136000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`Net_BC4_ARPU`) AS `Net_BC4_ARPU_81622`, sum(`Recent_CAC`) AS `Recent_CAC_74f92` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `AFID` IN (99) GROUP BY `Report_date` ORDER BY `Net_BC4_ARPU_81622` DESC
 LIMIT 10000
