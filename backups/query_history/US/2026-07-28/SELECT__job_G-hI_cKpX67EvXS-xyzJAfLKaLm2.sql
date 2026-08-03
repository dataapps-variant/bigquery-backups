-- job_id: job_G-hI_cKpX67EvXS-xyzJAfLKaLm2
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:56:54.013000+00:00
-- started: 2026-07-28T12:56:54.105000+00:00
-- ended: 2026-07-28T12:56:54.325000+00:00

SELECT `Active_Inactive` AS `Active_Inactive` 
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
) AS `virtual_table` GROUP BY `Active_Inactive` ORDER BY `Active_Inactive` ASC
 LIMIT 1000
