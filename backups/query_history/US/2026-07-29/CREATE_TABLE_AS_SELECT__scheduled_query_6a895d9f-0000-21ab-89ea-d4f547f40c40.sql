-- job_id: scheduled_query_6a895d9f-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:45:02.806000+00:00
-- started: 2026-07-29T10:45:03.146000+00:00
-- ended: 2026-07-29T10:45:08.602000+00:00

-- =====================================================
-- CWC VOL/VAL AFID TABLE CREATION SCRIPT
-- Merger and Summarization of Main Table and Crystal Ball
-- WITH AFID AGGREGATION LEVEL
-- 
-- PURPOSE:
-- Combine metrics from both tables at Product/Country/AFID level
-- Calculate T30_Days_User (initial subscriptions in last 30 days)
-- Calculate Profit metrics and Weighted Average LTV
-- 
-- OUTPUT: 19 columns (added AFID dimension + Active_Inactive)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.CWC.CWC_Vol_Val_AFID` AS

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
    AFID,
    MAX(Entity_Name) as Entity_Name,
    MAX(App_Name) as App_Name,
    MAX(Trial_Type) as Trial_Type,
    MAX(Active_Inactive) as Active_Inactive,
    
    -- Sum metrics across all billing cycles
    SUM(Net_ARPU_Discounted) as Net_ARPU_Discounted,
    SUM(Net_LTV_Discounted) as Net_LTV_Discounted,
    SUM(Recent_CAC) as Recent_CAC
    
  FROM `variant-finance-data-project.CWC.CWC_Main_Table`
  GROUP BY Report_date, 
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END,
    Country_Code,
    AFID
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
    AFID,
    
    -- Sum metrics across all billing cycles (prefix with CB_)
    SUM(Net_ARPU_Discounted) as CB_Net_ARPU_Discounted,
    SUM(Net_LTV_Discounted) as CB_Net_LTV_Discounted,
    SUM(Recent_CAC) as CB_Recent_CAC
    
  FROM `variant-finance-data-project.CWC.CWC_Crystal_Ball`
  GROUP BY Report_date, 
    CASE 
      WHEN Country_Code = 'JP' THEN CONCAT('JP_', Product_Name_Final)
      ELSE Product_Name_Final
    END,
    Country_Code,
    AFID
),

-- =====================================================
-- T30_DAYS_USER CALCULATION (CT-SPECIFIC FILTERING)
-- Initial subscriptions in last t30_days_window days
-- BC0 for Non-NT, BC1 for NT
-- For CT App: Split by JP/Non-JP country
-- For Other Apps: Count all users
-- INCLUDES AFID MATCHING
-- =====================================================
t30_days_user_calc AS (
  SELECT 
    mta.Report_date,
    mta.Product_Name_Final,
    mta.Country_Code,
    mta.AFID,
    mta.Trial_Type,
    
    COUNT(DISTINCT base.Updated_Cust_ID) as T30_Days_User
    
  FROM main_table_agg mta
  CROSS JOIN config cfg
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON mta.Product_Name_Final = CASE 
     WHEN base.App_Name = 'CT' AND base.Spend_Country_Code_AFID = 'JP' 
       THEN CONCAT('JP_', base.Product_Name_Final_Merged)
     ELSE base.Product_Name_Final_Merged
   END
    -- AFID matching
    AND mta.AFID = base.AFID_CHANNEL
    -- Date range: [report_date - t30_days_window, report_date - 1]
    AND base.Date_of_Sale BETWEEN 
        DATE_SUB(mta.Report_date, INTERVAL cfg.t30_days_window DAY)
        AND DATE_SUB(mta.Report_date, INTERVAL 1 DAY)
    -- Billing cycle filter based on Trial_Type
    AND base.Billing_Cycle_Updated = CASE 
      WHEN mta.Trial_Type = 'NT' THEN 1
      ELSE 0
    END
      
  GROUP BY mta.Report_date, mta.Product_Name_Final, mta.Country_Code, mta.AFID, mta.Trial_Type
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
    mta.AFID,
    mta.Trial_Type,
    mta.Active_Inactive,
    
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
    AND mta.AFID = cba.AFID
  LEFT JOIN t30_days_user_calc t30
    ON mta.Report_date = t30.Report_date
    AND mta.Product_Name_Final = t30.Product_Name_Final
    AND mta.Country_Code = t30.Country_Code
    AND mta.AFID = t30.AFID
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
    CAST(NULL AS INT64) as AFID,
    CAST(NULL AS STRING) as Trial_Type,
    CAST(NULL AS STRING) as Active_Inactive,
    
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
-- FINAL OUTPUT (19 COLUMNS)
-- =====================================================
SELECT 
  -- Dimensions (8)
  Report_date,
  Product_Name_Final,
  Entity_Name,
  App_Name,
  Country_Code,
  AFID,
  CASE 
    WHEN AFID IS NULL THEN Product_Name_Final
    ELSE CONCAT(Product_Name_Final, '_', CAST(AFID AS STRING))
  END AS Product_AFID,
  Trial_Type,
  Active_Inactive,
  
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
  Country_Code,
  AFID;

-- =====================================================
-- SCRIPT COMPLETE - CWC VOL/VAL AFID TABLE
-- Table: variant-finance-data-project.CWC.CWC_Vol_Val_AFID
-- 
-- STRUCTURE:
-- - Regular rows: One per (Report_date, Product_Name_Final, Country_Code, AFID)
-- - Summary rows: One per Report_date with Product_Name_Final = "Variant Wt. Avg."
-- 
-- KEY FEATURES:
-- 1. Aggregates metrics from Main Table and Crystal Ball across all billing cycles
-- 2. T30_Days_User: Initial subscriptions in last t30_days_window days (filtered by AFID)
-- 3. CT-specific country filtering for T30_Days_User (uses base.App_Name)
-- 4. AFID matching using base.AFID_CHANNEL
-- 5. Ceiling calculations: Net_ARPU_Discounted - 1.2
-- 6. Profit calculations: T30_Days_User * Net_LTV_Discounted
-- 7. Weighted Average LTV: SUM(Profit) / SUM(T30_Days_User) per report_date
-- 8. Weighted Average Recent_CAC: SUM(Recent_CAC * T30_Days_User) / SUM(T30_Days_User)
-- 9. Weighted Average BC4_CAC_Ceiling: Weighted_Avg_Net_ARPU_Discounted - 1.2
-- 10. Average T30_Days_User in summary row
-- 11. Active_Inactive pulled from Main Table
-- 
-- CONFIGURATION:
-- - t30_days_window = 30 (configurable in config CTE)
-- 
-- COLUMNS: 19 (added AFID dimension + Active_Inactive)
-- - Dimensions: 8 (added AFID + Active_Inactive)
-- - Main Metrics: 3
-- - Crystal Ball Metrics: 3
-- - T30_Days_User: 1
-- - Ceilings: 2
-- - Profits: 2
-- 
-- SOURCE TABLES:
-- - Main Table: variant-finance-data-project.CWC.CWC_Main_Table
-- - Crystal Ball: variant-finance-data-project.CWC.CWC_Crystal_Ball
-- - Base Table: variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL
-- 
-- WEIGHTED AVERAGE SUMMARY ROW CALCULATIONS:
-- - Net_ARPU_Discounted: SUM(Net_ARPU_Discounted * T30_Days_User) / SUM(T30_Days_User)
-- - Net_LTV_Discounted: SUM(Profit) / SUM(T30_Days_User)
-- - Recent_CAC: SUM(Recent_CAC * T30_Days_User) / SUM(T30_Days_User)
-- - BC4_CAC_Ceiling: Weighted_Avg_Net_ARPU_Discounted - 1.2
-- - T30_Days_User: AVG(T30_Days_User)
-- - CB_Net_LTV_Discounted: SUM(CB_Profit) / SUM(T30_Days_User)
-- =====================================================
