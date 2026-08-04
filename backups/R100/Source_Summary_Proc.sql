CREATE PROCEDURE `variant-finance-data-project`.R100.Source_Summary_Proc()
BEGIN
CREATE OR REPLACE TABLE `R100.Source_Summary` AS
SELECT
  DATE(Date_of_Sale) AS Day,
  Product_Name_Final AS Plan_Name,
  COUNT(DISTINCT CASE 
    WHEN (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1) OR (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0) 
    THEN Updated_Order_ID 
  END) AS New_User_Count,
  SUM(IFNULL(Refund_Amount_USD, 0)) AS All_Refund_USD,
  SUM(IFNULL(Order_Price_Net_Of_Tax_USD, 0)) AS All_Gross_Revenue_USD,
  CASE 
    WHEN App_Name <> 'CT' THEN App_Name
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID <> 'JP' THEN 'CT-Non JP'
  END AS App_Name
FROM `Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE Date_of_Sale IS NOT NULL
  AND Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 101 DAY) AND CURRENT_DATE()
GROUP BY Day, Plan_Name, App_Name;
END;
