-- job_id: scheduled_query_6af24065-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T10:30:01.445000+00:00
-- started: 2026-08-03T10:30:01.819000+00:00
-- ended: 2026-08-03T10:30:19.720000+00:00

-- =====================================================
-- CWC APP LEVEL TABLE CREATION SCRIPT
-- App-Level aggregation from 15K_Main_Table_MP
-- Date Range: Current Date to last 100 days
-- Recent metrics calculated over 7-day window
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.CWC.CWC_App_Level` AS

WITH 
-- =====================================================
-- CONFIGURATION
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY) AS report_start_date,
    CURRENT_DATE() AS report_end_date
),

-- =====================================================
-- BASE DATA FROM 15K_Main_Table_MP
-- =====================================================
base_data AS (
  SELECT 
    Report_date,
    Billing_Cycle,
    App_Name,
    Subscription_users,
    Subscription_value,
    Rebill_users,
    Rebill_value,
    Churn_rate,
    Wt_Avg_Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Net_ARPU_Discounted
  FROM `variant-finance-data-project.VPU_Merged.Entity_Level_Main_MP`
  WHERE Report_date BETWEEN (SELECT report_start_date FROM config) 
                        AND (SELECT report_end_date FROM config)
),

-- =====================================================
-- RECENT SPEND CALCULATION (Last 7 Days)
-- Grouped by Report_date and App_Name only
-- =====================================================
recent_spend_calc AS (
  SELECT 
    bd.Report_date,
    bd.App_Name,
    COALESCE(SUM(ads.allocated_spend), 0) AS Recent_Spend
  FROM (SELECT DISTINCT Report_date, App_Name FROM base_data) bd
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bd.App_Name = ads.App_Name
    AND ads.Date BETWEEN DATE_SUB(bd.Report_date, INTERVAL 6 DAY) AND bd.Report_date
  GROUP BY bd.Report_date, bd.App_Name
),

-- =====================================================
-- RECENT USERS CALCULATION (Last 7 Days)
-- Trial_Type logic:
--   NT: Billing_Cycle_Updated = 1
--   SS: Ignore
--   Others: Billing_Cycle_Updated = 0
-- CT App split by Spend_Country_Code_AFID (JP vs Non-JP)
-- =====================================================
recent_users_calc AS (
  SELECT 
    bd.Report_date,
    bd.App_Name,
    COUNT(DISTINCT sticky.Updated_Cust_ID) AS Recent_Users
  FROM (SELECT DISTINCT Report_date, App_Name FROM base_data) bd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sticky
    ON CASE 
         WHEN sticky.App_Name = 'CT' AND sticky.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
         WHEN sticky.App_Name = 'CT' THEN 'CT-Non-JP'
         ELSE sticky.App_Name
       END = bd.App_Name
    AND sticky.Date_of_Sale BETWEEN DATE_SUB(bd.Report_date, INTERVAL 6 DAY) AND bd.Report_date
    AND sticky.Trial_Type != 'SS'
    AND (
      (sticky.Trial_Type = 'NT' AND sticky.Billing_Cycle_Updated = 1)
      OR
      (sticky.Trial_Type != 'NT' AND sticky.Billing_Cycle_Updated = 0)
    )
  GROUP BY bd.Report_date, bd.App_Name
),

-- =====================================================
-- MERGE BASE DATA WITH CALCULATED METRICS
-- =====================================================
merged_data AS (
  SELECT 
    bd.Report_date,
    bd.Billing_Cycle,
    bd.App_Name,
    bd.Subscription_users,
    bd.Subscription_value,
    bd.Rebill_users,
    bd.Rebill_value,
    bd.Churn_rate,
    bd.Wt_Avg_Refund_ratio,
    bd.Retention_rate,
    bd.NET_Retention_rate,
    bd.Net_ARPU_Discounted,
    
    -- Recent metrics (join without Billing_Cycle)
    rs.Recent_Spend,
    ru.Recent_Users,
    
    -- T7D calculations
    rs.Recent_Spend / 7.0 AS T7D_Spend,
    ru.Recent_Users / 7.0 AS T7D_Users,
    
    -- Recent CAC calculation
    CASE 
      WHEN ru.Recent_Users > 0 THEN rs.Recent_Spend / ru.Recent_Users
      ELSE 0.0
    END AS Recent_CAC_raw
    
  FROM base_data bd
  LEFT JOIN recent_spend_calc rs
    ON bd.Report_date = rs.Report_date
    AND bd.App_Name = rs.App_Name
  LEFT JOIN recent_users_calc ru
    ON bd.Report_date = ru.Report_date
    AND bd.App_Name = ru.App_Name
),

-- =====================================================
-- APPLY NULL CASCADE LOGIC + BC0-ONLY DISPLAY LOGIC
-- When Retention_rate IS NULL, set specific columns to NULL
-- Recent metrics only shown at BC0
-- =====================================================
null_cascade_applied AS (
  SELECT 
    md.Report_date,
    md.Billing_Cycle,
    md.App_Name,
    md.Subscription_users,
    md.Subscription_value,
    md.Rebill_users,
    md.Rebill_value,
    
    -- BC0-only display for Recent_Spend, Recent_Users, T7D_Spend, T7D_Users
    CASE WHEN md.Billing_Cycle = 0 THEN md.Recent_Spend ELSE NULL END AS Recent_Spend,
    CASE WHEN md.Billing_Cycle = 0 THEN md.Recent_Users ELSE NULL END AS Recent_Users,
    CASE WHEN md.Billing_Cycle = 0 THEN md.T7D_Spend ELSE NULL END AS T7D_Spend,
    CASE WHEN md.Billing_Cycle = 0 THEN md.T7D_Users ELSE NULL END AS T7D_Users,
    
    -- Apply NULL cascade logic
    CASE 
      WHEN md.Retention_rate IS NULL THEN NULL
      ELSE md.Churn_rate
    END AS Churn_rate,
    
    CASE 
      WHEN md.Retention_rate IS NULL THEN NULL
      ELSE md.Wt_Avg_Refund_ratio
    END AS Refund_ratio,
    
    -- Recent_CAC: BC0-only + NULL cascade
    CASE 
      WHEN md.Billing_Cycle != 0 THEN NULL
      WHEN md.Retention_rate IS NULL THEN NULL
      ELSE md.Recent_CAC_raw
    END AS Recent_CAC,
    
    md.Retention_rate,
    
    CASE 
      WHEN md.Retention_rate IS NULL THEN NULL
      ELSE md.NET_Retention_rate
    END AS NET_Retention_rate,
    
    CASE 
      WHEN md.Retention_rate IS NULL THEN NULL
      ELSE md.Net_ARPU_Discounted
    END AS Net_ARPU_Discounted
    
  FROM merged_data md
),

-- =====================================================
-- CALCULATE NET_BC4_ARPU
-- Cumulative sum shown only at BC4, when BC4 value is not null/zero
-- =====================================================
final_with_bc4 AS (
  SELECT 
    nca.*,
    
    -- Net_BC4_ARPU: Only show at BC4, only if BC4's Net_ARPU_Discounted is not null/zero
    CASE 
      WHEN nca.Billing_Cycle = 4 
           AND nca.Net_ARPU_Discounted IS NOT NULL 
           AND nca.Net_ARPU_Discounted != 0 
      THEN SUM(nca.Net_ARPU_Discounted) OVER (
        PARTITION BY nca.Report_date, nca.App_Name 
        ORDER BY nca.Billing_Cycle
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      )
      ELSE NULL
    END AS Net_BC4_ARPU
    
  FROM null_cascade_applied nca
)

-- =====================================================
-- FINAL OUTPUT - 18 Columns
-- =====================================================
SELECT 
  Report_date,
  Billing_Cycle,
  App_Name,
  Subscription_users,
  Subscription_value,
  Rebill_users,
  Rebill_value,
  Recent_Spend,
  Recent_Users,
  T7D_Spend,
  T7D_Users,
  Churn_rate,
  Refund_ratio,
  Recent_CAC,
  Retention_rate,
  NET_Retention_rate,
  Net_ARPU_Discounted,
  Net_BC4_ARPU
FROM final_with_bc4
ORDER BY Report_date DESC, App_Name, Billing_Cycle;

-- =====================================================
-- SCRIPT COMPLETE - CWC APP LEVEL TABLE
-- 
-- KEY FEATURES:
-- =====================================================
-- 
-- 1. Date Range: Last 100 days (CURRENT_DATE() - 100 to CURRENT_DATE())
-- 2. Recent_Spend: 7-day rolling sum by App_Name from Ad_spend_data
--    - Grouped by Report_date and App_Name only
--    - Displayed only at BC0
-- 3. Recent_Users: 7-day rolling count by App_Name from Sticky_data
--    - Trial_Type = 'NT' → Billing_Cycle_Updated = 1
--    - Trial_Type = 'SS' → Ignored
--    - Trial_Type = other → Billing_Cycle_Updated = 0
--    - CT App split: JP → CT-JP, Non-JP → CT-Non-JP
--    - Displayed only at BC0
-- 4. T7D metrics: Daily averages (Recent_Spend/7, Recent_Users/7)
--    - Displayed only at BC0
-- 5. Recent_CAC: Recent_Spend / Recent_Users
--    - Displayed only at BC0
-- 6. Net_BC4_ARPU: Cumulative sum of Net_ARPU_Discounted (BC0-BC4), 
--    shown only at BC4 when BC4 value is not null/zero
-- 7. NULL Cascade: When Retention_rate IS NULL, the following are also NULL:
--    - Churn_rate
--    - Refund_ratio
--    - Recent_CAC
--    - NET_Retention_rate
--    - Net_ARPU_Discounted
-- 
-- OUTPUT COLUMNS: 18
-- =====================================================
