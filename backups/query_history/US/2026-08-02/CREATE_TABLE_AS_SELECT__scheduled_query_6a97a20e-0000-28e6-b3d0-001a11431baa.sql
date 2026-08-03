-- job_id: scheduled_query_6a97a20e-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:00:12.725000+00:00
-- started: 2026-08-02T09:00:13.099000+00:00
-- ended: 2026-08-02T09:00:23.136000+00:00


-- =====================================================
-- FINAL TABLE CREATION SCRIPT - WITH PROPERLY FIXED NULL CASCADE LOGIC
-- Merge of 7K Crystal Ball and Main Tables
-- 
-- OUTPUT: 28 columns (was 24, added Daily_New_Users, Daily_Spend, Daily_CAC, Cumulative_Refund)
-- FIXED: Proper cascade using "first NULL BC" detection approach
-- UPDATED: Cohort_CAC and T30D_New_Users broadcasted
-- UPDATED: Added Active/Inactive column based on Active_Plans_6M table
-- UPDATED: Added Daily_New_Users, Daily_Spend, Daily_CAC (broadcasted), Cumulative_Refund
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- Standardize column names and add identifiers
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
    '7K' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
),

-- =====================================================
-- STEP 1B: DAILY NEW USERS
-- Count distinct Updated_Cust_ID from Sticky table
-- For NT: Billing_Cycle_Updated = 1, else Billing_Cycle_Updated = 0
-- CT-JP/CT-Non-JP: first 8 chars match + Spend_Country_Code_AFID split
-- Others: full Product_Name_Final_Merged match
-- =====================================================
daily_new_users AS (
  -- Non-CT apps: group by full Product_Name_Final_Merged, no country
  SELECT 
    Date_of_Sale as Report_date,
    Product_Name_Final_Merged as Join_Key,
    'ALL' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name != 'CT'
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-JP: first 8 chars + Spend_Country_Code_AFID = 'JP'
  SELECT 
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-Non-JP: first 8 chars + Spend_Country_Code_AFID != 'JP'
  SELECT 
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as Daily_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0)
    )
  GROUP BY 1, 2, 3
),

-- =====================================================
-- STEP 1C: DAILY SPEND
-- Sum allocated_spend from Spend table
-- CT-JP/CT-Non-JP: first 8 chars match + App_Name filter
-- Others: full Product_Name_Final_Merged match
-- =====================================================
daily_spend AS (
  -- Non-CT apps: group by full Product_Name_Final_Merged, no country
  SELECT 
    Date as Report_date,
    Product_Name_Final_Merged as Join_Key,
    'ALL' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name NOT IN ('CT-JP', 'CT-Non-JP')
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-JP: first 8 chars + App_Name = 'CT-JP' in spend table
  SELECT 
    Date as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name = 'CT-JP'
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-Non-JP: first 8 chars + App_Name = 'CT-Non-JP' in spend table
  SELECT 
    Date as Report_date,
    LEFT(Product_Name_Final_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    SUM(allocated_spend) as Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE App_Name = 'CT-Non-JP'
  GROUP BY 1, 2, 3
),

-- =====================================================
-- STEP 1D: DAILY SS USERS
-- Count distinct Updated_Cust_ID from Single Sales table
-- Billing_Cycle_Updated = 0, Date_of_Sale = Report_date
-- CT-JP/CT-Non-JP: first 8 chars + Spend_Country_Code_AFID split
-- Others: full Product_Name_Final_Main_Merged match
-- =====================================================
daily_ss_users AS (
  -- Non-CT apps
  SELECT 
    Date_of_Sale as Report_date,
    Product_Name_Final_Main_Merged as Join_Key,
    'ALL' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name != 'CT'
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-JP
  SELECT 
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Main_Merged, 8) as Join_Key,
    'CT-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name = 'CT'
    AND Spend_Country_Code_AFID = 'JP'
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3

  UNION ALL

  -- CT-Non-JP
  SELECT 
    Date_of_Sale as Report_date,
    LEFT(Product_Name_Final_Main_Merged, 8) as Join_Key,
    'CT-Non-JP' as App_Country_Key,
    COUNT(DISTINCT Updated_Cust_ID) as SS_Users_Daily
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE App_Name = 'CT'
    AND (Spend_Country_Code_AFID != 'JP' OR Spend_Country_Code_AFID IS NULL)
    AND Billing_Cycle_Updated = 0
  GROUP BY 1, 2, 3
),

-- =====================================================
-- STEP 1E: T7D SS USERS (7-day average inclusive of report date)
-- Average of daily_ss_users over past 7 calendar days
-- =====================================================
t7d_ss_users AS (
  SELECT 
    d.Report_date,
    d.Join_Key,
    d.App_Country_Key,
    d.SS_Users_Daily,
    AVG(d2.SS_Users_Daily) as T7D_SS_Users
  FROM daily_ss_users d
  LEFT JOIN daily_ss_users d2
    ON d.Join_Key = d2.Join_Key
    AND d.App_Country_Key = d2.App_Country_Key
    AND d2.Report_date BETWEEN DATE_SUB(d.Report_date, INTERVAL 6 DAY) AND d.Report_date
  GROUP BY 1, 2, 3, 4
),

-- =====================================================
-- STEP 1F: T7D NEW USERS (7-day average inclusive of report date)
-- Average of daily_new_users over past 7 calendar days
-- =====================================================
t7d_new_users AS (
  SELECT 
    d.Report_date,
    d.Join_Key,
    d.App_Country_Key,
    d.Daily_New_Users,
    AVG(d2.Daily_New_Users) as T7D_New_Users
  FROM daily_new_users d
  LEFT JOIN daily_new_users d2
    ON d.Join_Key = d2.Join_Key
    AND d.App_Country_Key = d2.App_Country_Key
    AND d2.Report_date BETWEEN DATE_SUB(d.Report_date, INTERVAL 6 DAY) AND d.Report_date
  GROUP BY 1, 2, 3, 4
),

-- =====================================================
-- STEP 2: CALCULATE CUMULATIVE METRICS
-- Running sum of ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted
-- Partitioned by: Plan_Name, Reporting_Date, Country, Cohort, Table_Type
-- Ordered by: BC
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    
    -- Derive join keys for daily tables
    CASE 
      WHEN ud.App_Name IN ('CT-JP', 'CT-Non-JP') THEN LEFT(ud.Product_Name_Final, 8)
      ELSE ud.Product_Name_Final
    END as Join_Key,
    CASE 
      WHEN ud.App_Name IN ('CT-JP', 'CT-Non-JP') THEN ud.App_Name
      ELSE 'ALL'
    END as App_Country_Key,
    
    -- Cumulative Gross_ARPU_Discounted
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted,
    
    -- Cumulative Net_ARPU_Discounted
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_ARPU_Discounted_Cumulative,
    
    -- Cumulative Net_LTV_Discounted
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_LTV_Discounted_Cumulative,
    
    -- Cumulative Refund (running sum of Refund_ratio)
    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Cumulative_Refund_raw
    
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST RECENT_CAC, COHORT_CAC, T30D_NEW_USERS,
--         AND JOIN DAILY_NEW_USERS + DAILY_SPEND
-- =====================================================
recent_cac_broadcast AS (
  SELECT 
    cm.*,
    
    -- Daily New Users (joined and broadcasted to all BCs)
    dnu.Daily_New_Users as Daily_New_Users_val,
    
    -- T7D New Users (7-day avg, broadcasted to all BCs)
    dnu.T7D_New_Users as T7D_New_Users_val,
    
    -- Daily Spend (joined and broadcasted to all BCs)
    ds.Daily_Spend as Daily_Spend_val,
    
    -- Daily CAC = Spend / Users
    CASE 
      WHEN dnu.Daily_New_Users IS NOT NULL AND dnu.Daily_New_Users > 0
      THEN ds.Daily_Spend / dnu.Daily_New_Users
      ELSE NULL
    END as Daily_CAC_val,
    
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
    ) as T30D_New_Users_Broadcasted,
    
    -- SS Users Daily (joined and broadcasted to all BCs)
    t7d.SS_Users_Daily as SS_Users_Daily_val,
    
    -- T7D SS Users (7-day avg, broadcasted to all BCs)
    t7d.T7D_SS_Users as T7D_SS_Users_val
    
  FROM cumulative_metrics cm
  LEFT JOIN t7d_new_users dnu
    ON cm.Report_date = dnu.Report_date
    AND cm.Join_Key = dnu.Join_Key
    AND cm.App_Country_Key = dnu.App_Country_Key
  LEFT JOIN daily_spend ds
    ON cm.Report_date = ds.Report_date
    AND cm.Join_Key = ds.Join_Key
    AND cm.App_Country_Key = ds.App_Country_Key
  LEFT JOIN t7d_ss_users t7d
    ON cm.Report_date = t7d.Report_date
    AND cm.Join_Key = t7d.Join_Key
    AND cm.App_Country_Key = t7d.App_Country_Key
),

-- =====================================================
-- STEP 4: CALCULATE BC4_CAC_CEILING
-- Find Net_ARPU_Discounted_Cumulative at BC=4, subtract $1.2
-- Broadcast this value to ALL billing cycles
-- Partitioned by: Plan_Name, Reporting_Date, Country, Cohort, Table_Type
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    rcb.*,
    
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY rcb.Product_Name_Final, rcb.Report_date, rcb.Country_Code, rcb.Cohort, rcb.Table_Type) - 1.2 
      as BC4_CAC_Ceiling
    
  FROM recent_cac_broadcast rcb
),

-- =====================================================
-- STEP 5: IDENTIFY FIRST NULL BC (FIXED APPROACH)
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
)

-- =====================================================
-- FINAL OUTPUT: 28 COLUMNS
-- =====================================================
SELECT 
  -- Primary Dimensions (8 columns)
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
  
  -- Performance Ratios (4 columns) - WITH CASCADE
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate
  END as Churn_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio
  END as Refund_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Retention_rate
  END as Gross_ARPU_Retention_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  
  -- CAC Metrics (2 columns)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Cohort_CAC_Broadcasted
  END as Cohort_CAC,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Recent_CAC_Broadcasted
  END as Recent_CAC,
  
  -- New Users (1 column)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  
  -- Cumulative ARPU/LTV Metrics (3 columns) - WITH CASCADE
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_ARPU_Discounted_Cumulative
  END as Net_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_LTV_Discounted_Cumulative
  END as Net_LTV_Discounted,
  
  -- BC4_CAC_Ceiling (1 column) - EXCLUDED FROM CASCADE
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Subscription_users IS NULL OR Subscription_users = 0) 
     AND (Rebills_raw IS NULL OR Rebills_raw = 0)
    THEN NULL
    ELSE BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  
  -- =====================================================
  -- NEW COLUMNS: Daily_New_Users, Daily_Spend, Daily_CAC (broadcasted)
  -- Same value for all BCs within a group
  -- =====================================================
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_New_Users_val
  END as Daily_New_Users,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T7D_New_Users_val
  END as T7D_New_Users_Daily,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_Spend_val
  END as Daily_Spend,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Daily_CAC_val
  END as Daily_CAC,
  
  -- =====================================================
  -- NEW COLUMN: Cumulative_Refund (with cascade logic)
  -- Running sum of Refund_ratio ordered by BC
  -- =====================================================
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Cumulative_Refund_raw
  END as Cumulative_Refund,
  
  -- =====================================================
  -- NEW COLUMNS: SS_Users_Daily, T7D_SS_Users (broadcasted across all BCs)
  -- =====================================================
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE SS_Users_Daily_val
  END as SS_Users_Daily,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T7D_SS_Users_val
  END as T7D_SS_Users,
  
  Cohort,
  Table_Type as Table

FROM with_active_status

ORDER BY 
  Reporting_Date DESC, 
  Plan_Name, 
  Country, 
  Cohort,
  Table,
  BC;

-- =====================================================
-- SCRIPT COMPLETE
-- 28 columns total (24 original + 4 new)
--
-- NEW COLUMNS ADDED:
-- 1. Daily_New_Users: COUNT(DISTINCT Updated_Cust_ID) from Sticky table
--    - NT: Billing_Cycle_Updated=1, non-NT: Billing_Cycle_Updated=0
--    - Joined on Date + Product_Name_Final_Merged
--    - Country matched only for App_Name='CT' (JP vs Non-JP)
--    - Broadcasted across all BCs
--
-- 2. Daily_Spend: SUM(allocated_spend) from Spend table
--    - Joined on Date + Product_Name_Final_Merged
--    - Country matched only for App_Name='CT' (JP vs Non-JP)
--    - Broadcasted across all BCs
--
-- 3. Daily_CAC: Daily_Spend / Daily_New_Users
--    - NULL when Daily_New_Users = 0 or NULL
--    - Broadcasted across all BCs
--
-- 4. Cumulative_Refund: Running SUM of Refund_ratio
--    - Partitioned by Plan, Date, Country, Cohort, Table_Type
--    - Ordered by Billing_Cycle
--    - Follows NULL cascade logic (NULL when BC >= First_Null_BC)
-- =====================================================
