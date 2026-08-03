-- job_id: job_b0vqHXondcP_XiYl90VR2fQOsYP4
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:11.586000+00:00
-- started: 2026-07-28T13:09:11.711000+00:00
-- ended: 2026-07-28T13:09:11.886000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Users`) AS `SUM_T7D_Users__96d76` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`
 LIMIT 5000
