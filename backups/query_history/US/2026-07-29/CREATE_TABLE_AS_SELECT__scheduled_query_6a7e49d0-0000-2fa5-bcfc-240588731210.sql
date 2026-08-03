-- job_id: scheduled_query_6a7e49d0-0000-2fa5-bcfc-240588731210
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:30:10.372000+00:00
-- started: 2026-07-29T09:30:10.664000+00:00
-- ended: 2026-07-29T09:31:52.573000+00:00

-- =====================================================
-- FINAL TABLE - APP LEVEL
-- Merge of 4 App-level tables + 3 new metrics
--
-- SOURCES:
-- 1. 7K_30D_Crystal_Ball_App_level (Cohort=7K_30D, Table=Crystal Ball)
-- 2. 7K_Crystal_Ball_App_level (Cohort=7K, Table=Crystal Ball)
-- 3. 7K_30D_Main_Table_App_level (Cohort=7K_30D, Table=Regular)
-- 4. 7K_Main_Table_App_level (Cohort=7K, Table=Regular)
-- 5. Ad_spend_data.Merged_Spend_Split_TBL (Daily_Allocated_Spend)
-- 6. Sticky_Data.Sticky_data_API_original_V_Merged_TBL (Daily_New_Users)
--
-- VG SUPPORT:
-- VG rows flow in from upstream tables
-- VG CTEs filtered to 7 active apps: CT-JP, CT-Non-JP, CL, EN, FS, JF, PD
-- All other metrics computed correctly from upstream VG data
--
-- OUTPUT: 29 columns (26 original + BC4_Net_LTV_Discounted + Profit + MTD_CAC)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_App_Level` AS

WITH
active_vg_apps AS (
  SELECT App_Name
  FROM `variant-finance-data-project.ICARUS_Multi.Dim_Active_VG_Apps`
),

active_vg_prefixes AS (
  SELECT DISTINCT LEFT(App_Name, 2) AS App_Prefix
  FROM `variant-finance-data-project.ICARUS_Multi.Dim_Active_VG_Apps`
),

-- =====================================================
-- STEP 1: UNION ALL 4 APP-LEVEL SOURCE TABLES
-- Standardize column names and add identifiers
-- =====================================================
unioned_data AS (
  -- Table 1: 7K_30D_Crystal_Ball_App_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    Billing_Cycle,
    Active_Inactive,
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
    SOT_Projection AS SOT,
    '7K_30D' AS Cohort,
    'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball_App_level`

  UNION ALL

  -- Table 2: 7K_Crystal_Ball_App_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    Billing_Cycle,
    Active_Inactive,
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
    SOT_Projection AS SOT,
    '7K' AS Cohort,
    'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball_App_level`

  UNION ALL

  -- Table 3: 7K_30D_Main_Table_App_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    Billing_Cycle,
    Active_Inactive,
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
    Actual_SOT AS SOT,
    '7K_30D' AS Cohort,
    'Regular' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table_App_level`

  UNION ALL

  -- Table 4: 7K_Main_Table_App_level
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    Billing_Cycle,
    Active_Inactive,
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
    Actual_SOT AS SOT,
    '7K' AS Cohort,
    'Regular' AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table_App_level`
),

-- =====================================================
-- STEP 2: DAILY ALLOCATED SPEND (existing apps)
-- SUM allocated_spend for exact Report_date per App + Country
-- =====================================================
daily_spend_calc AS (
  SELECT 
    ud.Report_date,
    ud.App_Name,
    ud.Country_Code,
    COALESCE(SUM(
      CASE 
        WHEN ud.Country_Code = 'JP' AND ads.Country = 'JP' 
          THEN ads.allocated_spend
        WHEN ud.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) 
          THEN ads.allocated_spend
        WHEN ud.Country_Code IS NULL OR ud.Country_Code = '' 
          THEN ads.allocated_spend
        ELSE 0
      END
    ), 0) AS Daily_Allocated_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM unioned_data
    WHERE App_Name != 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ud.App_Name = ads.App_Name
    AND ads.Date = ud.Report_date
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code
),

-- =====================================================
-- RECENT SPEND (existing apps)
-- 7-day sum of allocated_spend, not divided
-- =====================================================
recent_spend_calc AS (
  SELECT 
    ud.Report_date,
    ud.App_Name,
    ud.Country_Code,
    COALESCE(SUM(
      CASE 
        WHEN ud.Country_Code = 'JP' AND ads.Country = 'JP' 
          THEN ads.allocated_spend
        WHEN ud.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) 
          THEN ads.allocated_spend
        WHEN ud.Country_Code IS NULL OR ud.Country_Code = '' 
          THEN ads.allocated_spend
        ELSE 0
      END
    ), 0) AS Recent_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM unioned_data
    WHERE App_Name != 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ud.App_Name = ads.App_Name
    AND ads.Date BETWEEN DATE_SUB(ud.Report_date, INTERVAL 6 DAY) AND ud.Report_date
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code
),

-- =====================================================
-- VG: DAILY ALLOCATED SPEND
-- VG CHANGE: Filtered to 7 active apps only
-- =====================================================
vg_daily_spend_calc AS (
  SELECT 
    ud.Report_date,
    COALESCE(SUM(ads.allocated_spend), 0) AS Daily_Allocated_Spend
  FROM (
    SELECT DISTINCT Report_date
    FROM unioned_data
    WHERE App_Name = 'VG'
  ) ud
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date = ud.Report_date
  INNER JOIN active_vg_apps ava
    ON ads.App_Name = ava.App_Name
  GROUP BY ud.Report_date
),

-- =====================================================
-- VG: RECENT SPEND
-- VG CHANGE: Filtered to 7 active apps only
-- =====================================================
vg_recent_spend_calc AS (
  SELECT 
    ud.Report_date,
    COALESCE(SUM(ads.allocated_spend), 0) AS Recent_Spend
  FROM (
    SELECT DISTINCT Report_date
    FROM unioned_data
    WHERE App_Name = 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date BETWEEN DATE_SUB(ud.Report_date, INTERVAL 6 DAY) AND ud.Report_date
  INNER JOIN active_vg_apps ava
    ON ads.App_Name = ava.App_Name
  GROUP BY ud.Report_date
),

-- =====================================================
-- STEP 3: DAILY NEW USERS (existing apps)
-- COUNT DISTINCT users for exact Report_date per App + Country
-- VPU pattern: LEFT(App_Name, 2) prefix match
-- =====================================================
daily_new_users_calc AS (
  SELECT 
    ud.Report_date,
    ud.App_Name,
    ud.Country_Code,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM unioned_data
    WHERE App_Name != 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
    AND base.Date_of_Sale = ud.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    AND (
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
        AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
        AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (ud.Country_Code IS NULL OR ud.Country_Code = '')
    )
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code
),

-- =====================================================
-- VG: DAILY NEW USERS
-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
-- =====================================================
vg_daily_new_users_calc AS (
  SELECT 
    ud.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (
    SELECT DISTINCT Report_date
    FROM unioned_data
    WHERE App_Name = 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale = ud.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  INNER JOIN active_vg_prefixes avp
    ON LEFT(base.App_Name, 2) = avp.App_Prefix
  GROUP BY ud.Report_date
),

-- =====================================================
-- STEP 3b: DAILY SS USERS (existing apps)
-- COUNT DISTINCT users where Product_name_Final ends with 'SS'
-- =====================================================
daily_ss_users_calc AS (
  SELECT 
    ud.Report_date,
    ud.App_Name,
    ud.Country_Code,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM unioned_data
    WHERE App_Name != 'VG'
  ) ud
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
    AND base.Date_of_Sale = ud.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
    AND (
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
        AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
        AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (ud.Country_Code IS NULL OR ud.Country_Code = '')
    )
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code
),

-- =====================================================
-- VG: DAILY SS USERS
-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
-- =====================================================
vg_daily_ss_users_calc AS (
  SELECT 
    ud.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM (
    SELECT DISTINCT Report_date
    FROM unioned_data
    WHERE App_Name = 'VG'
  ) ud
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale = ud.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
  INNER JOIN active_vg_prefixes avp
    ON LEFT(base.App_Name, 2) = avp.App_Prefix
  GROUP BY ud.Report_date
),

-- =====================================================
-- STEP 3c: T7D DAILY SS USERS (existing apps)
-- Sum of each day's COUNT DISTINCT over trailing 7 days / 7
-- =====================================================
t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      ud.Report_date,
      ud.App_Name,
      ud.Country_Code,
      day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Country_Code
      FROM unioned_data
      WHERE App_Name != 'VG'
    ) ud
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(ud.Report_date, INTERVAL 6 DAY), ud.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
      AND base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
      AND (
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
          AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
          AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (ud.Country_Code IS NULL OR ud.Country_Code = '')
      )
    GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code
),

-- =====================================================
-- VG: T7D DAILY SS USERS
-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
-- =====================================================
vg_t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      ud.Report_date,
      day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date
      FROM unioned_data
      WHERE App_Name = 'VG'
    ) ud
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(ud.Report_date, INTERVAL 6 DAY), ud.Report_date)
    ) AS day_date
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
    INNER JOIN active_vg_prefixes avp
      ON LEFT(base.App_Name, 2) = avp.App_Prefix
    GROUP BY ud.Report_date, day_date
  )
  GROUP BY Report_date
),

-- =====================================================
-- T7D USERS + SS SUM (existing apps, for T7D_CAC_SS)
-- SUM(New_Users) + SUM(SS_Users) over trailing 7 days
-- =====================================================
t7d_users_ss_sum_calc AS (
  SELECT
    Report_date,
    App_Name,
    Country_Code,
    SUM(daily_new_count) + SUM(daily_ss_count) AS T7D_Users_SS_Sum
  FROM (
    SELECT
      ud.Report_date,
      ud.App_Name,
      ud.Country_Code,
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
      SELECT DISTINCT Report_date, App_Name, Country_Code
      FROM unioned_data
      WHERE App_Name != 'VG'
    ) ud
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(ud.Report_date, INTERVAL 6 DAY), ud.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
      AND base.Date_of_Sale = day_date
      AND (
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%'
          AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%'
          AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP'
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP'
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (ud.Country_Code IS NULL OR ud.Country_Code = '')
      )
    GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code
),

-- =====================================================
-- VG: T7D USERS + SS SUM
-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
-- =====================================================
vg_t7d_users_ss_sum_calc AS (
  SELECT
    Report_date,
    SUM(daily_new_count) + SUM(daily_ss_count) AS T7D_Users_SS_Sum
  FROM (
    SELECT
      ud.Report_date,
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
      SELECT DISTINCT Report_date
      FROM unioned_data
      WHERE App_Name = 'VG'
    ) ud
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(ud.Report_date, INTERVAL 6 DAY), ud.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON base.Date_of_Sale = day_date
    INNER JOIN active_vg_prefixes avp
      ON LEFT(base.App_Name, 2) = avp.App_Prefix
    GROUP BY ud.Report_date, day_date
  )
  GROUP BY Report_date
),

-- =====================================================
-- STEP 4: CUMULATIVE METRICS
-- Running SUM of ARPU, Net_ARPU, Net_LTV, Refund_ratio
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,

    -- Cumulative Gross_ARPU_Discounted
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Gross_ARPU_Discounted,

    -- Cumulative Net_ARPU_Discounted
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_ARPU_Discounted_Cumulative,

    -- Cumulative Net_LTV_Discounted
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_LTV_Discounted_Cumulative,

    -- Cumulative Refund_ratio (running SUM)
    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.App_Name, ud.Report_date, ud.Country_Code, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Refund_Rate

  FROM unioned_data ud
),

-- =====================================================
-- STEP 5: BROADCAST RECENT_CAC AND T30D_NEW_USERS
-- Take BC0 values and broadcast to all BCs
-- Join Daily metrics: existing apps use existing CTEs, VG uses VG CTEs
-- =====================================================
broadcast_and_join AS (
  SELECT 
    cm.*,

    -- Broadcast Recent_CAC from BC0 to all BCs
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_CAC ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) AS Recent_CAC_Broadcasted,

    -- Broadcast T30D_New_Users from BC0 to all BCs
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.T30D_New_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) AS T30D_New_Users_Broadcasted,

    -- Broadcast Recent_Users from BC0 to all BCs
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type
    ) AS Recent_Users_Broadcasted,

    -- Daily Allocated Spend: VG uses VG CTE, existing apps use existing CTE
    CASE 
      WHEN cm.App_Name = 'VG' THEN COALESCE(vg_dsc.Daily_Allocated_Spend, 0)
      ELSE COALESCE(dsc.Daily_Allocated_Spend, 0)
    END AS Daily_Allocated_Spend,

    -- Recent Spend: VG uses VG CTE, existing apps use existing CTE
    CASE 
      WHEN cm.App_Name = 'VG' THEN COALESCE(vg_rs.Recent_Spend, 0)
      ELSE COALESCE(rs.Recent_Spend, 0)
    END AS Recent_Spend,

    -- T7D Spend: Recent_Spend / 7
    CASE 
      WHEN cm.App_Name = 'VG' THEN COALESCE(vg_rs.Recent_Spend, 0) / 7.0
      ELSE COALESCE(rs.Recent_Spend, 0) / 7.0
    END AS T7D_Spend,

    -- T7D CAC SS: Recent_Spend / (7-day sum of New_Users + SS_Users)
    CASE
      WHEN cm.App_Name = 'VG' THEN SAFE_DIVIDE(COALESCE(vg_rs.Recent_Spend, 0), NULLIF(vg_tuss.T7D_Users_SS_Sum, 0))
      ELSE SAFE_DIVIDE(COALESCE(rs.Recent_Spend, 0), NULLIF(tuss.T7D_Users_SS_Sum, 0))
    END AS T7D_CAC_SS,

    -- Daily New Users: VG uses VG CTE, existing apps use existing CTE
    CASE 
      WHEN cm.App_Name = 'VG' THEN COALESCE(vg_dnu.Daily_New_Users, 0)
      ELSE COALESCE(dnu.Daily_New_Users, 0)
    END AS Daily_New_Users,

    -- Daily SS Users: VG uses VG CTE, existing apps use existing CTE
    CASE 
      WHEN cm.App_Name = 'VG' THEN COALESCE(vg_dss.Daily_SS_Users, 0)
      ELSE COALESCE(dss.Daily_SS_Users, 0)
    END AS Daily_SS_Users,

    -- T7D Daily SS Users: VG uses VG CTE, existing apps use existing CTE
    CASE 
      WHEN cm.App_Name = 'VG' THEN vg_t7dss.T7D_Daily_SS_Users
      ELSE t7dss.T7D_Daily_SS_Users
    END AS T7D_Daily_SS_Users,
    

    -- Single_Sale: BC0 priority, fallback to BC1 if BC0 is 0/NULL, broadcast to all BCs
    COALESCE(
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type),
        0
      ),
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 1 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Report_date, cm.Country_Code, cm.Cohort, cm.Table_Type),
        0
      )
    ) AS Single_Sale_Broadcasted

  FROM cumulative_metrics cm
  -- Existing app joins
  LEFT JOIN daily_spend_calc dsc
    ON cm.Report_date = dsc.Report_date
    AND cm.App_Name = dsc.App_Name
    AND cm.Country_Code = dsc.Country_Code
    AND cm.App_Name != 'VG'
  LEFT JOIN daily_new_users_calc dnu
    ON cm.Report_date = dnu.Report_date
    AND cm.App_Name = dnu.App_Name
    AND cm.Country_Code = dnu.Country_Code
    AND cm.App_Name != 'VG'
  LEFT JOIN daily_ss_users_calc dss
    ON cm.Report_date = dss.Report_date
    AND cm.App_Name = dss.App_Name
    AND cm.Country_Code = dss.Country_Code
    AND cm.App_Name != 'VG'
  LEFT JOIN t7d_daily_ss_users_calc t7dss
    ON cm.Report_date = t7dss.Report_date
    AND cm.App_Name = t7dss.App_Name
    AND cm.Country_Code = t7dss.Country_Code
    AND cm.App_Name != 'VG'
  -- VG-specific joins
  LEFT JOIN vg_daily_spend_calc vg_dsc
    ON cm.Report_date = vg_dsc.Report_date
    AND cm.App_Name = 'VG'
  LEFT JOIN recent_spend_calc rs
    ON cm.Report_date = rs.Report_date
    AND cm.App_Name = rs.App_Name
    AND cm.Country_Code = rs.Country_Code
    AND cm.App_Name != 'VG'
  LEFT JOIN vg_recent_spend_calc vg_rs
    ON cm.Report_date = vg_rs.Report_date
    AND cm.App_Name = 'VG'
  LEFT JOIN t7d_users_ss_sum_calc tuss
    ON cm.Report_date = tuss.Report_date
    AND cm.App_Name = tuss.App_Name
    AND cm.Country_Code = tuss.Country_Code
    AND cm.App_Name != 'VG'
  LEFT JOIN vg_t7d_users_ss_sum_calc vg_tuss
    ON cm.Report_date = vg_tuss.Report_date
    AND cm.App_Name = 'VG'
  LEFT JOIN vg_daily_new_users_calc vg_dnu
    ON cm.Report_date = vg_dnu.Report_date
    AND cm.App_Name = 'VG'
  LEFT JOIN vg_daily_ss_users_calc vg_dss
    ON cm.Report_date = vg_dss.Report_date
    AND cm.App_Name = 'VG'
  LEFT JOIN vg_t7d_daily_ss_users_calc vg_t7dss
    ON cm.Report_date = vg_t7dss.Report_date
    AND cm.App_Name = 'VG'
),

-- =====================================================
-- STEP 5b: MONTH-TO-DATE CAC
-- MTD_CAC = running SUM(Daily_Allocated_Spend) / running SUM(Daily_New_Users)
-- from the 1st of the month up to each Report_date, reset every month.
-- Computed on DISTINCT date-level rows because Daily_Allocated_Spend /
-- Daily_New_Users are broadcast identically across all BCs — summing the
-- raw BC rows would multiply the totals by the number of billing cycles.
-- =====================================================
mtd_cac_calc AS (
  SELECT
    App_Name,
    Country_Code,
    Cohort,
    Table_Type,
    Report_date,
    SAFE_DIVIDE(
      SUM(Daily_Allocated_Spend) OVER w,
      NULLIF(SUM(Daily_New_Users) OVER w, 0)
    ) AS MTD_CAC
  FROM (
    SELECT DISTINCT
      App_Name,
      Country_Code,
      Cohort,
      Table_Type,
      Report_date,
      Daily_Allocated_Spend,
      Daily_New_Users
    FROM broadcast_and_join
  )
  WINDOW w AS (
    PARTITION BY App_Name, Country_Code, Cohort, Table_Type, DATE_TRUNC(Report_date, MONTH)
    ORDER BY Report_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  )
),

-- =====================================================
-- STEP 6: BC4_CAC_CEILING + BC4_NET_LTV_DISCOUNTED
-- BC4_CAC_Ceiling: Net_ARPU_Discounted_Cumulative at BC=4 minus $1.2
-- BC4_Net_LTV_Discounted: Net_LTV_Discounted_Cumulative at BC=4
-- Both broadcast to all BCs
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    bj.*,
    mc.MTD_CAC,

    MAX(CASE WHEN bj.Billing_Cycle = 4 THEN bj.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bj.App_Name, bj.Report_date, bj.Country_Code, bj.Cohort, bj.Table_Type) - 1.2 
      AS BC4_CAC_Ceiling,

    -- NEW: BC4 Net LTV Discounted (cumulative at BC=4, broadcast to all BCs)
    MAX(CASE WHEN bj.Billing_Cycle = 4 THEN bj.Net_LTV_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bj.App_Name, bj.Report_date, bj.Country_Code, bj.Cohort, bj.Table_Type)
      AS BC4_Net_LTV_Discounted_Raw

  FROM broadcast_and_join bj
  LEFT JOIN mtd_cac_calc mc
    ON  bj.App_Name     = mc.App_Name
    AND bj.Country_Code = mc.Country_Code
    AND bj.Cohort       = mc.Cohort
    AND bj.Table_Type   = mc.Table_Type
    AND bj.Report_date  = mc.Report_date
),

-- =====================================================
-- STEP 7: FIRST NULL BC DETECTION
-- BC0: Never triggers NULL (always valid at App level)
-- BC1+: Rebills < 25 triggers NULL cascade forward
-- =====================================================
first_null_detection AS (
  SELECT 
    bcc.*,

    MIN(CASE 
      WHEN bcc.Billing_Cycle >= 1 
        AND (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
      THEN bcc.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.App_Name, bcc.Report_date, bcc.Country_Code, bcc.Cohort, bcc.Table_Type
    ) AS First_Null_BC

  FROM bc4_ceiling_calc bcc
)

-- =====================================================
-- FINAL OUTPUT: 29 COLUMNS (26 original + 3 new)
-- =====================================================
SELECT 
  -- Dimensions (5)
  Report_date AS Reporting_Date,
  Active_Inactive,
  Billing_Cycle AS BC,
  App_Name,
  Country_Code AS Country,

  -- User Metrics (3)
  Subscription_users AS Subscriptions,

  CASE 
    WHEN Rebills_raw IS NULL THEN NULL
    ELSE Rebills_raw
  END AS Rebills,

  SOT,

  Single_Sale_Broadcasted AS Single_Sale,

  -- Performance Ratios (4) - WITH NULL CASCADE
  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate
  END AS Churn_Rate,

  CASE 
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio
  END AS Refund_Rate,

  -- Cumulative Refund Rate - WITH NULL CASCADE
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

  -- CAC & Users (2) - BROADCASTED
  NULLIF(Recent_CAC_Broadcasted, 0) AS Recent_CAC,
  T30D_New_Users_Broadcasted AS T30D_New_Users,

  -- Daily Metrics (3) - BROADCASTED (same for all BCs)
  Daily_Allocated_Spend,
  Recent_Spend,
  T7D_Spend,
  Daily_New_Users,
  Daily_SS_Users,

  -- T7D Daily SS Users (trailing 7-day avg)
  T7D_Daily_SS_Users,

  -- T7D New Users (Recent_Users from base tables / 7)
  SAFE_DIVIDE(Recent_Users_Broadcasted, 7) AS T7D_New_Users,

  -- Daily CAC
  CASE 
    WHEN COALESCE(Daily_New_Users, 0) = 0 THEN NULL
    ELSE NULLIF(SAFE_DIVIDE(Daily_Allocated_Spend, Daily_New_Users), 0)
  END AS Daily_CAC,
  T7D_CAC_SS,

  -- Month-to-date CAC (MTD spend / MTD new users, running within the month)
  MTD_CAC,

  -- Cumulative ARPU/LTV (3) - WITH NULL CASCADE
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

  -- BC4_CAC_Ceiling (1) - EXCLUDED FROM CASCADE
  CASE 
    WHEN (Subscription_users IS NULL OR Subscription_users = 0) 
     AND (Rebills_raw IS NULL OR Rebills_raw = 0)
    THEN NULL
    ELSE NULLIF(BC4_CAC_Ceiling, 0)
  END AS BC4_CAC_Ceiling,

  -- =====================================================
  -- NEW COLUMN: BC4_Net_LTV_Discounted
  -- Cumulative Net_LTV_Discounted at BC=4, broadcast to all BCs
  -- Respects NULL cascade: NULL if BC4 >= First_Null_BC
  -- =====================================================
  CASE 
    WHEN First_Null_BC IS NOT NULL AND 4 >= First_Null_BC THEN NULL
    ELSE NULLIF(BC4_Net_LTV_Discounted_Raw, 0)
  END AS BC4_Net_LTV_Discounted,

  -- =====================================================
  -- NEW COLUMN: Profit
  -- T30D_New_Users (BC0 broadcasted) * BC4_Net_LTV_Discounted
  -- NULL if either input is 0 or NULL
  -- Respects NULL cascade via BC4_Net_LTV_Discounted
  -- =====================================================
  CASE 
    WHEN First_Null_BC IS NOT NULL AND 4 >= First_Null_BC THEN NULL
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
  Cohort,
  Table,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - APP LEVEL FINAL TABLE
-- Table: variant-finance-data-project.ICARUS_Multi.Final_Table_App_Level
--
-- VG CTEs filtered to active apps via Dim table:
-- variant-finance-data-project.ICARUS_Multi.Dim_Active_VG_Apps
-- Full names used for spend tables, 2-letter prefixes for Sticky tables
-- =====================================================
