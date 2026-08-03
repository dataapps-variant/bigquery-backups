-- job_id: job_iVSlfbu8iTddhPfeMSKr_txxgYrJ
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:15.040000+00:00
-- started: 2026-07-28T13:09:15.375000+00:00
-- ended: 2026-07-28T13:09:15.515000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `AFID` IN (5) GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
