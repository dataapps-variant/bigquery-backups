CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Sticky_Gross_Revenue_Refunds_App_Level` AS
WITH revenue AS (
  SELECT
    DATE_TRUNC(Date_of_Sale, MONTH) AS Month,
    Entity_Name,
    App_Name,
    SUM(Order_Total_USD) AS Gross_Revenue_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  GROUP BY 1, 2, 3
),
refunds AS (
  SELECT
    DATE_TRUNC(Refund_Date, MONTH) AS Refund_Month,
    Entity_Name,
    App_Name,
    SUM(Refund_Amount_USD) AS Refund_Amount_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Refund_Date IS NOT NULL
  GROUP BY 1, 2, 3
)
SELECT
  r.Month,
  COALESCE(r.Entity_Name, f.Entity_Name) AS Entity_Name,
  COALESCE(r.App_Name, f.App_Name) AS App_Name,
  r.Gross_Revenue_USD,
  f.Refund_Month,
  f.Refund_Amount_USD
FROM revenue r
FULL OUTER JOIN refunds f
  ON r.Month = f.Refund_Month 
  AND r.Entity_Name = f.Entity_Name
  AND r.App_Name = f.App_Name
ORDER BY 1, 2, 3
