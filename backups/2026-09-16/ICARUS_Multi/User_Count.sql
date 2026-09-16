CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.User_Count` AS
SELECT
  Date_of_Sale AS Report_Date,
  CASE
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
    WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
    ELSE App_Name
  END AS App_Name,
  AFID_CHANNEL,
  Product_Name_Final_Merged,
  Billing_Cycle_Updated,
  COUNT(DISTINCT Updated_Cust_ID) AS BC_New_Users
FROM
  `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE
  Date_of_Sale > '2024-12-31'
GROUP BY
  Report_Date,
  App_Name,
  AFID_CHANNEL,
  Product_Name_Final_Merged,
  Billing_Cycle_Updated
