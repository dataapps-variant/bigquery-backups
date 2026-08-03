CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Sticky_Daily_Sales_and_Refunds` AS
WITH sales AS (
  SELECT
    App_Name,
    Date_of_Sale,
    SUM(Order_Total_USD) AS Total_Sales_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
  GROUP BY App_Name, Date_of_Sale
),
refunds AS (
  SELECT
    App_Name,
    Refund_Date,
    SUM(Refund_Amount_USD) AS Total_Refund_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Refund_Date >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
  GROUP BY App_Name, Refund_Date
)
SELECT
  COALESCE(s.App_Name, r.App_Name)        AS App_Name,
  s.Date_of_Sale,
  s.Total_Sales_USD,
  r.Refund_Date,
  r.Total_Refund_USD                       AS Refund_Amount_USD
FROM sales s
FULL OUTER JOIN refunds r
  ON s.App_Name      = r.App_Name
  AND s.Date_of_Sale = r.Refund_Date
ORDER BY App_Name, COALESCE(s.Date_of_Sale, r.Refund_Date);
