-- job_id: job_hcHDpfLpaWpw65cZMkGk8nf4-K4K
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:15.933000+00:00
-- started: 2026-07-28T13:09:16.026000+00:00
-- ended: 2026-07-28T13:09:16.244000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, sum(`T7D_Spend`) AS `Recent_Spend_51ebd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') AND `AFID` IN (12) GROUP BY `Report_date` ORDER BY `Recent_Spend_51ebd` DESC
 LIMIT 10000
