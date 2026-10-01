WITH 
-- Step 1: Get BC0 counts for SS products by month
SS_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%Y-%m', Date_of_Sale) AS month,
    COUNT(DISTINCT Order_Id) AS ss_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Is_Refund = "no"
  GROUP BY Product_Name_Final, FORMAT_DATE('%Y-%m', Date_of_Sale)
),

-- Step 2: Join to dim table to get Main Plan (month falls between Start_date and End_date)
SS_with_Main AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    d.Product_Name_Final_Main
  FROM SS_BC0 s
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS` d
    ON s.Product_Name_Final = d.Product_Name_Final_SS
    AND DATE(CONCAT(s.month, '-01')) BETWEEN d.Start_date AND d.End_date
),

-- Step 3: Get BC0 counts for all products by month (to lookup Main Plan counts)
Main_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%Y-%m', Date_of_Sale) AS month,
    COUNT(DISTINCT Order_Id) AS main_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
  GROUP BY Product_Name_Final, FORMAT_DATE('%Y-%m', Date_of_Sale)
),

-- Step 4: Calculate Ratio (SS BC0 Users / Main Plan BC0 Users) - Rounded to 2 decimals
Ratio_Calc AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    ROUND(SAFE_DIVIDE(s.ss_bc0_users, m.main_bc0_users), 2) AS ratio
  FROM SS_with_Main s
  LEFT JOIN Main_BC0 m
    ON s.Product_Name_Final_Main = m.Product_Name_Final
    AND s.month = m.month
)

-- Step 5: Pivot by month
SELECT * FROM Ratio_Calc
PIVOT (
  MAX(ratio) 
  FOR month IN (
    '2023-01', '2023-02', '2023-03', '2023-04', '2023-05', '2023-06',
    '2023-07', '2023-08', '2023-09', '2023-10', '2023-11', '2023-12',
    '2024-01', '2024-02', '2024-03', '2024-04', '2024-05', '2024-06',
    '2024-07', '2024-08', '2024-09', '2024-10', '2024-11', '2024-12',
    '2025-01', '2025-02', '2025-03', '2025-04', '2025-05', '2025-06',
    '2025-07', '2025-08', '2025-09', '2025-10', '2025-11', '2025-12',
    '2026-01'
  )
)
ORDER BY Product_Name_Final
