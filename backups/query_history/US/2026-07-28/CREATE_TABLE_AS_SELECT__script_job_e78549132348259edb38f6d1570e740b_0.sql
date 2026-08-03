-- job_id: script_job_e78549132348259edb38f6d1570e740b_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T14:51:46.523000+00:00
-- started: 2026-07-28T14:51:47.146000+00:00
-- ended: 2026-07-28T14:51:54.865000+00:00

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
-- STEP 5: IDENTIFY FIRST NULL BC (FIXED APPROACH)
-- Find the FIRST BC where metrics should become NULL
-- This is the "point of no return" for cascade
-- Partitioned by: Product_AFID, Reporting_Date, Cohort, Table_Type
-- =====================================================
first_null_detection AS (
  SELECT 
    bcc.*,
    
    -- Find the FIRST BC where the condition for NULL is met (Rebills < 25 OR Subscriptions = 0)
    -- For Non-NT: Start checking from BC0
    -- For NT: Start checking from BC1
    MIN(CASE 
      -- NT at BC0: Skip (always NULL anyway)
      WHEN bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 0 THEN NULL
      
      -- For Non-NT at BC0 OR NT at BC1 (trigger BCs): Check if Rebills < 25 OR Subscriptions = 0
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle = 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 1)
      THEN 
        CASE 
          WHEN (bcc.Subscription_users IS NULL OR bcc.Subscription_users = 0) 
            OR (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      
      -- For all other BCs: Check if Rebills < 25
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
      PARTITION BY bcc.Product_AFID, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as First_Null_BC
    
  FROM bc4_ceiling_calc bcc
),

-- =====================================================
-- STEP 6: ADD ACTIVE/INACTIVE STATUS
-- Join with Active_Plans_6M table (uses ICARUS_Multi table)
-- =====================================================
with_active_status AS (
  SELECT 
    fnd.*,
    
    -- Active/Inactive Status
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
)

-- =====================================================
-- FINAL OUTPUT: 25 COLUMNS
-- FIXED: Proper cascade using "first NULL BC" detection
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
  
  -- User Metrics (3 columns) - UNCHANGED
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
  
  -- Performance Ratios (4 columns) - WITH FIXED CASCADE LOGIC
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Churn_rate
  END as Churn_Rate,
  
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Refund_ratio
  END as Refund_Rate,
  
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Retention_rate
  END as Gross_ARPU_Retention_Rate,
  
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  
  -- CAC Metrics (1 column) - Only Recent_CAC (No Cohort_CAC in Icarus_Cohort)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Recent_CAC_Broadcasted
  END as Recent_CAC,
  
  -- New Users (1 column) - UNCHANGED
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  
  -- Cumulative ARPU/LTV Metrics (3 columns) - WITH FIXED CASCADE LOGIC
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Net_ARPU_Discounted_Cumulative
  END as Net_ARPU_Discounted,
  
  CASE 
    -- NT at BC0: NULL
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    
    -- If current BC >= First_Null_BC, then NULL (cascade)
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    
    -- Otherwise calculate normally
    ELSE Net_LTV_Discounted_Cumulative
  END as Net_LTV_Discounted,
  
  -- Special Calculated Columns (BC4_CAC_Ceiling) - EXCLUDED FROM CASCADE
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
  BC
