-- job_id: job_qEPSwFs23sVfuYkbGc9vpK3gGrVY
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:03.792000+00:00
-- started: 2026-07-28T09:52:03.895000+00:00
-- ended: 2026-07-28T09:52:04.103000+00:00

SELECT `Product_Name_Final` AS `Product_Name_Final` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `App_Name` IN ('PD') GROUP BY `Product_Name_Final` ORDER BY `Product_Name_Final` ASC
 LIMIT 1000
