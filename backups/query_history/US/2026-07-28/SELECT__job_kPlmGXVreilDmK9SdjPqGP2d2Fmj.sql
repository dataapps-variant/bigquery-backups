-- job_id: job_kPlmGXVreilDmK9SdjPqGP2d2Fmj
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:49.375000+00:00
-- started: 2026-07-28T13:09:49.461000+00:00
-- ended: 2026-07-28T13:09:49.544000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_Level` 
WHERE `App_Name` IN ('CN') GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
