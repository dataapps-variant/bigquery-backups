-- job_id: job_rZLYPLQb1211kEkcXw_PqoA3nNfN
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:57:04.771000+00:00
-- started: 2026-07-28T12:57:04.874000+00:00
-- ended: 2026-07-28T12:57:04.973000+00:00

SELECT `Product_Name_Final` AS `Product_Name_Final`, sum(`BC4_CAC_Ceiling`) AS `BC4_CAC_Celling__96bc0`, sum(`Recent_CAC`) AS `Recent_CAC` 
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
WHERE `Report_date` IN (CAST('2026-07-27' AS DATE)) AND `Active_Inactive` IN ('Active') GROUP BY `Product_Name_Final` ORDER BY `BC4_CAC_Celling__96bc0` DESC
 LIMIT 50000
