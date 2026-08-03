-- job_id: scheduled_query_6aa7a733-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T09:00:10.902000+00:00
-- started: 2026-08-03T09:00:10.943000+00:00
-- ended: 2026-08-03T09:00:13.092000+00:00

-- ============================================================
-- LMC SS Users Pivot Table Script
-- Creates SS BC0 users report with dynamic month columns
-- ============================================================

DECLARE min_month DATE;
DECLARE max_month DATE;
DECLARE pivot_months STRING;
DECLARE sql_query STRING;

-- ============================================================
-- DATA CUTOFF CONFIGURATION
-- Set to NULL for auto (last day of previous month)
-- Or set a specific date like DATE '2025-06-30'
-- ============================================================
DECLARE data_cutoff_input DATE DEFAULT NULL;
DECLARE data_cutoff DATE;

SET data_cutoff = IFNULL(
  data_cutoff_input,
  DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 DAY)
);

-- ============================================================
-- Step 1: Determine date range for pivot columns
-- ============================================================

SET min_month = DATE '2023-01-01';
SET max_month = DATE_TRUNC(data_cutoff, MONTH);

-- ============================================================
-- Step 2: Generate dynamic pivot month list
-- ============================================================

SET pivot_months = (
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
);

-- ============================================================
-- Step 3: Build and execute the dynamic SQL
-- ============================================================

SET sql_query = CONCAT(
'''CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_SS_Users` AS
WITH 
SS_BC0 AS (
  SELECT 
    CONCAT(
  SUBSTR(Product_Name_Final, 1, 2),
  LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
  RIGHT(Product_Name_Final, 2)
) AS Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_Cust_ID) AS ss_bc0_users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "''', CAST(data_cutoff AS STRING), '''"
    
  GROUP BY 
  CONCAT(
    SUBSTR(Product_Name_Final, 1, 2),
    LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
    RIGHT(Product_Name_Final, 2)
  ),
  month
)

SELECT * FROM SS_BC0
PIVOT (
  MAX(ss_bc0_users) 
  FOR month IN (''', pivot_months, ''')
)
ORDER BY Product_Name_Final'''
);

-- Execute the dynamic query
EXECUTE IMMEDIATE sql_query;
