-- job_id: script_job_4a8affe2014db7d82fc7dba6d5acc6b7_0
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:00:15.039000+00:00
-- started: 2026-07-29T09:00:15.303000+00:00
-- ended: 2026-07-29T09:00:17.457000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_SS_Num_Den` AS
WITH 
-- Numerator: SS BC0 distinct customers
SS_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS ss_bc0_users,
    CASE 
      WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
      ELSE NULL
    END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "2026-06-30"
  
  GROUP BY Product_Name_Final, month, CT_Country_Group
),

-- Map SS to Main Plan(s)
SS_with_Main AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group,
    d.Product_Name_Final_Main
  FROM SS_BC0 s
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS` d
    ON s.Product_Name_Final = d.Product_Name_Final_SS
    AND PARSE_DATE('%m-%d-%Y', s.month) BETWEEN d.Start_date AND d.End_date
),

-- Denominator: Main plan BC0 distinct customers
Main_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS main_bc0_users,
    CASE 
      WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
      ELSE NULL
    END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "2026-06-30"
  GROUP BY Product_Name_Final, month, CT_Country_Group
),

-- Combine: Sum denominator across matched main plans
SS_Main_Combined AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group,
    SUM(m.main_bc0_users) AS total_main_bc0_users
  FROM SS_with_Main s
  LEFT JOIN Main_BC0 m
    ON s.Product_Name_Final_Main = m.Product_Name_Final
    AND s.month = m.month
    AND ((s.CT_Country_Group IS NULL AND m.CT_Country_Group IS NULL)
         OR s.CT_Country_Group = m.CT_Country_Group)
  GROUP BY 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group
)

-- Final output with Numerator, Denominator, and Ratio
SELECT 
  CASE 
    WHEN CT_Country_Group IS NOT NULL 
      THEN CONCAT(Product_Name_Final, '-', CT_Country_Group)
    ELSE Product_Name_Final
  END AS Product_Name_Final,
  PARSE_DATE('%m-%d-%Y', month) AS Month_Date,
  FORMAT_DATE('%b %Y', PARSE_DATE('%m-%d-%Y', month)) AS Month_Label,
  ss_bc0_users AS Numerator_SS_Users,
  total_main_bc0_users AS Denominator_Main_Users,
  ROUND(SAFE_DIVIDE(ss_bc0_users, total_main_bc0_users), 4) AS Ratio
FROM SS_Main_Combined
ORDER BY Product_Name_Final, Month_Date
