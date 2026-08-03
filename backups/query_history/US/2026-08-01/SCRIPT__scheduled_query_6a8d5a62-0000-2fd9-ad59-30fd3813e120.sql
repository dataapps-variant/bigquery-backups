-- job_id: scheduled_query_6a8d5a62-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-01T09:00:04.819000+00:00
-- started: 2026-08-01T09:00:04.871000+00:00
-- ended: 2026-08-01T09:00:09.031000+00:00

-- ============================================================
-- LMC Retention Pivot Table Script (v3)
-- Creates a cohort retention report with dynamic month columns
-- ============================================================

DECLARE min_month DATE;
DECLARE max_month DATE;
DECLARE pivot_columns STRING;
DECLARE sum_pivot_columns STRING;
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

SET min_month = (
  SELECT MIN(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)))
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
);

SET min_month = DATE_TRUNC(min_month, MONTH);
SET max_month = DATE_TRUNC(data_cutoff, MONTH);

-- ============================================================
-- Step 2: Generate dynamic pivot column names (MM-DD-YYYY format)
-- NOTE: Columns start from 01-01-2023 at the earliest
-- ============================================================

SET pivot_columns = (
  SELECT STRING_AGG(
    CONCAT(
      "MAX(CASE WHEN Current_Month = '", month_str, "' THEN retained_users ELSE NULL END) AS `", month_str, "`"
    ),
    ',\n    ' ORDER BY month_date
  )
  FROM (
    SELECT 
      month_date,
      FORMAT_DATE('%m-01-%Y', month_date) AS month_str
    FROM UNNEST(GENERATE_DATE_ARRAY(GREATEST(min_month, DATE '2023-01-01'), max_month, INTERVAL 1 MONTH)) AS month_date
  )
);

-- Generate SUM columns for the wrapper query
SET sum_pivot_columns = (
  SELECT STRING_AGG(
    CONCAT(
      "SUM(`", month_str, "`) AS `", month_str, "`"
    ),
    ',\n    ' ORDER BY month_date
  )
  FROM (
    SELECT 
      month_date,
      FORMAT_DATE('%m-01-%Y', month_date) AS month_str
    FROM UNNEST(GENERATE_DATE_ARRAY(GREATEST(min_month, DATE '2023-01-01'), max_month, INTERVAL 1 MONTH)) AS month_date
  )
);

-- ============================================================
-- Step 3: Build and execute the dynamic SQL
-- ============================================================

SET sql_query = CONCAT(
'''CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_Retention` AS

WITH base_data AS (
  SELECT
    Product_Name_Final,
    Updated_Cust_ID,
    Trial_Type,
    CAST(Billing_Cycle_Updated AS INT64) AS Billing_Cycle_Updated,
    DATE_TRUNC(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)), MONTH) AS Acquisition_Month,
CASE 
  WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
  WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
  ELSE NULL
END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) != 'SS'
),

logical_bc AS (
  SELECT
    b.Product_Name_Final,
    b.Updated_Cust_ID,
    b.Trial_Type,
    b.Billing_Cycle_Updated,
    b.Acquisition_Month,
    b.CT_Country_Group,
    COALESCE(bf.Billing_Frequency, 1) AS Billing_Frequency,
    CASE 
      WHEN b.Trial_Type = 'NT' THEN b.Billing_Cycle_Updated - 1
      ELSE b.Billing_Cycle_Updated
    END AS Logical_BC
  FROM base_data b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` lkp
    ON b.Product_Name_Final = lkp.Concat
  LEFT JOIN `variant-finance-data-project.Sticky_Data.LMC_Billing_Frequency` bf
    ON COALESCE(lkp.Updated_Concat, b.Product_Name_Final) = bf.Product_Name_Final
),

bc0_cohort AS (
  SELECT
    l.Product_Name_Final,
    l.CT_Country_Group,
    FORMAT_DATE('%m-01-%Y', l.Acquisition_Month) AS Plan_Start_Month,
    l.Acquisition_Month,
    COUNT(Distinct l.Updated_Cust_ID) AS BC0_Users
  FROM logical_bc l
  WHERE l.Logical_BC = 0
  AND l.Acquisition_Month <= DATE_TRUNC(DATE "''', CAST(data_cutoff AS STRING), '''", MONTH)
  GROUP BY l.Product_Name_Final, l.CT_Country_Group, l.Acquisition_Month
),

retention_mapping AS (
  SELECT
    l.Product_Name_Final,
    l.Updated_Cust_ID,
    l.Acquisition_Month,
    l.CT_Country_Group,
    l.Billing_Frequency,
    FORMAT_DATE('%m-01-%Y', l.Acquisition_Month) AS Plan_Start_Month,
    l.Logical_BC,
    CASE 
      WHEN l.Trial_Type = 'NT' 
        THEN DATE_ADD(l.Acquisition_Month, INTERVAL (l.Logical_BC * l.Billing_Frequency) MONTH)
      WHEN l.Logical_BC <= 1 THEN l.Acquisition_Month
      ELSE DATE_ADD(l.Acquisition_Month, INTERVAL ((l.Logical_BC - 1) * l.Billing_Frequency) MONTH)
    END AS Current_Month_Date
  FROM logical_bc l
  WHERE l.Logical_BC >= 1
),

retention_counts AS (
  SELECT
    r.Product_Name_Final,
    r.CT_Country_Group,
    r.Plan_Start_Month,
    r.Acquisition_Month,
    FORMAT_DATE('%m-01-%Y', r.Current_Month_Date) AS Current_Month,
    COUNT(DISTINCT r.Updated_Cust_ID) AS retained_users
  FROM retention_mapping r
  WHERE r.Current_Month_Date <= DATE "''', CAST(data_cutoff AS STRING), '''"
  GROUP BY r.Product_Name_Final, r.CT_Country_Group, r.Plan_Start_Month, r.Acquisition_Month, FORMAT_DATE('%m-01-%Y', r.Current_Month_Date)
),

combined_data AS (
  SELECT
    bc.Product_Name_Final,
    bc.CT_Country_Group,
    bc.Plan_Start_Month,
    bc.Acquisition_Month,
    bc.BC0_Users,
    rc.Current_Month,
    rc.retained_users
  FROM bc0_cohort bc
  LEFT JOIN retention_counts rc
    ON bc.Product_Name_Final = rc.Product_Name_Final
    AND bc.Acquisition_Month = rc.Acquisition_Month
    AND ((bc.CT_Country_Group IS NULL AND rc.CT_Country_Group IS NULL) 
         OR bc.CT_Country_Group = rc.CT_Country_Group)
),

base_result AS (
  SELECT
    CASE 
      WHEN cd.CT_Country_Group IS NOT NULL 
        THEN CONCAT(COALESCE(lkp.Updated_Concat, cd.Product_Name_Final), '-', cd.CT_Country_Group)
      ELSE COALESCE(lkp.Updated_Concat, cd.Product_Name_Final)
    END AS Product_Name_Final,
    cd.BC0_Users,
    cd.Plan_Start_Month,
    ''',
    pivot_columns,
'''
  FROM combined_data cd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` lkp
    ON cd.Product_Name_Final = lkp.Concat
  GROUP BY 
    CASE 
      WHEN cd.CT_Country_Group IS NOT NULL 
        THEN CONCAT(COALESCE(lkp.Updated_Concat, cd.Product_Name_Final), '-', cd.CT_Country_Group)
      ELSE COALESCE(lkp.Updated_Concat, cd.Product_Name_Final)
    END,
    cd.Plan_Start_Month, cd.Acquisition_Month, cd.BC0_Users
)

SELECT
  Product_Name_Final,
  SUM(BC0_Users) AS BC0_Users,
  Plan_Start_Month,
  ''',
  sum_pivot_columns,
'''
FROM base_result
GROUP BY Product_Name_Final, Plan_Start_Month
ORDER BY Product_Name_Final, Plan_Start_Month'''
);

-- Execute the dynamic query
EXECUTE IMMEDIATE sql_query;
