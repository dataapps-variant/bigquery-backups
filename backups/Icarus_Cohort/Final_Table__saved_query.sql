-- =====================================================
-- FINAL TABLE CREATION SCRIPT - ICARUS_COHORT (AFID LEVEL)
-- Merge of 7K Crystal Ball and Main Tables
-- 
-- OUTPUT: 25 columns (includes AFID and Product_AFID)
-- UPDATED: All calculations now use Product_AFID as the key
-- UPDATED: New cascade logic for 7 metrics based on Rebills threshold (25)
-- UPDATED: BC4_CAC_Ceiling excluded from cascade logic
-- UPDATED: T30D_New_Users now broadcasted
-- UPDATED: Added Active/Inactive column based on Active_Plans_6M table
-- UPDATED: Removed Cohort_CAC (not available in Icarus_Cohort source tables)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.Final_Table` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- Standardize column names and add identifiers
-- Pull Product_AFID directly from source tables
-- =====================================================
unioned_data AS (
  -- Table 1: IC_7K_30D_Crystal_Ball
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID,
    Product_AFID,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K_30D' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
  
  UNION ALL
  
  -- Table 2: IC_7K_Crystal_Ball
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID,
    Product_AFID,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
  
  UNION ALL
  
  -- Table 3: IC_7K_30D_Main_Table
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID,
    Product_AFID,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    NULL as T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K_30D' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
  
  UNION ALL
  
  -- Table 4: IC_7K_Main_Table
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID,
    Product_AFID,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    NULL as T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
),

-- =====================================================
-- STEP 2: CALCULATE CUMULATIVE METRICS
-- Running sum of ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted
-- Partitioned by: Product_AFID, Reporting_Date, Cohort, Table_Type
-- Ordered by: BC
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    
    -- Cumulative Gross_ARPU_Discounted
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted,
    
    -- Cumulative Net_ARPU_Discounted
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.Product_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_ARPU_Discounted_Cumulative,
    
    -- Cumulative Net_LTV_Discounted
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.Product_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_LTV_Discounted_Cumulative
    
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST RECENT_CAC AND T30D_NEW_USERS
-- Take values from BC0 (non-NT) or BC1 (NT)
-- Broadcast these values to ALL billing cycles
-- Partitioned by: Product_AFID, Reporting_Date, Cohort, Table_Type
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
      PARTITION BY cm.Product_AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as Recent_CAC_Broadcasted,
    
    -- Get T30D_New_Users from BC0 (non-NT) or BC1 (NT) and broadcast to all rows
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.T30D_New_Users
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as T30D_New_Users_Broadcasted
    
  FROM cumulative_metrics cm
),

-- =====================================================
-- STEP 4: CALCULATE BC4_CAC_CEILING
-- Find Net_ARPU_Discounted_Cumulative at BC=4, subtract $1.2
-- Broadcast this value to ALL billing cycles
-- Partitioned by: Product_AFID, Reporting_Date, Cohort, Table_Type
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    rcb.*,
    
    -- Get the cumulative Net_ARPU_Discounted value at BC=4 for each group
    -- Then subtract 1.2 and broadcast to all rows in the group
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY rcb.Product_AFID, rcb.Report_date, rcb.Cohort, rcb.Table_Type) - 1.2 
      as BC4_CAC_Ceiling
    
  FROM recent_cac_broadcast rcb
),

-- =====================================================
-- STEP 5: ADD LAG FUNCTIONS FOR CASCADE LOGIC
-- Look at previous BC values for the 7 metrics to implement cascade
-- Partitioned by: Product_AFID, Reporting_Date, Cohort, Table_Type
-- =====================================================
with_lag_values AS (
  SELECT 
    bcc.*,
    
    -- LAG values to check if previous BC was NULL
    LAG(bcc.Churn_rate) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Churn_rate,
    
    LAG(bcc.Refund_ratio) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Refund_ratio,
    
    LAG(bcc.Retention_rate) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Retention_rate,
    
    LAG(bcc.NET_Retention_rate) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_NET_Retention_rate,
    
    LAG(bcc.Gross_ARPU_Discounted) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Gross_ARPU_Discounted,
    
    LAG(bcc.Net_ARPU_Discounted_Cumulative) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Net_ARPU_Discounted,
    
    LAG(bcc.Net_LTV_Discounted_Cumulative) OVER (
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
    ) as Prev_Net_LTV_Discounted
    
  FROM bc4_ceiling_calc bcc
),

-- =====================================================
-- STEP 6: ADD ACTIVE/INACTIVE STATUS
-- Join with Active_Plans_6M table (uses ICARUS_Multi table)
-- =====================================================
with_active_status AS (
  SELECT 
    wlv.*,
    
    -- Active/Inactive Status
    CASE 
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
    
  FROM with_lag_values wlv
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON wlv.App_Name = ap.App_Name 
    AND wlv.Product_Name_Final = ap.Product_Name_Final
)

-- =====================================================
-- FINAL OUTPUT: 25 COLUMNS
-- All calculations based on Product_AFID
-- =====================================================
SELECT 
  -- Primary Dimensions (9 columns - includes AFID)
  Report_date as Reporting_Date,
  
  CASE 
    WHEN Country_Code IS NOT NULL AND Country_Code != '' AND TRIM(Country_Code) != ''
    THEN CONCAT(Product_Name_Final, '-', Country_Code)
    ELSE Product_Name_Final
  END as Plan_Name,
  
  active_inactive_status as Active_Inactive,
  
  Billing_Cycle as BC,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country_Code as Country,
  AFID,
  
  -- User Metrics (3 columns)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Subscription_users
  END as Subscriptions,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Rebills_raw
  END as Rebills,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1) OR (Trial_Type != 'NT' AND Billing_Cycle = 0)
    THEN SS_Users
    ELSE NULL
  END as Single_Sale,
  
  -- Performance Ratios (4 columns) - WITH CASCADE LOGIC
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Churn_rate IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Churn_rate IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Churn_rate
  END as Churn_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Refund_ratio IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Refund_ratio IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Refund_ratio
  END as Refund_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Retention_rate IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Retention_rate IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Retention_rate
  END as Gross_ARPU_Retention_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_NET_Retention_rate IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_NET_Retention_rate IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  
  -- CAC Metrics (1 column) - Only Recent_CAC
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Recent_CAC_Broadcasted
  END as Recent_CAC,
  
  -- New Users (1 column)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  
  -- Cumulative ARPU/LTV Metrics (3 columns) - WITH CASCADE LOGIC
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Gross_ARPU_Discounted IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Gross_ARPU_Discounted IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Net_ARPU_Discounted IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Net_ARPU_Discounted IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Net_ARPU_Discounted_Cumulative
  END as Net_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN Trial_Type != 'NT' AND Billing_Cycle = 0 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 1 
      AND ((Subscription_users IS NULL OR Subscription_users = 0) OR (Rebills_raw IS NULL OR Rebills_raw < 25))
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Net_LTV_Discounted IS NULL
    THEN NULL
    WHEN ((Trial_Type != 'NT' AND Billing_Cycle > 0) OR (Trial_Type = 'NT' AND Billing_Cycle > 1))
      AND Prev_Net_LTV_Discounted IS NOT NULL
      AND (Rebills_raw IS NULL OR Rebills_raw < 25)
    THEN NULL
    ELSE Net_LTV_Discounted_Cumulative
  END as Net_LTV_Discounted,
  
  -- Special Calculated Columns
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Subscription_users IS NULL OR Subscription_users = 0) 
     AND (Rebills_raw IS NULL OR Rebills_raw = 0)
    THEN NULL
    ELSE BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  
  Cohort,
  Table_Type as Table,
  
  -- Product_AFID: Pulled directly from source tables
  Product_AFID

FROM with_active_status

ORDER BY 
  Reporting_Date DESC, 
  Product_AFID,
  Cohort,
  Table,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - ICARUS_COHORT FINAL TABLE
-- Table: variant-finance-data-project.Icarus_Cohort.Final_Table
-- 
-- KEY CHANGES FROM PREVIOUS VERSION:
-- ✅ All PARTITION BY clauses now use Product_AFID instead of 
--    (Product_Name_Final, Country_Code, AFID) separately
-- ✅ Product_AFID pulled directly from source tables
-- ✅ Simplified and consistent grouping logic
-- ✅ ORDER BY uses Product_AFID
--
-- PARTITION BY STRUCTURE (all CTEs):
--    Product_AFID, Report_date, Cohort, Table_Type
--
-- SOURCE TABLES:
-- 1. Icarus_Cohort.IC_7K_30D_Crystal_Ball (CB_User → Rebills_raw)
-- 2. Icarus_Cohort.IC_7K_Crystal_Ball (CB_User → Rebills_raw)
-- 3. Icarus_Cohort.IC_7K_30D_Main_Table (Rebill_users → Rebills_raw)
-- 4. Icarus_Cohort.IC_7K_Main_Table (Rebill_users → Rebills_raw)
--
-- OUTPUT: 25 columns
-- 1.  Reporting_Date
-- 2.  Plan_Name
-- 3.  Active_Inactive
-- 4.  BC
-- 5.  Entity_Name
-- 6.  App_Name
-- 7.  Trial_Type
-- 8.  Country
-- 9.  AFID
-- 10. Subscriptions
-- 11. Rebills
-- 12. Single_Sale
-- 13. Churn_Rate
-- 14. Refund_Rate
-- 15. Gross_ARPU_Retention_Rate
-- 16. Net_ARPU_Retention_Rate
-- 17. Recent_CAC
-- 18. T30D_New_Users
-- 19. Gross_ARPU_Discounted
-- 20. Net_ARPU_Discounted
-- 21. Net_LTV_Discounted
-- 22. BC4_CAC_Ceiling
-- 23. Cohort
-- 24. Table
-- 25. Product_AFID
-- =====================================================
