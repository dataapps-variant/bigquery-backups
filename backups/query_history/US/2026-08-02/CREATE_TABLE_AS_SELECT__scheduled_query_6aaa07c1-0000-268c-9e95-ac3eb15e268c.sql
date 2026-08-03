-- job_id: scheduled_query_6aaa07c1-0000-268c-9e95-ac3eb15e268c
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T08:15:01.248000+00:00
-- started: 2026-08-02T08:15:01.710000+00:00
-- ended: 2026-08-02T08:15:04.586000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Daedalus_Traffic_Channel_7D` AS

WITH date_range AS (
  -- Generate dates from 2025-01-01 to yesterday (2026-01-23)
  SELECT date
  FROM UNNEST(GENERATE_DATE_ARRAY('2025-01-01', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) AS date
),

traffic_channel_combinations AS (
  -- Get unique Date, App_Name, Traffic_Channel combinations from both spend and sticky data
  SELECT DISTINCT
    date,
    App_Name,
    Traffic_Channel
  FROM (
    -- From spend data
    SELECT 
      Date AS date,
      App_Name,
      Channel_code AS Traffic_Channel
    FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
    WHERE Channel_code IS NOT NULL
      AND App_Name != 'CT'
      AND Date >= '2025-01-01'
    
    UNION DISTINCT
    
    -- From sticky data
    SELECT 
      Date_of_Sale AS date,
      App_Name,
      AFID_CHANNEL AS Traffic_Channel
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE AFID_CHANNEL IS NOT NULL
      AND App_Name != 'CT'
      AND Date_of_Sale >= '2025-01-01'
  )
),

base_table AS (
  -- Base table with actual date/app/channel combinations that exist in the data
  SELECT 
    tc.date,
    tc.App_Name,
    tc.Traffic_Channel,
    dt.Entity
  FROM traffic_channel_combinations tc
  LEFT JOIN (
    SELECT DISTINCT App_Name, Entity
    FROM `variant-finance-data-project.Daedalus.Daedalus_Targets`
  ) dt
    ON tc.App_Name = dt.App_Name
),

daily_spend AS (
  -- Daily spend (single day, not cumulative) by traffic channel
  SELECT 
    b.date,
    b.App_Name,
    b.Traffic_Channel,
    SUM(a.allocated_spend) AS Daily_Spend
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` a
    ON a.Date = b.date 
    AND a.App_Name = b.App_Name
    AND a.Channel_code = b.Traffic_Channel
  GROUP BY b.date, b.App_Name, b.Traffic_Channel
),

daily_sticky_users AS (
  -- Daily count of unique Sticky users (single day, not cumulative) by traffic channel
  SELECT 
    b.date,
    b.App_Name,
    b.Traffic_Channel,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Sticky_User_Count
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON s.Date_of_Sale = b.date 
    AND s.AFID_CHANNEL = b.Traffic_Channel
    AND (
      (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0) 
      OR (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
    )
    AND (
      -- Handle CT-JP: App_Name = CT and Country = JP
      (b.App_Name = 'CT-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID = 'JP')
      -- Handle CT-Non-JP: App_Name = CT and Country != JP
      OR (b.App_Name = 'CT-Non-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID != 'JP')
      -- Handle all other apps: direct match
      OR (b.App_Name NOT IN ('CT-JP', 'CT-Non-JP') AND s.App_Name = b.App_Name)
    )
  GROUP BY b.date, b.App_Name, b.Traffic_Channel
),

daily_ss_users AS (
  -- Daily count of unique SS users (single day, not cumulative) by traffic channel
  SELECT 
    b.date,
    b.App_Name,
    b.Traffic_Channel,
    COUNT(DISTINCT ss.Updated_Cust_ID) AS SS_User_Count
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON ss.Date_of_Sale = b.date 
    AND ss.AFID_CHANNEL = b.Traffic_Channel
    AND (
      (Trial_Type != 'NT' AND Billing_Cycle_Updated = 0) 
      OR (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
    )
    AND (
      -- Handle CT-JP: App_Name = CT and Country = JP
      (b.App_Name = 'CT-JP' AND ss.App_Name = 'CT' AND ss.Spend_Country_Code_AFID = 'JP')
      -- Handle CT-Non-JP: App_Name = CT and Country != JP
      OR (b.App_Name = 'CT-Non-JP' AND ss.App_Name = 'CT' AND ss.Spend_Country_Code_AFID != 'JP')
      -- Handle all other apps: direct match
      OR (b.App_Name NOT IN ('CT-JP', 'CT-Non-JP') AND ss.App_Name = b.App_Name)
    )
  GROUP BY b.date, b.App_Name, b.Traffic_Channel
),

daily_metrics AS (
  -- Combine daily spend and daily new users by traffic channel
  SELECT 
    b.date,
    b.App_Name,
    b.Traffic_Channel,
    b.Entity,
    COALESCE(ds.Daily_Spend, 0) AS Daily_Spend,
    COALESCE(dsu.Sticky_User_Count, 0) - COALESCE(dssu.SS_User_Count, 0) AS Daily_New_Users
  FROM base_table b
  LEFT JOIN daily_spend ds 
    ON b.date = ds.date 
    AND b.App_Name = ds.App_Name
    AND b.Traffic_Channel = ds.Traffic_Channel
  LEFT JOIN daily_sticky_users dsu 
    ON b.date = dsu.date 
    AND b.App_Name = dsu.App_Name
    AND b.Traffic_Channel = dsu.Traffic_Channel
  LEFT JOIN daily_ss_users dssu 
    ON b.date = dssu.date 
    AND b.App_Name = dssu.App_Name
    AND b.Traffic_Channel = dssu.Traffic_Channel
),

daily_metrics_with_vg AS (
  -- Include all app-level data plus VG (sum of all apps by date + traffic channel)
  SELECT 
    date,
    App_Name,
    Traffic_Channel,
    Entity,
    Daily_Spend,
    Daily_New_Users
  FROM daily_metrics
  
  UNION ALL
  
  -- VG rows: sum of all apps by date + traffic channel
  SELECT 
    date,
    'VG' AS App_Name,
    Traffic_Channel,
    'VG' AS Entity,
    SUM(Daily_Spend) AS Daily_Spend,
    SUM(Daily_New_Users) AS Daily_New_Users
  FROM daily_metrics
  GROUP BY date, Traffic_Channel
),

trailing_7d AS (
  -- Calculate 7-day trailing metrics by traffic channel using window functions
  SELECT 
    date,
    App_Name,
    Traffic_Channel,
    Entity,
    Daily_Spend,
    Daily_New_Users,
    -- T7D Spend: average of daily spend over 7 days
    SUM(Daily_Spend) OVER (
      PARTITION BY App_Name, Traffic_Channel 
      ORDER BY UNIX_DATE(date)
      RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
    ) / 7 AS T7D_Spend,
    -- T7D Users: average of daily new users over 7 days
    SUM(Daily_New_Users) OVER (
      PARTITION BY App_Name, Traffic_Channel 
      ORDER BY UNIX_DATE(date)
      RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
    ) / 7 AS T7D_Users,
    -- T7D CAC: total spend / total users over 7 days
    CASE 
      WHEN SUM(Daily_New_Users) OVER (
        PARTITION BY App_Name, Traffic_Channel 
        ORDER BY UNIX_DATE(date)
        RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
      ) = 0 THEN NULL
      ELSE SUM(Daily_Spend) OVER (
        PARTITION BY App_Name, Traffic_Channel 
        ORDER BY UNIX_DATE(date)
        RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
      ) / NULLIF(SUM(Daily_New_Users) OVER (
        PARTITION BY App_Name, Traffic_Channel 
        ORDER BY UNIX_DATE(date)
        RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
      ), 0)
    END AS T7D_CAC
  FROM daily_metrics_with_vg
)

-- Final SELECT with all calculations
SELECT 
  date AS Date,
  App_Name,
  Entity,
  Traffic_Channel,
  Daily_Spend,
  Daily_New_Users,
  -- Daily CAC
  CASE 
    WHEN Daily_New_Users = 0 THEN NULL
    ELSE Daily_Spend / NULLIF(Daily_New_Users, 0)
  END AS Daily_CAC,
  T7D_Spend,
  T7D_Users,
  T7D_CAC
FROM trailing_7d
ORDER BY date, App_Name, Traffic_Channel;
