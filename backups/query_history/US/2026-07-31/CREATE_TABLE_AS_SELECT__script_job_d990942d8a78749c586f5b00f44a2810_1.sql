-- job_id: script_job_d990942d8a78749c586f5b00f44a2810_1
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T10:13:16.967000+00:00
-- started: 2026-07-31T10:13:17.540000+00:00
-- ended: 2026-07-31T10:13:18.922000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_SS` AS
WITH 

SS_BC0 AS (
  SELECT 
    Product_Name_Final_Merged AS Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS ss_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final_Merged, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "2026-06-30"
  GROUP BY Product_Name_Final, month
),

SS_with_Main AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    d.Product_Name_Final_Main
  FROM SS_BC0 s
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS` d
    ON s.Product_Name_Final = d.Product_Name_Final_SS
    AND PARSE_DATE('%m-%d-%Y', s.month) BETWEEN d.Start_date AND d.End_date
),

Main_BC0 AS (
  SELECT 
    Product_Name_Final_Merged AS Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS main_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle_Updated = CASE 
        WHEN RIGHT(Product_Name_Final_Merged, 2) = 'NT' THEN 1 
        ELSE 0 
      END
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "2026-06-30"
  GROUP BY Product_Name_Final, month
),

SS_Main_Combined AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    SUM(m.main_bc0_users) AS total_main_bc0_users
  FROM SS_with_Main s
  LEFT JOIN Main_BC0 m
    ON s.Product_Name_Final_Main = m.Product_Name_Final
    AND s.month = m.month
  GROUP BY 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users
),

Ratio_Calc AS (
  SELECT 
    Product_Name_Final,
    month,
    ROUND(SAFE_DIVIDE(ss_bc0_users, total_main_bc0_users), 4) AS ratio
  FROM SS_Main_Combined
),

Pivoted AS (
  SELECT * FROM Ratio_Calc
  PIVOT (
    MAX(ratio) 
    FOR month IN ('1-1-2023', '2-1-2023', '3-1-2023', '4-1-2023', '5-1-2023', '6-1-2023', '7-1-2023', '8-1-2023', '9-1-2023', '10-1-2023', '11-1-2023', '12-1-2023', '1-1-2024', '2-1-2024', '3-1-2024', '4-1-2024', '5-1-2024', '6-1-2024', '7-1-2024', '8-1-2024', '9-1-2024', '10-1-2024', '11-1-2024', '12-1-2024', '1-1-2025', '2-1-2025', '3-1-2025', '4-1-2025', '5-1-2025', '6-1-2025', '7-1-2025', '8-1-2025', '9-1-2025', '10-1-2025', '11-1-2025', '12-1-2025', '1-1-2026', '2-1-2026', '3-1-2026', '4-1-2026', '5-1-2026', '6-1-2026')
  )
)

-- ✅ ONLY CHANGE: Final output formatting
SELECT
  CONCAT(
    SUBSTR(Product_Name_Final, 1, 2),
    LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
    RIGHT(Product_Name_Final, 2)
  ) AS Product_Name_Final,
  * EXCEPT(Product_Name_Final)
FROM Pivoted
ORDER BY Product_Name_Final
