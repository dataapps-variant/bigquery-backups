-- job_id: scheduled_query_6abfc6b9-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T09:30:03.979000+00:00
-- started: 2026-07-31T09:30:04.366000+00:00
-- ended: 2026-07-31T09:31:03.424000+00:00



-- =====================================================
-- FINAL TABLE CREATION SCRIPT - APP × AFID LEVEL
-- Merge of 4 App×AFID tables (CB + Main, 30D + 300D)
-- 
-- OUTPUT: 30 columns
-- GRAIN: Report_date × App_Name × Country_Code × AFID × Billing_Cycle × Cohort × Table
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- Standardize column names and add identifiers
-- CB tables: CB_User → Rebills_raw
-- Main tables: Rebill_users → Rebills_raw
-- =====================================================
unioned_data AS (
  -- Table 1: 7K_30D_Crystal_Ball_App_AFID_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    Billing_Cycle,
    Subscription_users,
    CB_User AS Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    Recent_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Active_Inactive,
    '7K_30D' AS Cohort,
    'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball_App_AFID_level`
  
  UNION ALL
  
  -- Table 2: 7K_Crystal_Ball_App_AFID_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    Billing_Cycle,
    Subscription_users,
    CB_User AS Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    Recent_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Active_Inactive,
    '7K' AS Cohort,
    'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball_App_AFID_level`
  
  UNION ALL
  
  -- Table 3: 7K_30D_Main_Table_App_AFID_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    Billing_Cycle,
    Subscription_users,
    Rebill_users AS Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    Recent_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Active_Inactive,
    '7K_30D' AS Cohort,
    'Regular' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table_App_AFID_level`
  
  UNION ALL
  
  -- Table 4: 7K_Main_Table_App_AFID_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    Billing_Cycle,
    Subscription_users,
    Rebill_users AS Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    Recent_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    Active_Inactive,
    '7K' AS Cohort,
    'Regular' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table_App_AFID_level`
),

-- =====================================================
-- STEP 2: CUMULATIVE METRICS
-- Running SUM of ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted
-- Running SUM of Refund_ratio (Cumulative_Refund_Rate)
-- Partitioned by: App_Name, Country_Code, AFID, Report_date, Cohort, Table_Type
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    
    -- Cumulative Refund Rate (running SUM of raw Refund_ratio)
    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Refund_Rate,
    
    -- Cumulative Gross_ARPU_Discounted
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Gross_ARPU_Discounted,
    
    -- Cumulative Net_ARPU_Discounted
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_ARPU_Discounted_Cumulative,
    
    -- Cumulative Net_LTV_Discounted
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_LTV_Discounted_Cumulative
    
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST RECENT_CAC, T30D_NEW_USERS, RECENT_USERS
-- At App level, BC0 is always the trigger BC (no NT/non-NT distinction)
-- Broadcast BC0 values to ALL billing cycles
-- =====================================================
broadcast_metrics AS (
  SELECT 
    cm.*,
    
    -- Get Recent_CAC from BC0 and broadcast to all rows
    MAX(CASE 
      WHEN cm.Billing_Cycle = 0 THEN cm.Recent_CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_CAC_Broadcasted,
    
    -- Get T30D_New_Users from BC0 and broadcast to all rows
    MAX(CASE 
      WHEN cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS T30D_New_Users_Broadcasted,

    -- Broadcast Recent_Users from BC0 to all BCs
    MAX(CASE 
      WHEN cm.Billing_Cycle = 0 THEN cm.Recent_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_Users_Broadcasted,

    -- Single_Sale: BC0 priority, fallback to BC1 if BC0 is 0/NULL, broadcast to all BCs
    COALESCE(
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID, cm.Report_date, cm.Cohort, cm.Table_Type),
        0
      ),
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 1 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID, cm.Report_date, cm.Cohort, cm.Table_Type),
        0
      )
    ) AS Single_Sale_Broadcasted
    
  FROM cumulative_metrics cm
),

-- =====================================================
-- STEP 4: BC4_CAC_CEILING
-- Net_ARPU_Discounted_Cumulative at BC=4, minus $1.2
-- Broadcast to ALL billing cycles
-- Excluded from NULL cascade
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    bm.*,
    
    MAX(CASE WHEN bm.Billing_Cycle = 4 THEN bm.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bm.App_Name, bm.Country_Code, bm.AFID, bm.Report_date, bm.Cohort, bm.Table_Type) - 1.2 
      AS BC4_CAC_Ceiling,

    -- NEW: BC4 Net LTV Discounted (cumulative at BC=4, broadcast to all BCs)
    MAX(CASE WHEN bm.Billing_Cycle = 4 THEN bm.Net_LTV_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bm.App_Name, bm.Country_Code, bm.AFID, bm.Report_date, bm.Cohort, bm.Table_Type)
      AS BC4_Net_LTV_Discounted_Raw
    
  FROM broadcast_metrics bm
),

-- =====================================================
-- STEP 5: DAILY METRICS (from source tables)
-- Daily_Allocated_Spend: exact report_date spend
-- Daily_New_Users: exact report_date COUNT DISTINCT
-- Daily_CAC: Daily_Spend / Daily_Users
-- Computed once per App × Country × AFID × Report_date
-- =====================================================
daily_spend_calc AS (
  SELECT 
    bcc.Report_date,
    bcc.App_Name,
    bcc.Country_Code,
    bcc.AFID,
    SUM(
      CASE 
        WHEN bcc.Country_Code = 'JP' AND ads.Country = 'JP' 
          THEN ads.allocated_spend
        WHEN bcc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) 
          THEN ads.allocated_spend
        WHEN bcc.Country_Code IS NULL OR bcc.Country_Code = '' 
          THEN ads.allocated_spend
        ELSE 0
      END
    ) AS Daily_Allocated_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM bc4_ceiling_calc
  ) bcc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bcc.App_Name = ads.App_Name
    AND COALESCE(ads.Channel_code, 80) = bcc.AFID
    AND ads.Date = bcc.Report_date
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID
),

daily_users_calc AS (
  SELECT 
    bcc.Report_date,
    bcc.App_Name,
    bcc.Country_Code,
    bcc.AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM bc4_ceiling_calc
  ) bcc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
    AND COALESCE(base.AFID_CHANNEL, 80) = bcc.AFID
    AND base.Date_of_Sale = bcc.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    -- Billing Cycle filter based on Trial_Type
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    -- Country logic (VPU CT-pattern)
    AND (
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
    )
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID
),

-- =====================================================
-- RECENT SPEND (7-day sum, not divided)
-- Same Country/AFID logic as daily_spend_calc
-- =====================================================
recent_spend_calc AS (
  SELECT 
    bcc.Report_date,
    bcc.App_Name,
    bcc.Country_Code,
    bcc.AFID,
    COALESCE(SUM(
      CASE 
        WHEN bcc.Country_Code = 'JP' AND ads.Country = 'JP' 
          THEN ads.allocated_spend
        WHEN bcc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) 
          THEN ads.allocated_spend
        WHEN bcc.Country_Code IS NULL OR bcc.Country_Code = '' 
          THEN ads.allocated_spend
        ELSE 0
      END
    ), 0) AS Recent_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM bc4_ceiling_calc
  ) bcc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bcc.App_Name = ads.App_Name
    AND COALESCE(ads.Channel_code, 80) = bcc.AFID
    AND ads.Date BETWEEN DATE_SUB(bcc.Report_date, INTERVAL 6 DAY) AND bcc.Report_date
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID
),

-- =====================================================
-- STEP 5b: DAILY SS USERS
-- COUNT DISTINCT users where Product_name_Final ends with 'SS'
-- BC0 only, same VPU prefix match, AFID match, and country logic
-- =====================================================
daily_ss_users_calc AS (
  SELECT 
    bcc.Report_date,
    bcc.App_Name,
    bcc.Country_Code,
    bcc.AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM bc4_ceiling_calc
  ) bcc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
    AND COALESCE(base.AFID_CHANNEL, 80) = bcc.AFID
    AND base.Date_of_Sale = bcc.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
    -- Country logic (VPU CT-pattern)
    AND (
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
    )
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID
),

-- =====================================================
-- T7D USERS + SS SUM (for T7D_CAC_SS denominator)
-- SUM of Daily_New_Users + SUM of Daily_SS_Users over 7 days
-- =====================================================
t7d_users_ss_sum_calc AS (
  SELECT
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    SUM(daily_new_count) + SUM(daily_ss_count) AS T7D_Users_SS_Sum
  FROM (
    SELECT
      bcc.Report_date,
      bcc.App_Name,
      bcc.Country_Code,
      bcc.AFID,
      day_date,
      COUNT(DISTINCT CASE 
        WHEN base.Trial_Type IS NOT NULL
          AND base.Trial_Type != 'SS'
          AND (
            (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
            OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
          )
        THEN base.Updated_Cust_ID 
      END) AS daily_new_count,
      COUNT(DISTINCT CASE 
        WHEN RIGHT(base.Product_name_Final, 2) = 'SS'
          AND base.Billing_Cycle_Updated = 0
        THEN base.Updated_Cust_ID 
      END) AS daily_ss_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
      FROM bc4_ceiling_calc
    ) bcc
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND COALESCE(base.AFID_CHANNEL, 80) = bcc.AFID
      AND base.Date_of_Sale = day_date
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%'
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%'
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP'
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP'
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, AFID
),

-- =====================================================
-- STEP 5c: T7D DAILY SS USERS
-- Sum of each day's COUNT DISTINCT over trailing 7 days / 7
-- Same SS filters, VPU prefix match, AFID match, and country logic
-- =====================================================
t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      bcc.Report_date,
      bcc.App_Name,
      bcc.Country_Code,
      bcc.AFID,
      day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
      FROM bc4_ceiling_calc
    ) bcc
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND COALESCE(base.AFID_CHANNEL, 80) = bcc.AFID
      AND base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
      -- Country logic (VPU CT-pattern)
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, AFID
),

-- =====================================================
-- STEP 5d: T7D NEW USERS (from Daily_New_Users logic)
-- Sum of each day's COUNT DISTINCT new users over trailing 7 days / 7
-- Same new-user filters as daily_users_calc
-- =====================================================
t7d_new_users_calc AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_New_Users
  FROM (
    SELECT 
      bcc.Report_date,
      bcc.App_Name,
      bcc.Country_Code,
      bcc.AFID,
      day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
      FROM bc4_ceiling_calc
    ) bcc
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND COALESCE(base.AFID_CHANNEL, 80) = bcc.AFID
      AND base.Date_of_Sale = day_date
      AND base.Trial_Type IS NOT NULL
      AND base.Trial_Type != 'SS'
      AND (
        (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
        OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
      )
      -- Country logic (VPU CT-pattern)
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, AFID
),

with_daily_metrics AS (
  SELECT 
    bcc.*,
    COALESCE(ds.Daily_Allocated_Spend, 0) AS Daily_Allocated_Spend,
    COALESCE(rs.Recent_Spend, 0) AS Recent_Spend,
    COALESCE(rs.Recent_Spend, 0) / 7.0 AS T7D_Spend,
    COALESCE(du.Daily_New_Users, 0) AS Daily_New_Users,
    dss.Daily_SS_Users,
    t7dss.T7D_Daily_SS_Users,
    t7dnu.T7D_New_Users,
    COALESCE(
      SAFE_DIVIDE(ds.Daily_Allocated_Spend, NULLIF(du.Daily_New_Users, 0)),
      0
    ) AS Daily_CAC,
    SAFE_DIVIDE(rs.Recent_Spend, NULLIF(tuss.T7D_Users_SS_Sum, 0)) AS T7D_CAC_SS
  FROM bc4_ceiling_calc bcc
  LEFT JOIN daily_spend_calc ds
    ON bcc.Report_date = ds.Report_date
    AND bcc.App_Name = ds.App_Name
    AND bcc.Country_Code = ds.Country_Code
    AND bcc.AFID = ds.AFID
  LEFT JOIN daily_users_calc du
    ON bcc.Report_date = du.Report_date
    AND bcc.App_Name = du.App_Name
    AND bcc.Country_Code = du.Country_Code
    AND bcc.AFID = du.AFID
  LEFT JOIN daily_ss_users_calc dss
    ON bcc.Report_date = dss.Report_date
    AND bcc.App_Name = dss.App_Name
    AND bcc.Country_Code = dss.Country_Code
    AND bcc.AFID = dss.AFID
  LEFT JOIN t7d_daily_ss_users_calc t7dss
    ON bcc.Report_date = t7dss.Report_date
    AND bcc.App_Name = t7dss.App_Name
    AND bcc.Country_Code = t7dss.Country_Code
    AND bcc.AFID = t7dss.AFID
  LEFT JOIN recent_spend_calc rs
    ON bcc.Report_date = rs.Report_date
    AND bcc.App_Name = rs.App_Name
    AND bcc.Country_Code = rs.Country_Code
    AND bcc.AFID = rs.AFID
  LEFT JOIN t7d_users_ss_sum_calc tuss
    ON bcc.Report_date = tuss.Report_date
    AND bcc.App_Name = tuss.App_Name
    AND bcc.Country_Code = tuss.Country_Code
    AND bcc.AFID = tuss.AFID
  LEFT JOIN t7d_new_users_calc t7dnu
    ON bcc.Report_date = t7dnu.Report_date
    AND bcc.App_Name = t7dnu.App_Name
    AND bcc.Country_Code = t7dnu.Country_Code
    AND bcc.AFID = t7dnu.AFID
),

-- =====================================================
-- STEP 6: FIRST NULL BC DETECTION
-- Simplified for App level: BC0 NEVER triggers
-- BC1+: Rebills < 25 → triggers NULL cascade
-- =====================================================
first_null_detection AS (
  SELECT 
    wdm.*,
    
    MIN(CASE 
      -- BC0: Never triggers NULL (Fix #4)
      WHEN wdm.Billing_Cycle = 0 THEN NULL
      
      -- BC1+: Check if Rebills < 25
      WHEN wdm.Billing_Cycle >= 1 
        AND (wdm.Rebills_raw IS NULL OR wdm.Rebills_raw < 25)
      THEN wdm.Billing_Cycle
      
      ELSE NULL
    END) OVER (
      PARTITION BY wdm.App_Name, wdm.Country_Code, wdm.AFID, wdm.Report_date, wdm.Cohort, wdm.Table_Type
      ORDER BY wdm.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS First_Null_BC,
    
    -- Partition-wide version (no ORDER BY) for BC4-anchored cascade checks
    -- Used by BC4_CAC_Ceiling, BC4_Net_LTV_Discounted, and Profit
    MIN(CASE 
      WHEN wdm.Billing_Cycle = 0 THEN NULL
      WHEN wdm.Billing_Cycle >= 1 
        AND (wdm.Rebills_raw IS NULL OR wdm.Rebills_raw < 25)
      THEN wdm.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY wdm.App_Name, wdm.Country_Code, wdm.AFID, wdm.Report_date, wdm.Cohort, wdm.Table_Type
    ) AS Partition_First_Null_BC
    
  FROM with_daily_metrics wdm
)

-- =====================================================
-- FINAL OUTPUT: 28 COLUMNS
-- 8 metrics cascaded via First_Null_BC
-- BC4_CAC_Ceiling excluded from cascade
-- Daily metrics and broadcasted metrics not cascaded
-- =====================================================
SELECT 
  -- Dimensions (6)
  Report_date AS Reporting_Date,
  Active_Inactive,
  Billing_Cycle AS BC,
  App_Name,
  Country_Code AS Country,
  AFID,
  
  -- User Metrics (3)
  CAST(Subscription_users AS INT64) AS Subscriptions,
  CAST(Rebills_raw AS INT64) AS Rebills,
  CAST(Single_Sale_Broadcasted AS INT64) AS Single_Sale,
  
  -- Performance Ratios (5) — WITH CASCADE
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate
  END AS Churn_Rate,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio
  END AS Refund_Rate,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Cumulative_Refund_Rate
  END AS Cumulative_Refund_Rate,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Retention_rate
  END AS Gross_ARPU_Retention_Rate,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NET_Retention_rate
  END AS Net_ARPU_Retention_Rate,
  
  -- Broadcasted Metrics (2) — NOT cascaded
  NULLIF(Recent_CAC_Broadcasted, 0) AS Recent_CAC,
  T30D_New_Users_Broadcasted AS T30D_New_Users,
  
  -- Daily Metrics (5) — NOT cascaded
  Daily_Allocated_Spend,
  Recent_Spend,
  T7D_Spend,
  Daily_New_Users,
  Daily_SS_Users,
  T7D_Daily_SS_Users,
  NULLIF(Daily_CAC, 0) AS Daily_CAC,
  T7D_CAC_SS,

  -- T7D New Users (now computed from Daily_New_Users logic) — NOT cascaded
  T7D_New_Users,
  
  -- Cumulative ARPU/LTV (3) — WITH CASCADE
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NULLIF(Gross_ARPU_Discounted, 0)
  END AS Gross_ARPU_Discounted,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NULLIF(Net_ARPU_Discounted_Cumulative, 0)
  END AS Net_ARPU_Discounted,
  
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NULLIF(Net_LTV_Discounted_Cumulative, 0)
  END AS Net_LTV_Discounted,
  
-- BC4_CAC_Ceiling — cascaded at BC4 level (uses partition-wide First_Null_BC)
  CASE 
    WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL
    ELSE NULLIF(BC4_CAC_Ceiling, 0)
  END AS BC4_CAC_Ceiling,

-- BC4_Net_LTV_Discounted — cumulative Net_LTV at BC=4, broadcast to all BCs
  -- Respects NULL cascade: NULL if 4 >= Partition_First_Null_BC (partition-wide)
  CASE 
    WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL
    ELSE NULLIF(BC4_Net_LTV_Discounted_Raw, 0)
  END AS BC4_Net_LTV_Discounted,

-- Profit = T30D_New_Users (BC0 broadcasted) × BC4_Net_LTV_Discounted
  -- NULL if either input is 0/NULL, or if BC4 is knocked out by cascade (partition-wide)
  CASE 
    WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL
    WHEN COALESCE(T30D_New_Users_Broadcasted, 0) = 0 THEN NULL
    WHEN COALESCE(BC4_Net_LTV_Discounted_Raw, 0) = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted * BC4_Net_LTV_Discounted_Raw
  END AS Profit,
  
  -- Identifiers (2)
  Cohort,
  Table_Type AS Table

FROM first_null_detection

ORDER BY 
  Reporting_Date DESC, 
  App_Name,
  Country,
  AFID,
  Cohort,
  Table,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - FINAL TABLE APP × AFID LEVEL
-- Table: variant-finance-data-project.ICARUS_Multi.Final_Table_App_AFID_Level
--
-- GRAIN: Report_date × App_Name × Country_Code × AFID × Billing_Cycle × Cohort × Table
--
-- SOURCE TABLES (4):
-- 1. ICARUS_Multi.7K_30D_Crystal_Ball_App_AFID_level (CB_User → Rebills_raw)
-- 2. ICARUS_Multi.7K_Crystal_Ball_App_AFID_level (CB_User → Rebills_raw)
-- 3. ICARUS_Multi.7K_30D_Main_Table_App_AFID_level (Rebill_users → Rebills_raw)
-- 4. ICARUS_Multi.7K_Main_Table_App_AFID_level (Rebill_users → Rebills_raw)
--
-- DAILY METRICS SOURCE TABLES:
-- Spend: Ad_spend_data.Merged_Spend_Split_TBL (COALESCE(Channel_code, 80) = AFID)
-- Users: Sticky_Data.Sticky_data_API_original_V_Merged_TBL (COALESCE(AFID_CHANNEL, 80) = AFID)
-- SS Users: Sticky_Data.Sticky_data_API_original_V_Merged_TBL (RIGHT(Product_name_Final,2)='SS', BC0)
-- T7D SS Users: Sticky_Data.Sticky_data_API_original_V_Merged_TBL (7-day trailing avg of daily SS distinct counts)
-- T7D New Users: Sticky_Data.Sticky_data_API_original_V_Merged_TBL (7-day trailing avg of daily new user distinct counts)
--
-- NULL CASCADE LOGIC (Simplified for App level):
-- BC0: NEVER triggers NULL (always valid)
-- BC1+: Rebills_raw < 25 → First_Null_BC → all subsequent BCs NULL
-- 8 metrics cascaded: Churn, Refund, Cum_Refund, Gross_Ret, Net_Ret, Gross_ARPU, Net_ARPU, Net_LTV
-- BC4_CAC_Ceiling: Excluded from cascade
-- Broadcasted: Recent_CAC, T30D_New_Users, Recent_Users (not cascaded)
-- Daily: Daily_Allocated_Spend, Daily_New_Users, Daily_SS_Users, T7D_Daily_SS_Users, Daily_CAC, T7D_New_Users (not cascaded)
--
-- DIFFERENCES FROM PLAN-LEVEL FINAL TABLE:
-- No NT BC0 NULL logic (no Trial_Type at App level)
-- No Plan_Name, Entity_Name, Trial_Type, Product_AFID
-- Added: Cumulative_Refund_Rate, Daily_Allocated_Spend, Daily_New_Users, Daily_SS_Users, T7D_Daily_SS_Users, Daily_CAC, T7D_New_Users
-- Simplified First_Null_BC (no NT/non-NT distinction)
-- Active_Inactive: Checks App_Name in Active_Plans_6M
--
-- OUTPUT COLUMNS (28):
-- 1.  Reporting_Date
-- 2.  Active_Inactive
-- 3.  BC
-- 4.  App_Name
-- 5.  Country
-- 6.  AFID
-- 7.  Subscriptions
-- 8.  Rebills
-- 9.  Single_Sale
-- 10. Churn_Rate
-- 11. Refund_Rate
-- 12. Cumulative_Refund_Rate
-- 13. Gross_ARPU_Retention_Rate
-- 14. Net_ARPU_Retention_Rate
-- 15. Recent_CAC (broadcast)
-- 16. T30D_New_Users (broadcast)
-- 17. Daily_Allocated_Spend
-- 18. Daily_New_Users
-- 19. Daily_SS_Users
-- 20. T7D_Daily_SS_Users
-- 21. Daily_CAC
-- 22. T7D_New_Users (computed from Daily_New_Users logic, 7-day trailing avg)
-- 23. Gross_ARPU_Discounted (cumulative)
-- 24. Net_ARPU_Discounted (cumulative)
-- 25. Net_LTV_Discounted (cumulative)
-- 26. BC4_CAC_Ceiling (excluded from cascade)
-- 27. Cohort
-- 28. Table
-- =====================================================
