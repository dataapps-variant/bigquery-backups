CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Retry_Engine_Users_List` AS

WITH successful_orders AS (
  SELECT 
    *,
    -- Calculate days to subtract based on trial logic
    CASE 
      WHEN Trial_Type != 'NT' AND Billing_Cycle_Updated = 0 THEN Trial_Period
      ELSE Reg_BC_Period
    END AS Days_To_Subtract
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Final_Order_Status != 6
    AND Is_Chargeback != '1'
    AND Date_of_Sale >= '2025-01-01'  -- Added date filter
),

cutoff_dates AS (
  SELECT 
    Customer_Number,
    Product_Name_Final,
    -- Calculate cutoff date: Current Date - Days_To_Subtract - 30
    DATE_SUB(CURRENT_DATE(), INTERVAL (Days_To_Subtract + 29) DAY) AS Cutoff_Date
  FROM successful_orders
  GROUP BY Customer_Number, Product_Name_Final, Days_To_Subtract
),

last_eligible_orders AS (
  SELECT 
    s.*,
    c.Cutoff_Date,
    ROW_NUMBER() OVER (
      PARTITION BY s.Customer_Number, s.Product_Name_Final 
      ORDER BY s.Date_of_Sale DESC
    ) AS rn
  FROM successful_orders s
  INNER JOIN cutoff_dates c
    ON s.Customer_Number = c.Customer_Number
    AND s.Product_Name_Final = c.Product_Name_Final
  WHERE s.Date_of_Sale < c.Cutoff_Date
)

SELECT 
  CONCAT(Customer_Number, '_', Product_Name_Final) AS Customer_Key,
  Customer_Number AS Customer_ID,
  Product_Name_Final AS Plan,
  Order_Id AS Last_Eligible_Order_ID,
  Date_of_Sale AS Last_Eligible_Order_Date,
  DATE_ADD(Date_of_Sale, INTERVAL (Days_To_Subtract + 29) DAY) AS Retry_Engine_End_Date,  -- New column
  
  -- ✅ MODIFIED: App_Name with CT Japan/Non-Japan logic
  CASE 
    WHEN UPPER(App_Name) = 'CT' AND Spend_Country_Code_AFID = 'JP'
    THEN 'CT - JP'
    WHEN UPPER(App_Name) = 'CT'
    THEN 'CT - Non-JP'
    ELSE App_Name
  END AS App_Name,
  
  AFID_CHANNEL,
  Billing_Cycle_Updated AS BC,
  Updated_Cust_ID
FROM last_eligible_orders
WHERE rn = 1
ORDER BY Customer_Number, Product_Name_Final;
