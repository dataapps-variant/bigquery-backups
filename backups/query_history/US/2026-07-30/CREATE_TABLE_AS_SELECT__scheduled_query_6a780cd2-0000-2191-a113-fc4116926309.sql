-- job_id: scheduled_query_6a780cd2-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:00:02.723000+00:00
-- started: 2026-07-30T09:00:03.096000+00:00
-- ended: 2026-07-30T09:00:59.343000+00:00

-- =====================================================
-- 15K VOL/VAL TABLE CREATION SCRIPT
-- Merger and Summarization of Main Table and Crystal Ball
-- 
-- PURPOSE:
-- Combine metrics from both tables at Product/Country level
-- Calculate T30_Days_User (initial subscriptions in last 30 days)
-- Calculate Profit metrics and Weighted Average LTV
-- 
-- OUTPUT: 17 columns + Weighted Average summary rows
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.VPU.15K_Vol_Val` AS

WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,  -- Yesterday
    DATE('2025-06-27') AS report_end_date,
    30 AS t30_days_window  -- Configurable: Days for T30_Days_User calculation
),

-- =====================================================
-- REPORT DATES GENERATION
-- =====================================================
report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
    (SELECT report_end_date FROM config),
    (SELECT report_start_date FROM config),
    INTERVAL 1 DAY
  )) AS report_date
),

-- =====================================================
-- MAIN TABLE AGGREGATION
-- Sum metrics across all billing cycles by key
-- =====================================================
main_table_agg AS (
  SELECT 
    Report_date,
    -- Add JP_ prefix when Country_Code = 'JP'
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END as Product_Name_Final,
    Country_Code,
    MAX(Entity_Name) as Entity_Name,
    MAX(App_Name) as App_Name,
    MAX(Trial_Type) as Trial_Type,
    
    -- Sum metrics across all billing cycles
    SUM(Net_ARPU_Discounted) as Net_ARPU_Discounted,
    SUM(Net_LTV_Discounted) as Net_LTV_Discounted,
    SUM(Recent_CAC) as Recent_CAC
    
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
  GROUP BY Report_date, 
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END,
    Country_Code
),

-- =====================================================
-- CRYSTAL BALL TABLE AGGREGATION
-- Sum metrics across all billing cycles by key
-- =====================================================
crystal_ball_agg AS (
  SELECT 
    Report_date,
    -- Add JP_ prefix when Country_Code = 'JP'
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END as Product_Name_Final,
    Country_Code,
    
    -- Sum metrics across all billing cycles (prefix with CB_)
    SUM(Net_ARPU_Discounted) as CB_Net_ARPU_Discounted,
    SUM(Net_LTV_Discounted) as CB_Net_LTV_Discounted,
    SUM(Recent_CAC) as CB_Recent_CAC
    
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
  GROUP BY Report_date, 
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END,
    Country_Code
),

-- =====================================================
-- T30_DAYS_USER CALCULATION (CT-SPECIFIC FILTERING)
-- Initial subscriptions in last t30_days_window days
-- BC0 for Non-NT, BC1 for NT
-- For CT App: Split by JP/Non-JP country
-- For Other Apps: Count all users
-- FIXED: Check base.App_Name instead of mta.App_Name
-- =====================================================
t30_days_user_calc AS (
  SELECT 
    mta.Report_date,
    mta.Product_Name_Final,
    mta.Country_Code,
    mta.Trial_Type,
    
    COUNT(DISTINCT base.Updated_Cust_ID) as T30_Days_User
    
  FROM main_table_agg mta
  CROSS JOIN config cfg
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Product_Name_Final = CASE 
         WHEN mta.Country_Code = 'JP' THEN REPLACE(mta.Product_Name_Final, 'JP_', '')
         ELSE mta.Product_Name_Final
       END
    -- Date range: [report_date - t30_days_window, report_date - 1]
    AND base.Date_of_Sale BETWEEN 
        DATE_SUB(mta.Report_date, INTERVAL cfg.t30_days_window DAY)
        AND DATE_SUB(mta.Report_date, INTERVAL 1 DAY)
    -- Billing cycle filter based on Trial_Type
    AND base.Billing_Cycle_Updated = CASE 
      WHEN mta.Trial_Type = 'NT' THEN 1
      ELSE 0
    END
    -- CT-SPECIFIC COUNTRY FILTERING (FIXED: using base.App_Name)
    AND (
      -- CT App with JP Country_Code: Only JP users
      (base.App_Name = 'CT' AND mta.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR 
      -- CT App with Non-JP Country_Code: Only non-JP users (including NULLs)
      (base.App_Name = 'CT' AND mta.Country_Code = 'Non-JP' AND COALESCE(base.Spend_Country_Code_AFID, 'Non-JP') != 'JP')
      OR
      -- All other Apps: Include all users regardless of country
      (base.App_Name != 'CT' OR base.App_Name IS NULL)
    )
  
  GROUP BY mta.Report_date, mta.Product_Name_Final, mta.Country_Code, mta.Trial_Type
),

-- =====================================================
-- MERGE ALL METRICS
-- Only include dates present in BOTH Main and Crystal Ball tables
-- =====================================================
merged_metrics AS (
  SELECT 
    mta.Report_date,
    mta.Product_Name_Final,
    mta.Entity_Name,
    mta.App_Name,
    mta.Country_Code,
    mta.Trial_Type,
    
    -- Main Table Metrics
    COALESCE(mta.Net_ARPU_Discounted, 0) as Net_ARPU_Discounted,
    COALESCE(mta.Net_LTV_Discounted, 0) as Net_LTV_Discounted,
    COALESCE(mta.Recent_CAC, 0) as Recent_CAC,
    
    -- Crystal Ball Metrics
    COALESCE(cba.CB_Net_ARPU_Discounted, 0) as CB_Net_ARPU_Discounted,
    COALESCE(cba.CB_Net_LTV_Discounted, 0) as CB_Net_LTV_Discounted,
    COALESCE(cba.CB_Recent_CAC, 0) as CB_Recent_CAC,
    
    -- T30_Days_User
    COALESCE(t30.T30_Days_User, 0) as T30_Days_User
    
  FROM main_table_agg mta
  INNER JOIN crystal_ball_agg cba
    ON mta.Report_date = cba.Report_date
    AND mta.Product_Name_Final = cba.Product_Name_Final
    AND mta.Country_Code = cba.Country_Code
  LEFT JOIN t30_days_user_calc t30
    ON mta.Report_date = t30.Report_date
    AND mta.Product_Name_Final = t30.Product_Name_Final
    AND mta.Country_Code = t30.Country_Code
),

-- =====================================================
-- CALCULATED METRICS
-- =====================================================
calculated_metrics AS (
  SELECT 
    mm.*,
    
    -- Ceiling Calculations
    mm.Net_ARPU_Discounted - 1.2 as BC4_CAC_Ceiling,
    mm.CB_Net_ARPU_Discounted - 1.2 as CB_BC4_CAC_Ceiling,
    
    -- Profit Calculations
    mm.T30_Days_User * mm.Net_LTV_Discounted as Profit,
    mm.T30_Days_User * mm.CB_Net_LTV_Discounted as CB_Profit
    
  FROM merged_metrics mm
),

-- =====================================================
-- WEIGHTED AVERAGE SUMMARY ROWS
-- One row per report_date with Product_Name_Final = "Variant Wt. Avg."
-- =====================================================
weighted_avg_summary AS (
  SELECT 
    Report_date,
    'Variant Wt. Avg.' as Product_Name_Final,
    CAST(NULL AS STRING) as Entity_Name,
    CAST(NULL AS STRING) as App_Name,
    CAST(NULL AS STRING) as Country_Code,
    CAST(NULL AS STRING) as Trial_Type,
    
    -- Weighted Avg Net_ARPU_Discounted (needed for BC4_CAC_Ceiling)
    SAFE_DIVIDE(SUM(Net_ARPU_Discounted * T30_Days_User), NULLIF(SUM(T30_Days_User), 0)) as Net_ARPU_Discounted,
    SAFE_DIVIDE(SUM(Profit), NULLIF(SUM(T30_Days_User), 0)) as Net_LTV_Discounted,
    
    -- Weighted Avg Recent_CAC
    SAFE_DIVIDE(SUM(Recent_CAC * T30_Days_User), NULLIF(SUM(T30_Days_User), 0)) as Recent_CAC,
    
    CAST(NULL AS FLOAT64) as CB_Net_ARPU_Discounted,
    SAFE_DIVIDE(SUM(CB_Profit), NULLIF(SUM(T30_Days_User), 0)) as CB_Net_LTV_Discounted,
    CAST(NULL AS FLOAT64) as CB_Recent_CAC,
    
    -- Average T30_Days_User
    CAST(AVG(T30_Days_User) AS INT64) as T30_Days_User,
    
    -- Weighted Avg BC4_CAC_Ceiling = Weighted_Avg_Net_ARPU_Discounted - 1.2
    SAFE_DIVIDE(SUM(Net_ARPU_Discounted * T30_Days_User), NULLIF(SUM(T30_Days_User), 0)) - 1.2 as BC4_CAC_Ceiling,
    CAST(NULL AS FLOAT64) as CB_BC4_CAC_Ceiling,
    
    CAST(NULL AS FLOAT64) as Profit,
    CAST(NULL AS FLOAT64) as CB_Profit
    
  FROM calculated_metrics
  GROUP BY Report_date
),

-- =====================================================
-- COMBINE REGULAR ROWS AND SUMMARY ROWS
-- =====================================================
final_output AS (
  SELECT * FROM calculated_metrics
  
  UNION ALL
  
  SELECT * FROM weighted_avg_summary
)

-- =====================================================
-- FINAL OUTPUT (17 COLUMNS)
-- =====================================================
SELECT 
  -- Dimensions (6)
  Report_date,
  Product_Name_Final,
  Entity_Name,
  App_Name,
  Country_Code,
  Trial_Type,
  
  -- Main Table Metrics (3)
  Net_ARPU_Discounted,
  Net_LTV_Discounted,
  Recent_CAC,
  
  -- Crystal Ball Metrics (3)
  CB_Net_ARPU_Discounted,
  CB_Net_LTV_Discounted,
  CB_Recent_CAC,
  
  -- T30_Days_User (1)
  T30_Days_User,
  
  -- Ceiling Calculations (2)
  BC4_CAC_Ceiling,
  CB_BC4_CAC_Ceiling,
  
  -- Profit Calculations (2)
  Profit,
  CB_Profit

FROM final_output
ORDER BY 
  Report_date DESC, 
  CASE WHEN Product_Name_Final = 'Variant Wt. Avg.' THEN 1 ELSE 0 END,  -- Summary rows at top
  Product_Name_Final, 
  Country_Code;
