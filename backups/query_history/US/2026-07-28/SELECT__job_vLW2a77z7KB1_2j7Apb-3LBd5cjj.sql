-- job_id: job_vLW2a77z7KB1_2j7Apb-3LBd5cjj
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:56:57.699000+00:00
-- started: 2026-07-28T12:56:57.783000+00:00
-- ended: 2026-07-28T12:56:58.011000+00:00

SELECT DATE_TRUNC(`Report_date`, DAY) AS `Report_date`, `Product_Name_Final` AS `Product_Name_Final`, sum(`CB_Profit`) AS `Profit` 
FROM (SELECT 
  a.*,
  CASE 
    WHEN b.Product_Name_Final IS NOT NULL THEN 'Active'
    ELSE 'Inactive'
  END AS Active_Inactive
FROM 
  `variant-finance-data-project.VPU_Merged.15K_Vol_Val` a
LEFT JOIN 
  `variant-finance-data-project.VPU_Merged.Active_Plans_6M` b
  ON a.Product_Name_Final = b.Product_Name_Final 
  AND a.App_Name = b.App_Name
) AS `virtual_table` 
WHERE `Active_Inactive` IN ('Active') GROUP BY `Report_date`, `Product_Name_Final` ORDER BY `Profit` DESC
 LIMIT 50000
