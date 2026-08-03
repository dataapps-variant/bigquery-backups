-- job_id: job_TqRMqbQVulliFH6-Nd-Cv9Zh_u65
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:50.935000+00:00
-- started: 2026-07-28T13:09:51.006000+00:00
-- ended: 2026-07-28T13:09:51.133000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `T7D_Spend_43faa` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`
 LIMIT 5000
