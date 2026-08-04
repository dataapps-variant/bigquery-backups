-- =====================================================================
-- TWO SUCCESSFUL TRANSACTIONS QUERY (120 Days Before & After Dispute)
-- =====================================================================
-- Purpose: Identify two successful transactions within 120 days before 
--          AND after each disputed transaction for chargeback defense
-- =====================================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Chargeback_Analysis` AS

WITH 
-- Step 1: Get all disputed transactions (post 2025-01-01)
disputed_transactions AS (
  SELECT 
    App_Name,
    Bill_Email AS Email_ID,
    Customer_Number,
    Order_Id AS Dispute_Order_ID,
    Date_of_Sale AS Dispute_Date
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Is_Chargeback = '1'
    AND Date_of_Sale >= '2025-01-01'
),

-- Step 2: Get all successful transactions
successful_transactions AS (
  SELECT 
    Customer_Number,
    Order_Id,
    Date_of_Sale
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Is_Chargeback = '0'
    AND Final_Order_Status IN (2, 6)
),

-- Step 3: Join disputed with successful transactions BEFORE dispute (including dispute date)
successful_before AS (
  SELECT 
    d.Dispute_Order_ID,
    s.Order_Id AS Successful_Order_ID,
    s.Date_of_Sale AS Successful_Order_Date,
    ROW_NUMBER() OVER (
      PARTITION BY d.Dispute_Order_ID 
      ORDER BY s.Date_of_Sale DESC, s.Order_Id DESC
    ) AS rn
  FROM disputed_transactions d
  INNER JOIN successful_transactions s
    ON d.Customer_Number = s.Customer_Number
    AND s.Date_of_Sale <= d.Dispute_Date
    AND s.Date_of_Sale >= DATE_SUB(d.Dispute_Date, INTERVAL 120 DAY)
    AND s.Order_Id != d.Dispute_Order_ID  -- Exclude the disputed order itself
),

-- Step 4: Join disputed with successful transactions AFTER dispute
successful_after AS (
  SELECT 
    d.Dispute_Order_ID,
    s.Order_Id AS Successful_Order_ID,
    s.Date_of_Sale AS Successful_Order_Date,
    ROW_NUMBER() OVER (
      PARTITION BY d.Dispute_Order_ID 
      ORDER BY s.Date_of_Sale ASC, s.Order_Id ASC
    ) AS rn
  FROM disputed_transactions d
  INNER JOIN successful_transactions s
    ON d.Customer_Number = s.Customer_Number
    AND s.Date_of_Sale > d.Dispute_Date
    AND s.Date_of_Sale <= DATE_ADD(d.Dispute_Date, INTERVAL 120 DAY)
),

-- Step 5: Count successful transactions before
count_before AS (
  SELECT 
    Dispute_Order_ID,
    COUNT(*) AS Successful_Tx_Before_Count
  FROM successful_before
  GROUP BY Dispute_Order_ID
),

-- Step 6: Count successful transactions after
count_after AS (
  SELECT 
    Dispute_Order_ID,
    COUNT(*) AS Successful_Tx_After_Count
  FROM successful_after
  GROUP BY Dispute_Order_ID
),

-- Step 7: Get 1st and 2nd successful transactions BEFORE
before_1st AS (
  SELECT Dispute_Order_ID, Successful_Order_ID, Successful_Order_Date
  FROM successful_before WHERE rn = 1
),
before_2nd AS (
  SELECT Dispute_Order_ID, Successful_Order_ID, Successful_Order_Date
  FROM successful_before WHERE rn = 2
),

-- Step 8: Get 1st and 2nd successful transactions AFTER
after_1st AS (
  SELECT Dispute_Order_ID, Successful_Order_ID, Successful_Order_Date
  FROM successful_after WHERE rn = 1
),
after_2nd AS (
  SELECT Dispute_Order_ID, Successful_Order_ID, Successful_Order_Date
  FROM successful_after WHERE rn = 2
)

-- Final Output
SELECT 
  -- Basic Info
  d.App_Name,
  d.Email_ID,
  d.Customer_Number,
  d.Dispute_Order_ID,
  d.Dispute_Date,
  
  -- BEFORE Window (120 days)
  COALESCE(cb.Successful_Tx_Before_Count, 0) AS Successful_Tx_Before_Count,
  CASE 
    WHEN COALESCE(cb.Successful_Tx_Before_Count, 0) >= 2 THEN 'Yes' 
    ELSE 'No' 
  END AS Two_Successful_Before,
  b1.Successful_Order_ID AS Latest_Successful_Order_ID_Before,
  b1.Successful_Order_Date AS Latest_Successful_Order_Date_Before,
  b2.Successful_Order_ID AS Second_Successful_Order_ID_Before,
  b2.Successful_Order_Date AS Second_Successful_Order_Date_Before,
  
  -- AFTER Window (120 days)
  COALESCE(ca.Successful_Tx_After_Count, 0) AS Successful_Tx_After_Count,
  CASE 
    WHEN COALESCE(ca.Successful_Tx_After_Count, 0) >= 2 THEN 'Yes' 
    ELSE 'No' 
  END AS Two_Successful_After,
  a1.Successful_Order_ID AS First_Successful_Order_ID_After,
  a1.Successful_Order_Date AS First_Successful_Order_Date_After,
  a2.Successful_Order_ID AS Second_Successful_Order_ID_After,
  a2.Successful_Order_Date AS Second_Successful_Order_Date_After

FROM disputed_transactions d

-- Join counts
LEFT JOIN count_before cb ON d.Dispute_Order_ID = cb.Dispute_Order_ID
LEFT JOIN count_after ca ON d.Dispute_Order_ID = ca.Dispute_Order_ID

-- Join before transactions
LEFT JOIN before_1st b1 ON d.Dispute_Order_ID = b1.Dispute_Order_ID
LEFT JOIN before_2nd b2 ON d.Dispute_Order_ID = b2.Dispute_Order_ID

-- Join after transactions
LEFT JOIN after_1st a1 ON d.Dispute_Order_ID = a1.Dispute_Order_ID
LEFT JOIN after_2nd a2 ON d.Dispute_Order_ID = a2.Dispute_Order_ID

ORDER BY d.App_Name, d.Email_ID, d.Dispute_Date;
