CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Retry_Engine_Users_Detail` AS

WITH date_spine AS (
  -- Generate all dates from 2025-01-01 to current date
  SELECT date_day
  FROM UNNEST(GENERATE_DATE_ARRAY('2025-01-01', CURRENT_DATE(), INTERVAL 1 DAY)) AS date_day
),

retry_users AS (
  SELECT 
    r.App_Name,
    r.AFID_Channel,
    r.Updated_Cust_ID,
    r.Plan,
    r.Last_Eligible_Order_Date,
    r.Retry_Engine_End_Date,
    r.Last_Eligible_Order_ID,
    -- Calculate BC_Period using the same logic as in Retry_Engine_Users_List
    CASE 
      WHEN s.Trial_Type != 'NT' AND s.Billing_Cycle_Updated = 0 THEN s.Trial_Period
      ELSE s.Reg_BC_Period
    END AS BC_Period
  FROM `variant-finance-data-project.Daedalus.Retry_Engine_Users_List` r
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON r.Last_Eligible_Order_ID = s.Order_Id
    AND r.Plan = s.Product_Name_Final
),

-- Cross join to get all combinations of dates and retry users
date_user_combinations AS (
  SELECT 
    d.date_day AS Date,
    r.App_Name,
    r.AFID_Channel,
    r.Plan AS Product_Name_Final,
    r.Last_Eligible_Order_Date,
    DATE_ADD(r.Last_Eligible_Order_Date, INTERVAL (r.BC_Period - 1) DAY) AS Eligible_Order_End_Date,
    r.Updated_Cust_ID
  FROM date_spine d
  CROSS JOIN retry_users r
  WHERE r.Last_Eligible_Order_Date <= d.date_day
    AND r.Retry_Engine_End_Date >= d.date_day
),

-- Count eligible orders per Date + App_Name + AFID_Channel
eligible_counts AS (
  SELECT 
    Date,
    App_Name,
    AFID_Channel,
    COUNT(DISTINCT Updated_Cust_ID) AS Count_of_Eligible_Orders
  FROM date_user_combinations
  GROUP BY Date, App_Name, AFID_Channel
),

-- Find successful orders within the date range for each customer
successful_orders_in_range AS (
  SELECT 
    duc.Date,
    duc.App_Name,
    duc.AFID_Channel,
    duc.Updated_Cust_ID,
    duc.Last_Eligible_Order_Date,
    duc.Eligible_Order_End_Date,
    s.Order_Id,
    s.Date_of_Sale,
    s.Billing_Cycle_Updated,
    ROW_NUMBER() OVER (
      PARTITION BY duc.Date, duc.App_Name, duc.AFID_Channel, duc.Updated_Cust_ID 
      ORDER BY s.Date_of_Sale DESC
    ) AS rn
  FROM date_user_combinations duc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON duc.Updated_Cust_ID = s.Updated_Cust_ID
    AND duc.Product_Name_Final = s.Product_Name_Final
  WHERE s.Final_Order_Status != 6
    AND s.Is_Chargeback != '1'
    AND s.Date_of_Sale > duc.Last_Eligible_Order_Date
    AND s.Date_of_Sale <= duc.Date
)

SELECT 
  duc.Date,
  duc.App_Name,
  duc.AFID_Channel,
  duc.Product_Name_Final,
  duc.Last_Eligible_Order_Date,
  duc.Eligible_Order_End_Date,
  duc.Updated_Cust_ID,
  ec.Count_of_Eligible_Orders,
  CASE 
    WHEN so.Order_Id IS NOT NULL THEN 'Yes'
    ELSE 'No'
  END AS Successful_Order_Within_Date,
  so.Order_Id AS Successful_Order_Within_Date_Order_ID,
  so.Date_of_Sale AS Successful_Order_Within_Date_Order_Date,
  so.Billing_Cycle_Updated AS Successful_Order_Within_Date_BC,
  CASE 
    WHEN so.Order_Id IS NOT NULL THEN 'No'
    WHEN duc.Date < DATE_ADD(duc.Eligible_Order_End_Date, INTERVAL 30 DAY) THEN 'Yes'
    ELSE 'No'
  END AS Retry_Engine
FROM date_user_combinations duc
LEFT JOIN eligible_counts ec
  ON duc.Date = ec.Date
  AND duc.App_Name = ec.App_Name
  AND duc.AFID_Channel = ec.AFID_Channel
LEFT JOIN successful_orders_in_range so
  ON duc.Date = so.Date
  AND duc.App_Name = so.App_Name
  AND duc.AFID_Channel = so.AFID_Channel
  AND duc.Updated_Cust_ID = so.Updated_Cust_ID
  AND so.rn = 1
ORDER BY duc.Date, duc.App_Name, duc.AFID_Channel, duc.Updated_Cust_ID;
