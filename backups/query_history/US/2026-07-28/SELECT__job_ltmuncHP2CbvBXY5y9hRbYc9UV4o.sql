-- job_id: job_ltmuncHP2CbvBXY5y9hRbYc9UV4o
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.546000+00:00
-- started: 2026-07-28T09:52:10.656000+00:00
-- ended: 2026-07-28T09:52:10.882000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Recent_CAC`) AS `SUM_Recent_CAC__a88d9` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `App_Name` IN ('PD') GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `SUM_Recent_CAC__a88d9` DESC
 LIMIT 10000
