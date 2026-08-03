-- job_id: job_l6_cYSr6YN-Ld_LQ7d2YK7CgV_EO
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:52:10.163000+00:00
-- started: 2026-07-28T09:52:10.272000+00:00
-- ended: 2026-07-28T09:52:10.555000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Net_ARPU_Discounted`) AS `SUM_Net_ARPU_Discounted__3ba12` 
FROM `VPU_Merged`.`15K_Main_Table_30` 
WHERE `App_Name` IN ('PD') GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `SUM_Net_ARPU_Discounted__3ba12` DESC
 LIMIT 10000
