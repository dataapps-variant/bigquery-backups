-- job_id: job_WosFj5AHvVK5DS66t4nf4Mdb20a8
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:12.616000+00:00
-- started: 2026-07-28T13:09:12.881000+00:00
-- ended: 2026-07-28T13:09:13.078000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `AFID` AS `AFID`, sum(`T7D_Users`) AS `SUM_T7D_Users__96d76` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`, `AFID` ORDER BY `SUM_T7D_Users__96d76` DESC
 LIMIT 50000
