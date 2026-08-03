-- job_id: job_X3x9k11aCv4ZOTFfIC0D6xbeWNHf
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.569000+00:00
-- started: 2026-07-28T09:52:10.661000+00:00
-- ended: 2026-07-28T09:52:10.934000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Retention_rate`) AS `SUM_Retention_rate__d5b4b` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `Billing_Cycle` IN (4) AND `App_Name` IN ('PD') GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `SUM_Retention_rate__d5b4b` DESC
 LIMIT 10000
