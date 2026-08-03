-- job_id: scheduled_query_6a7e324a-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:15:02.996000+00:00
-- started: 2026-07-31T08:15:03.407000+00:00
-- ended: 2026-07-31T08:15:06.672000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.CAC_By_Entity` AS

WITH date_range AS (
  -- Generate dates from 2025-01-01 to yesterday (2026-01-23)
  SELECT date
  FROM UNNEST(GENERATE_DATE_ARRAY('2025-01-01', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) AS date
),

app_names AS (
  -- Get unique App_Name and Entity from Daedalus Targets
  SELECT DISTINCT 
    App_Name, 
    Entity
  FROM `variant-finance-data-project.Daedalus.Daedalus_Targets`
),

base_table AS (
  -- Create cartesian product of all dates and all apps
  SELECT 
    d.date,
    a.App_Name,
    a.Entity
  FROM date_range d
  CROSS JOIN app_names a
),

daily_spend AS (
  -- Daily spend (single day, not cumulative)
  SELECT 
    b.date,
    b.App_Name,
    SUM(a.allocated_spend) AS Daily_Spend
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` a
    ON a.Date = b.date 
    AND a.App_Name = b.App_Name
  GROUP BY b.date, b.App_Name
),

daily_total_users AS (
  -- Daily count of unique Total users from Sticky data (new users only)
  SELECT 
    b.date,
    b.App_Name,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Daily_Total_Users
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON s.Date_of_Sale = b.date 
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
  GROUP BY b.date, b.App_Name
),

daily_ss_users AS (
  -- Daily count of unique SS users (new users only)
  SELECT 
    b.date,
    b.App_Name,
    COUNT(DISTINCT ss.Updated_Cust_ID) AS Daily_SS_Users
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON ss.Date_of_Sale = b.date 
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
  GROUP BY b.date, b.App_Name
),

daily_subscriptions AS (
  -- Daily count of unique Subscription/Renewal users from Sticky data
  SELECT 
    b.date,
    b.App_Name,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Daily_Subscriptions
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON s.Date_of_Sale = b.date 
    AND (
      (Trial_Type = 'NT' AND Billing_Cycle_Updated > 1) 
      OR (Trial_Type != 'NT' AND Billing_Cycle_Updated > 0)
    )
    AND (
      -- Handle CT-JP: App_Name = CT and Country = JP
      (b.App_Name = 'CT-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID = 'JP')
      -- Handle CT-Non-JP: App_Name = CT and Country != JP
      OR (b.App_Name = 'CT-Non-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID != 'JP')
      -- Handle all other apps: direct match
      OR (b.App_Name NOT IN ('CT-JP', 'CT-Non-JP') AND s.App_Name = b.App_Name)
    )
  GROUP BY b.date, b.App_Name
),

daily_metrics AS (
  -- Combine daily spend, daily total users, daily SS users, and daily subscriptions
  SELECT 
    b.date,
    b.App_Name,
    b.Entity,
    COALESCE(ds.Daily_Spend, 0) AS Daily_Spend,
    COALESCE(dtu.Daily_Total_Users, 0) AS Daily_Total_Users,
    COALESCE(dssu.Daily_SS_Users, 0) AS Daily_SS_Users,
    COALESCE(dtu.Daily_Total_Users, 0) - COALESCE(dssu.Daily_SS_Users, 0) AS Daily_New_Regular_Users,
    COALESCE(dsub.Daily_Subscriptions, 0) AS Daily_Subscriptions
  FROM base_table b
  LEFT JOIN daily_spend ds 
    ON b.date = ds.date AND b.App_Name = ds.App_Name
  LEFT JOIN daily_total_users dtu 
    ON b.date = dtu.date AND b.App_Name = dtu.App_Name
  LEFT JOIN daily_ss_users dssu 
    ON b.date = dssu.date AND b.App_Name = dssu.App_Name
  LEFT JOIN daily_subscriptions dsub 
    ON b.date = dsub.date AND b.App_Name = dsub.App_Name
),

trailing_7d AS (
  -- Calculate 7-day trailing metrics for individual apps
  SELECT 
    dm.date,
    dm.App_Name,
    dm.Entity,
    dm.Daily_Spend,
    dm.Daily_Total_Users,
    dm.Daily_SS_Users,
    dm.Daily_New_Regular_Users,
    dm.Daily_Subscriptions,
    -- T7D Spend: average of daily spend over 7 days
    SUM(dm2.Daily_Spend) / 7 AS T7D_Spend,
    -- T7D Users: average of daily new regular users over 7 days
    SUM(dm2.Daily_New_Regular_Users) / 7 AS T7D_Users,
    -- T7D CAC: total spend / total new regular users over 7 days
    CASE 
      WHEN SUM(dm2.Daily_New_Regular_Users) = 0 THEN NULL
      ELSE SUM(dm2.Daily_Spend) / NULLIF(SUM(dm2.Daily_New_Regular_Users), 0)
    END AS T7D_CAC
  FROM daily_metrics dm
  LEFT JOIN daily_metrics dm2
    ON dm2.App_Name = dm.App_Name
    AND dm2.date BETWEEN DATE_SUB(dm.date, INTERVAL 6 DAY) AND dm.date
  GROUP BY dm.date, dm.App_Name, dm.Entity, dm.Daily_Spend, dm.Daily_Total_Users, dm.Daily_SS_Users, dm.Daily_New_Regular_Users, dm.Daily_Subscriptions
),

vg_daily_metrics AS (
  -- Aggregate all apps by date to create VG (Variant Group) daily metrics
  SELECT 
    date,
    'VG' AS App_Name,
    'VG' AS Entity,
    SUM(Daily_Spend) AS Daily_Spend,
    SUM(Daily_Total_Users) AS Daily_Total_Users,
    SUM(Daily_SS_Users) AS Daily_SS_Users,
    SUM(Daily_New_Regular_Users) AS Daily_New_Regular_Users,
    SUM(Daily_Subscriptions) AS Daily_Subscriptions
  FROM daily_metrics
  GROUP BY date
),

vg_trailing_7d AS (
  -- Calculate 7-day trailing metrics for VG
  SELECT 
    vdm.date,
    vdm.App_Name,
    vdm.Entity,
    vdm.Daily_Spend,
    vdm.Daily_Total_Users,
    vdm.Daily_SS_Users,
    vdm.Daily_New_Regular_Users,
    vdm.Daily_Subscriptions,
    -- T7D Spend: average of VG daily spend over 7 days
    SUM(vdm2.Daily_Spend) / 7 AS T7D_Spend,
    -- T7D Users: average of VG daily new regular users over 7 days
    SUM(vdm2.Daily_New_Regular_Users) / 7 AS T7D_Users,
    -- T7D CAC: total VG spend / total VG new regular users over 7 days
    CASE 
      WHEN SUM(vdm2.Daily_New_Regular_Users) = 0 THEN NULL
      ELSE SUM(vdm2.Daily_Spend) / NULLIF(SUM(vdm2.Daily_New_Regular_Users), 0)
    END AS T7D_CAC
  FROM vg_daily_metrics vdm
  LEFT JOIN vg_daily_metrics vdm2
    ON vdm2.date BETWEEN DATE_SUB(vdm.date, INTERVAL 6 DAY) AND vdm.date
  GROUP BY vdm.date, vdm.App_Name, vdm.Entity, vdm.Daily_Spend, vdm.Daily_Total_Users, vdm.Daily_SS_Users, vdm.Daily_New_Regular_Users, vdm.Daily_Subscriptions
)

-- Final SELECT with all calculations - UNION individual apps with VG
SELECT 
  date AS Date,
  App_Name,
  Entity,
  Daily_Spend,
  Daily_Total_Users,
  Daily_SS_Users,
  Daily_New_Regular_Users,
  Daily_Subscriptions,
  -- Daily CAC (based on Daily New Regular Users)
  CASE 
    WHEN Daily_New_Regular_Users = 0 THEN NULL
    ELSE Daily_Spend / NULLIF(Daily_New_Regular_Users, 0)
  END AS Daily_CAC,
  T7D_Spend,
  T7D_Users,
  T7D_CAC
FROM trailing_7d

UNION ALL

SELECT 
  date AS Date,
  App_Name,
  Entity,
  Daily_Spend,
  Daily_Total_Users,
  Daily_SS_Users,
  Daily_New_Regular_Users,
  Daily_Subscriptions,
  -- Daily CAC (based on Daily New Regular Users)
  CASE 
    WHEN Daily_New_Regular_Users = 0 THEN NULL
    ELSE Daily_Spend / NULLIF(Daily_New_Regular_Users, 0)
  END AS Daily_CAC,
  T7D_Spend,
  T7D_Users,
  T7D_CAC
FROM vg_trailing_7d

ORDER BY Date, App_Name;
