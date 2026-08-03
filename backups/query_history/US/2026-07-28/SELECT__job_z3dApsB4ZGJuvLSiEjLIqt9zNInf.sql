-- job_id: job_z3dApsB4ZGJuvLSiEjLIqt9zNInf
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:51.121000+00:00
-- started: 2026-07-28T13:09:51.192000+00:00
-- ended: 2026-07-28T13:09:51.273000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `AFID` AS `AFID`, sum(`T7D_Users`) AS `SUM_T7D_Users__96d76` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`, `AFID` ORDER BY `SUM_T7D_Users__96d76` DESC
 LIMIT 50000
