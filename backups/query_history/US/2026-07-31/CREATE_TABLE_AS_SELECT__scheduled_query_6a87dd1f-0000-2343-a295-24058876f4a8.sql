-- job_id: scheduled_query_6a87dd1f-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:15:04.902000+00:00
-- started: 2026-07-31T08:15:05.277000+00:00
-- ended: 2026-07-31T08:15:08.316000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.AFID_Unknown` AS

WITH date_range AS (
  -- Generate dates from 2026-01-01 to yesterday (2026-01-23)
  SELECT date
  FROM UNNEST(GENERATE_DATE_ARRAY('2026-01-01', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) AS date
),

app_names AS (
  -- Get unique App_Name and Entity from Daedalus Targets
  SELECT DISTINCT 
    App_Name, 
    Entity
  FROM `variant-finance-data-project.Daedalus.Daedalus_Targets`
),

-- Get unique AFIDs from Sticky data for each app with CT-JP/CT-Non-JP logic
afid_by_app AS (
  SELECT DISTINCT
    'CT-JP' AS App_Name,
    AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' AND AFID IS NOT NULL
  
  UNION ALL
  
  SELECT DISTINCT
    'CT-Non-JP' AS App_Name,
    AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' AND AFID IS NOT NULL
  
  UNION ALL
  
  SELECT DISTINCT
    App_Name,
    AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE App_Name NOT IN ('CT') AND AFID IS NOT NULL
),

base_table AS (
  -- Create cartesian product of all dates, apps, and their respective AFIDs
  SELECT 
    d.date,
    a.App_Name,
    a.Entity,
    af.AFID
  FROM date_range d
  CROSS JOIN app_names a
  LEFT JOIN afid_by_app af
    ON a.App_Name = af.App_Name
),

sticky_users_daily AS (
  -- Count unique users from Sticky data for each specific date (daily, not cumulative)
  SELECT 
    b.date,
    b.App_Name,
    b.AFID,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Sticky_User_Count_Daily
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON s.Date_of_Sale = b.date
    AND s.AFID = b.AFID
    AND (
      (s.Trial_Type != 'NT' AND s.Billing_Cycle_Updated = 0) 
      OR (s.Trial_Type = 'NT' AND s.Billing_Cycle_Updated = 1)
    )
    AND (
      -- Handle CT-JP: App_Name = CT and Country = JP
      (b.App_Name = 'CT-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID = 'JP')
      -- Handle CT-Non-JP: App_Name = CT and Country != JP
      OR (b.App_Name = 'CT-Non-JP' AND s.App_Name = 'CT' AND s.Spend_Country_Code_AFID != 'JP')
      -- Handle all other apps: direct match
      OR (b.App_Name NOT IN ('CT-JP', 'CT-Non-JP') AND s.App_Name = b.App_Name)
    )
  GROUP BY b.date, b.App_Name, b.AFID
),

ss_users_daily AS (
  -- Count unique users from SS data for each specific date (daily, not cumulative)
  SELECT 
    b.date,
    b.App_Name,
    b.AFID,
    COUNT(DISTINCT ss.Updated_Cust_ID) AS SS_User_Count_Daily
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON ss.Date_of_Sale = b.date
    AND ss.AFID = b.AFID
    AND (
      (ss.Trial_Type != 'NT' AND ss.Billing_Cycle_Updated = 0) 
      OR (ss.Trial_Type = 'NT' AND ss.Billing_Cycle_Updated = 1)
    )
    AND (
      -- Handle CT-JP: App_Name = CT and Country = JP
      (b.App_Name = 'CT-JP' AND ss.App_Name = 'CT' AND ss.Spend_Country_Code_AFID = 'JP')
      -- Handle CT-Non-JP: App_Name = CT and Country != JP
      OR (b.App_Name = 'CT-Non-JP' AND ss.App_Name = 'CT' AND ss.Spend_Country_Code_AFID != 'JP')
      -- Handle all other apps: direct match
      OR (b.App_Name NOT IN ('CT-JP', 'CT-Non-JP') AND ss.App_Name = b.App_Name)
    )
  GROUP BY b.date, b.App_Name, b.AFID
)

-- Final SELECT with only required columns
SELECT 
  b.date AS Date,
  b.App_Name,
  b.Entity,
  b.AFID,
  COALESCE(s.Sticky_User_Count_Daily, 0) - COALESCE(ss.SS_User_Count_Daily, 0) AS New_Users
FROM base_table b
LEFT JOIN sticky_users_daily s 
  ON b.date = s.date AND b.App_Name = s.App_Name AND b.AFID = s.AFID
LEFT JOIN ss_users_daily ss 
  ON b.date = ss.date AND b.App_Name = ss.App_Name AND b.AFID = ss.AFID
ORDER BY b.date, b.App_Name, b.AFID;
