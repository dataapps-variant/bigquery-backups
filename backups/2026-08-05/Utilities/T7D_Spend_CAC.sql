CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.T7D_Spend_CAC` AS

WITH Active_Plans AS (
  SELECT DISTINCT
    Product_Name_Final AS Plan_Name
  FROM `ICARUS_Multi.Active_Plans_6M`
),

Recent_Spend AS (
  SELECT
    Product_Name_Final_Merged AS Plan_Name,
    SUM(allocated_spend) AS Recent_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE Date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) 
                 AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
  GROUP BY Product_Name_Final_Merged
),

Recent_Users AS (
  SELECT
    Product_Name_Final_Merged AS Plan_Name,
    COUNT(DISTINCT Updated_Cust_ID) AS Recent_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY) 
                         AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
  GROUP BY Product_Name_Final_Merged
)

SELECT
  ap.Plan_Name,
  COALESCE(rs.Recent_Spend, 0) AS Recent_Spend,
  COALESCE(ru.Recent_Users, 0) AS Recent_Users,
  COALESCE(rs.Recent_Spend, 0) / 7 AS T7D_Spend,
  CASE 
    WHEN COALESCE(ru.Recent_Users, 0) > 0 
    THEN COALESCE(rs.Recent_Spend, 0) / ru.Recent_Users
    ELSE NULL
  END AS T7D_CAC
FROM Active_Plans ap
LEFT JOIN Recent_Spend rs ON ap.Plan_Name = rs.Plan_Name
LEFT JOIN Recent_Users ru ON ap.Plan_Name = ru.Plan_Name
ORDER BY ap.Plan_Name;
