-- job_id: job_vHxrmtjayvlOKVhPGbuIM26Hll_o
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:09:12.621000+00:00
-- started: 2026-07-28T13:09:12.704000+00:00
-- ended: 2026-07-28T13:09:12.938000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `AFID` AS `AFID`, sum(`T7D_Spend`) AS `SUM_T7D_Spend__c2acd` 
FROM `CWC`.`CWC_App_AFID` 
WHERE `App_Name` IN ('AT') GROUP BY `Report_date`, `AFID` ORDER BY `SUM_T7D_Spend__c2acd` DESC
 LIMIT 50000
