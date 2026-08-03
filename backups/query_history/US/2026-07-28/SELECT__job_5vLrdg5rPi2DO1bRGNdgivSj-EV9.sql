-- job_id: job_5vLrdg5rPi2DO1bRGNdgivSj-EV9
-- user: apache-superset-admin@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:57:05.057000+00:00
-- started: 2026-07-28T12:57:05.155000+00:00
-- ended: 2026-07-28T12:57:05.275000+00:00

SELECT `T30_Days_User` AS `T30_Days_User`, `Product_Name_Final` AS `Product_Name_Final`, sum(`Net_LTV_Discounted`) AS `SUM_Net_LTV_Discounted__42498` 
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
WHERE `Report_date` IN (CAST('2026-07-27' AS DATE)) AND `Active_Inactive` IN ('Active') AND `T30_Days_User` > 0 GROUP BY `T30_Days_User`, `Product_Name_Final` ORDER BY `SUM_Net_LTV_Discounted__42498` DESC
 LIMIT 50000
