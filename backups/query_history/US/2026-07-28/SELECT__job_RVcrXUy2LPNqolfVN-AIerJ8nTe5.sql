-- job_id: job_RVcrXUy2LPNqolfVN-AIerJ8nTe5
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:50.819000+00:00
-- started: 2026-07-28T13:09:50.881000+00:00
-- ended: 2026-07-28T13:09:50.945000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `AFID` AS `AFID`, sum(`T7D_Spend`) AS `SUM_T7D_Spend__c2acd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`, `AFID` ORDER BY `SUM_T7D_Spend__c2acd` DESC
 LIMIT 50000
