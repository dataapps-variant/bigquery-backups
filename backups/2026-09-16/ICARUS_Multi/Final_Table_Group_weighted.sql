-- Add these 2 lines at top
CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.proc_Final_Tabl_Group_Weighted`()
BEGIN



-- =====================================================
-- FINAL TABLE CREATION SCRIPT - UPDATED
-- Merge of 7K Crystal Ball and Main Tables
-- 
-- OUTPUT: 24 columns
-- 
-- CHANGES IN THIS VERSION:
--   1. Added Value column (CB_Value / Rebill_Value) from source tables
--   2. Net_ARPU_Discounted → group-level weighted avg, then cumulated
--   3. Recent_CAC → recomputed from source (global last_spend_date, 7-day window)
--   4. Net_LTV_Discounted → Cumulative group Net_ARPU − Recent_CAC
--   5. No null cascade on Net_ARPU, Net_LTV, Recent_CAC (always shown)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_Group_weighted` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- Standardize column names and add identifiers
-- NEW: Added Value column (CB_Value for CB, Rebill_Value for Main)
-- =====================================================
unioned_data AS (
  -- Table 1: 7K_30D_Crystal_Ball
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    CAC,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    CB_Value as Value,
    '7K_30D' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
  
  UNION ALL
  
  -- Table 2: 7K_Crystal_Ball
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    CAC,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    CB_Value as Value,
    '7K' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
  
  UNION ALL
  
  -- Table 3: 7K_30D_Main_Table
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    CAC,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Rebill_Value as Value,
    '7K_30D' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
  
  UNION ALL
  
  -- Table 4: 7K_Main_Table
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    CAC,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Rebill_Value as Value,
    '7K' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
),

-- =====================================================
-- STEP 2: CALCULATE CUMULATIVE METRICS (PRODUCT-LEVEL)
-- Running sum of ARPU_Discounted only (Gross stays product-level)
-- Net_ARPU and Net_LTV are now group-level → handled separately
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    
    -- Cumulative Gross_ARPU_Discounted (stays product-level)
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted
    
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST RECENT_CAC, COHORT_CAC, AND T30D_NEW_USERS
-- Take values from BC0 (non-NT) or BC1 (NT)
-- Broadcast these values to ALL billing cycles
-- NOTE: Recent_CAC_Broadcasted kept for reference but replaced by source-based calc
-- =====================================================
recent_cac_broadcast AS (
  SELECT 
    cm.*,
    
    -- Get Recent_CAC from BC0 (non-NT) or BC1 (NT) and broadcast to all rows
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.Recent_CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.Recent_CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as Recent_CAC_Broadcasted,
    
    -- Get Cohort_CAC from BC0 (non-NT) or BC1 (NT) and broadcast to all rows
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as Cohort_CAC_Broadcasted,
    
    -- Get T30D_New_Users from BC0 (non-NT) or BC1 (NT) and broadcast to all rows
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.T30D_New_Users
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) as T30D_New_Users_Broadcasted
    
  FROM cumulative_metrics cm
),

-- =====================================================
-- STEP 4: CALCULATE BC4_CAC_CEILING (PRODUCT-LEVEL)
-- Uses Gross_ARPU cumulative (product-level, unchanged)
-- NOTE: This still uses product-level Gross_ARPU, not group-level
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    rcb.*,
    
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Gross_ARPU_Discounted ELSE NULL END) 
      OVER (PARTITION BY rcb.Product_Name_Final, rcb.Report_date, rcb.Country_Code, rcb.Cohort, rcb.Table_Type) - 1.2 
      as BC4_CAC_Ceiling
    
  FROM recent_cac_broadcast rcb
),

-- =====================================================
-- STEP 5: IDENTIFY FIRST NULL BC (PRODUCT-LEVEL CASCADE)
-- Used for: Churn, Refund, Retention, Gross_ARPU only
-- NOT used for: Net_ARPU, Net_LTV, Recent_CAC (group-level, no cascade)
-- =====================================================
first_null_detection AS (
  SELECT 
    bcc.*,
    
    MIN(CASE 
      WHEN bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 0 THEN NULL
      
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle = 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 1)
      THEN 
        CASE 
          WHEN (bcc.Subscription_users IS NULL OR bcc.Subscription_users = 0) 
            OR (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle > 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle > 1)
      THEN 
        CASE 
          WHEN bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.Product_Name_Final, bcc.Report_date, bcc.Country_Code, bcc.Cohort, bcc.Table_Type
    ) as First_Null_BC
    
  FROM bc4_ceiling_calc bcc
),

-- =====================================================
-- STEP 6: ADD ACTIVE/INACTIVE STATUS
-- =====================================================
with_active_status AS (
  SELECT 
    fnd.*,
    
    CASE 
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
    
  FROM first_null_detection fnd
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON fnd.App_Name = ap.App_Name 
    AND fnd.Product_Name_Final = ap.Product_Name_Final
),

-- =====================================================
-- STEP 7: GROUP-LEVEL WEIGHTED AVG Net_ARPU PER BC
-- Grain: (Report_date, Billing_Cycle, Cohort, Table_Type)
-- Formula: SUM(Net_ARPU_Discounted × Value) / SUM(Value)
-- =====================================================
group_net_arpu_per_bc AS (
  SELECT
    Report_date,
    Billing_Cycle,
    Cohort,
    Table_Type,
    
    SAFE_DIVIDE(
      SUM(Net_ARPU_Discounted * Value),
      NULLIF(SUM(Value), 0)
    ) AS Group_Net_ARPU_Per_BC
    
  FROM unioned_data
  GROUP BY Report_date, Billing_Cycle, Cohort, Table_Type
),

-- =====================================================
-- STEP 8: CUMULATE GROUP-LEVEL Net_ARPU OVER BC
-- Running sum partitioned by (Report_date, Cohort, Table_Type)
-- =====================================================
group_net_arpu_cumulative AS (
  SELECT
    gna.*,
    
    SUM(gna.Group_Net_ARPU_Per_BC) OVER (
      PARTITION BY gna.Report_date, gna.Cohort, gna.Table_Type
      ORDER BY gna.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Group_Net_ARPU_Cumulative
    
  FROM group_net_arpu_per_bc gna
),

-- =====================================================
-- STEP 9: DISTINCT REPORT DATES (for source-table joins)
-- =====================================================
report_dates AS (
  SELECT DISTINCT Report_date
  FROM unioned_data
),

-- =====================================================
-- STEP 10: GLOBAL LAST SPEND DATE
-- One global last_spend_date per Report_date (no product/country filter)
-- Exact same logic as group-level script
-- =====================================================
global_last_spend AS (
  SELECT
    rd.Report_date,
    MAX(ads.Date) AS last_spend_date
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date <= rd.Report_date
    AND ads.allocated_spend > 0
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 11: RECENT SPEND (7-day window from global last_spend_date)
-- =====================================================
recent_spend_calc AS (
  SELECT
    gls.Report_date,
    COALESCE(SUM(ads.allocated_spend), 0) AS Recent_Spend
  FROM global_last_spend gls
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date BETWEEN DATE_SUB(gls.last_spend_date, INTERVAL 6 DAY) AND gls.last_spend_date
  GROUP BY gls.Report_date
),

-- =====================================================
-- STEP 12: RECENT USERS (7-day window, same window as Recent Spend)
-- COUNT DISTINCT, NT→BC1 / non-NT→BC0, no product/country filter
-- =====================================================
recent_users_calc AS (
  SELECT
    gls.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Recent_Users
  FROM global_last_spend gls
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale BETWEEN DATE_SUB(gls.last_spend_date, INTERVAL 6 DAY) AND gls.last_spend_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  GROUP BY gls.Report_date
),

-- =====================================================
-- STEP 13: COMPUTE RECENT_CAC FROM SOURCE
-- Recent_CAC = Recent_Spend / Recent_Users
-- One value per Report_date, broadcast to all rows
-- =====================================================
recent_cac_from_source AS (
  SELECT
    rsc.Report_date,
    CASE
      WHEN COALESCE(ruc.Recent_Users, 0) = 0 THEN NULL
      ELSE SAFE_DIVIDE(rsc.Recent_Spend, ruc.Recent_Users)
    END AS Recent_CAC_Source
  FROM recent_spend_calc rsc
  LEFT JOIN recent_users_calc ruc ON rsc.Report_date = ruc.Report_date
)

-- =====================================================
-- FINAL OUTPUT: 24 COLUMNS
-- 
-- CHANGED COLUMNS:
--   Net_ARPU_Discounted  → group-level weighted avg cumulative (no cascade)
--   Net_LTV_Discounted   → group Net_ARPU cumulative − source Recent_CAC (no cascade)
--   Recent_CAC           → recomputed from source tables (no cascade)
-- 
-- UNCHANGED COLUMNS:
--   All other 21 columns retain original logic
-- =====================================================
SELECT 
  -- Primary Dimensions (8 columns)
  was.Report_date as Reporting_Date,
  
  CASE 
    WHEN was.Country_Code IS NOT NULL AND was.Country_Code != '' AND TRIM(was.Country_Code) != ''
    THEN CONCAT(was.Product_Name_Final, '-', was.Country_Code)
    ELSE was.Product_Name_Final
  END as Plan_Name,
  
  was.active_inactive_status as Active_Inactive,
  
  was.Billing_Cycle as BC,
  was.Entity_Name,
  was.App_Name,
  was.Trial_Type,
  was.Country_Code as Country,
  
  -- User Metrics (3 columns) - UNCHANGED
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    ELSE was.Subscription_users
  END as Subscriptions,
  
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    ELSE was.Rebills_raw
  END as Rebills,
  
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN (was.Trial_Type = 'NT' AND was.Billing_Cycle = 1) OR (was.Trial_Type != 'NT' AND was.Billing_Cycle = 0)
    THEN was.SS_Users
    ELSE NULL
  END as Single_Sale,
  
  -- Performance Ratios (4 columns) - PRODUCT-LEVEL CASCADE (unchanged)
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN was.First_Null_BC IS NOT NULL AND was.Billing_Cycle >= was.First_Null_BC THEN NULL
    ELSE was.Churn_rate
  END as Churn_Rate,
  
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN was.First_Null_BC IS NOT NULL AND was.Billing_Cycle >= was.First_Null_BC THEN NULL
    ELSE was.Refund_ratio
  END as Refund_Rate,
  
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN was.First_Null_BC IS NOT NULL AND was.Billing_Cycle >= was.First_Null_BC THEN NULL
    ELSE was.Retention_rate
  END as Gross_ARPU_Retention_Rate,
  
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN was.First_Null_BC IS NOT NULL AND was.Billing_Cycle >= was.First_Null_BC THEN NULL
    ELSE was.NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  
  -- CAC Metrics (2 columns) - Cohort_CAC unchanged, Recent_CAC from source
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    ELSE was.Cohort_CAC_Broadcasted
  END as Cohort_CAC,
  
  -- CHANGED: Recent_CAC now from source (global, no cascade, no NT/BC0 null)
  rcas.Recent_CAC_Source as Recent_CAC,
  
  -- New Users (1 column) - UNCHANGED
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    ELSE was.T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  
  -- Gross ARPU (1 column) - PRODUCT-LEVEL CASCADE (unchanged)
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN was.First_Null_BC IS NOT NULL AND was.Billing_Cycle >= was.First_Null_BC THEN NULL
    ELSE was.Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  
  -- CHANGED: Net_ARPU_Discounted → group-level cumulative weighted avg (no cascade)
  gnac.Group_Net_ARPU_Cumulative as Net_ARPU_Discounted,
  
  -- CHANGED: Net_LTV_Discounted → group Net_ARPU cumulative − source Recent_CAC (no cascade)
  CASE
    WHEN gnac.Group_Net_ARPU_Cumulative IS NOT NULL AND rcas.Recent_CAC_Source IS NOT NULL
    THEN gnac.Group_Net_ARPU_Cumulative - rcas.Recent_CAC_Source
    WHEN gnac.Group_Net_ARPU_Cumulative IS NOT NULL AND rcas.Recent_CAC_Source IS NULL
    THEN gnac.Group_Net_ARPU_Cumulative
    ELSE NULL
  END as Net_LTV_Discounted,
  
  -- BC4_CAC_Ceiling (1 column) - EXCLUDED FROM CASCADE (unchanged)
  CASE 
    WHEN was.Trial_Type = 'NT' AND was.Billing_Cycle = 0 THEN NULL
    WHEN (was.Subscription_users IS NULL OR was.Subscription_users = 0) 
     AND (was.Rebills_raw IS NULL OR was.Rebills_raw = 0)
    THEN NULL
    ELSE was.BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  
  was.Cohort,
  was.Table_Type as `Table`

FROM with_active_status was

-- JOIN: Group-level cumulative Net_ARPU
LEFT JOIN group_net_arpu_cumulative gnac
  ON was.Report_date   = gnac.Report_date
  AND was.Billing_Cycle = gnac.Billing_Cycle
  AND was.Cohort        = gnac.Cohort
  AND was.Table_Type    = gnac.Table_Type

-- JOIN: Source-based Recent_CAC
LEFT JOIN recent_cac_from_source rcas
  ON was.Report_date = rcas.Report_date

ORDER BY 
  Reporting_Date DESC, 
  Plan_Name, 
  Country, 
  Cohort,
  `Table`,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - UPDATED FINAL TABLE
-- Table: variant-finance-data-project.ICARUS_Multi.Final_Table
-- 
-- CHANGES MADE IN THIS VERSION:
--
-- ✅ NEW: Value column added to UNION
--    - CB_Value from Crystal Ball tables
--    - Rebill_Value from Main tables
--
-- ✅ CHANGED: Net_ARPU_Discounted
--    - Was: Product-level cumulative, with null cascade
--    - Now: Group-level weighted avg per BC, then cumulated
--    - Grain: (Report_date, BC, Cohort, Table_Type)
--    - Formula per BC: SUM(Net_ARPU_Discounted × Value) / SUM(Value)
--    - Then: running SUM over BC
--    - No null cascade — same value on every product row
--
-- ✅ CHANGED: Recent_CAC
--    - Was: Broadcasted from BC0/BC1 of product-level tables
--    - Now: Recomputed from source tables (same logic as group-level script)
--    - Global last_spend_date = MAX(Date) from spend table
--    - 7-day window: Recent_Spend / Recent_Users
--    - One value per Report_date, broadcast to all rows
--    - No null cascade
--
-- ✅ CHANGED: Net_LTV_Discounted
--    - Was: Product-level cumulative, with null cascade
--    - Now: Group_Net_ARPU_Cumulative − Recent_CAC_Source
--    - No null cascade
--
-- ✅ UNCHANGED: All other 21 columns
--    - Gross_ARPU_Discounted: still product-level with cascade
--    - Churn, Refund, Retention rates: still product-level with cascade
--    - Cohort_CAC, T30D_New_Users: still broadcasted from product BC0/BC1
--    - Subscriptions, Rebills, Single_Sale: same logic
--    - BC4_CAC_Ceiling: still excluded from cascade
--    - Active_Inactive: still from Active_Plans_6M
--
-- OUTPUT: 24 columns
-- =====================================================

END;
