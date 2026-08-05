CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Active_Users_List` AS

WITH successful_orders AS (
  SELECT 
    Customer_Number,
    Product_Name_Final,
    CONCAT(Customer_Number, '_', Product_Name_Final) AS Customer_Key,
    Order_Id,
    Date_of_Sale,
    COALESCE(Reg_BC_Period, 0) AS Reg_BC_Period,
    -- Additional columns
    Bill_Email,
    Campaign_Id,
    Final_Order_Status,
    Is_Chargeback,
    Chargeback_Date,
    Is_Refund,
    AFID,
    Product_Id,
    Product_Name,
    Product_Price,
    Quantity,
    Acquisition_Date_Time,
    Offer_Id,
    Entity_Name,
    App_Name,
    Currency,
    AFID_CHANNEL,
    Updated_Cust_ID,
    Updated_Order_ID,
    Trial_Period,
    Trial_Price,
    Trial_Type,
    Product_Name_updated,
    Billing_Cycle_Updated,
    Exchange_Rate,
    Order_Price_Net_of_Tax_USD,
    Refund_Amount_USD,
    Refund_Date,
    Delay_days_SOT,
    Spend_Country_Code_AFID,
    Product_Name_Final_Merged
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Final_Order_Status != 6 
    AND Is_Chargeback != '1'
)

SELECT 
  Customer_Key,
  Customer_Number AS Customer_ID,
  Product_Name_Final AS Plan,
  
  -- First successful order
  MIN(Date_of_Sale) AS First_Successful_Order_Date,
  ARRAY_AGG(Order_Id ORDER BY Date_of_Sale ASC LIMIT 1)[OFFSET(0)] AS First_Successful_Order_ID,
  
  -- Last successful order
  MAX(Date_of_Sale) AS Last_Successful_Order_Date,
  ARRAY_AGG(Order_Id ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Last_Successful_Order_ID,
  
  -- ✅ Last active date with NEW LOGIC
  DATE_ADD(
    MAX(Date_of_Sale),
    INTERVAL 
      CASE 
        WHEN ARRAY_AGG(Trial_Type ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] != 'NT' 
         AND COALESCE(ARRAY_AGG(Billing_Cycle_Updated ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) = 0
        THEN COALESCE(ARRAY_AGG(Trial_Period ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) + 29
        ELSE COALESCE(ARRAY_AGG(Reg_BC_Period ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) + 29
      END 
    DAY
  ) AS Last_Active_Date,
  
  -- Active days calculation
  DATE_DIFF(
    DATE_ADD(
      MAX(Date_of_Sale),
      INTERVAL 
        CASE 
          WHEN ARRAY_AGG(Trial_Type ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] != 'NT' 
           AND COALESCE(ARRAY_AGG(Billing_Cycle_Updated ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) = 0
          THEN COALESCE(ARRAY_AGG(Trial_Period ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) + 29
          ELSE COALESCE(ARRAY_AGG(Reg_BC_Period ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)], 0) + 29
        END 
      DAY
    ),
    MIN(Date_of_Sale),
    DAY
  ) AS Active_Days,
  
  -- Additional columns from LAST successful order
  ARRAY_AGG(Bill_Email ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Bill_Email,
  ARRAY_AGG(Campaign_Id ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Campaign_Id,
  ARRAY_AGG(Final_Order_Status ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Final_Order_Status,
  ARRAY_AGG(Is_Chargeback ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Is_Chargeback,
  ARRAY_AGG(Chargeback_Date ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Chargeback_Date,
  ARRAY_AGG(Is_Refund ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Is_Refund,
  ARRAY_AGG(AFID ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS AFID,
  ARRAY_AGG(Product_Id ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Product_Id,
  ARRAY_AGG(Product_Name ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Product_Name,
  ARRAY_AGG(Product_Price ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Product_Price,
  ARRAY_AGG(Quantity ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Quantity,
  ARRAY_AGG(Acquisition_Date_Time ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Acquisition_Date_Time,
  ARRAY_AGG(Offer_Id ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Offer_Id,
  ARRAY_AGG(Entity_Name ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Entity_Name,
  
  -- ✅ MODIFIED: App_Name with CT Japan/Non-Japan logic
  CASE 
    WHEN UPPER(ARRAY_AGG(App_Name ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)]) = 'CT' 
     AND ARRAY_AGG(Spend_Country_Code_AFID ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] = 'JP'
    THEN 'CT - JP'
    WHEN UPPER(ARRAY_AGG(App_Name ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)]) = 'CT'
    THEN 'CT - Non-JP'
    ELSE ARRAY_AGG(App_Name ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)]
  END AS App_Name,
  
  ARRAY_AGG(Currency ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Currency,
  ARRAY_AGG(AFID_CHANNEL ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS AFID_CHANNEL,
  ARRAY_AGG(Updated_Cust_ID ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Updated_Cust_ID,
  ARRAY_AGG(Updated_Order_ID ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Updated_Order_ID,
  ARRAY_AGG(Trial_Period ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Trial_Period,
  ARRAY_AGG(Trial_Price ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Trial_Price,
  ARRAY_AGG(Trial_Type ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Trial_Type,
  ARRAY_AGG(Product_Name_updated ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Product_Name_updated,
  ARRAY_AGG(Billing_Cycle_Updated ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Billing_Cycle_Updated,
  ARRAY_AGG(Exchange_Rate ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Exchange_Rate,
  ARRAY_AGG(Order_Price_Net_of_Tax_USD ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Order_Price_Net_of_Tax_USD,
  ARRAY_AGG(Refund_Amount_USD ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Refund_Amount_USD,
  ARRAY_AGG(Refund_Date ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Refund_Date,
  ARRAY_AGG(Delay_days_SOT ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Delay_days_SOT,
  ARRAY_AGG(Spend_Country_Code_AFID ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Spend_Country_Code_AFID,
  ARRAY_AGG(Product_Name_Final_Merged ORDER BY Date_of_Sale DESC LIMIT 1)[OFFSET(0)] AS Product_Name_Final_Merged,
  
  -- Bonus metric
  COUNT(*) AS Total_Successful_Orders

FROM successful_orders
GROUP BY Customer_Key, Customer_Number, Product_Name_Final
ORDER BY Customer_Number, Product_Name_Final;
