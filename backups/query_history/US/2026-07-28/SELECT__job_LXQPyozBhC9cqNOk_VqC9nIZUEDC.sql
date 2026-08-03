-- job_id: job_LXQPyozBhC9cqNOk_VqC9nIZUEDC
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:56:54.008000+00:00
-- started: 2026-07-28T12:56:54.119000+00:00
-- ended: 2026-07-28T12:56:54.559000+00:00

SELECT `Report_date` AS `Report_date`, COUNT(*) AS `count` 
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
WHERE `Active_Inactive` IN ('Active') GROUP BY `Report_date` ORDER BY `count` DESC
 LIMIT 1000
