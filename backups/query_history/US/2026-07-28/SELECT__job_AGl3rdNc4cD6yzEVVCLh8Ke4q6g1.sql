-- job_id: job_AGl3rdNc4cD6yzEVVCLh8Ke4q6g1
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:57:05.462000+00:00
-- started: 2026-07-28T12:57:05.553000+00:00
-- ended: 2026-07-28T12:57:05.634000+00:00

SELECT `Entity_Name` AS `Entity_Name` 
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
WHERE `Active_Inactive` IN ('Active') GROUP BY `Entity_Name` ORDER BY `Entity_Name` ASC
 LIMIT 1000
