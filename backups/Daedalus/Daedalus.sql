CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Daedalus` AS

WITH date_range AS (
  -- Generate dates from 2026-01-01 to yesterday (2026-01-23)
  SELECT date
  FROM UNNEST(GENERATE_DATE_ARRAY('2026-01-01', DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY))) AS date
),

app_names AS (
  -- Get unique App_Name and Entity from Daedalus_Targets
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

actual_spend AS (
  -- Cumulative sum of allocated_spend by Date and App_Name (MTD)
  SELECT 
    b.date,
    b.App_Name,
    SUM(a.allocated_spend) AS Actual_Spend_MTD
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` a
    ON a.Date <= b.date 
    AND a.Date >= DATE_TRUNC(b.date, MONTH)
    AND a.App_Name = b.App_Name
  GROUP BY b.date, b.App_Name
),

target_spend AS (
  -- Cumulative sum of Spend_Target and New_User_Target by Date and App_Name (MTD)
  SELECT 
    b.date,
    b.App_Name,
    SUM(t.Spend_Target) AS Target_Spend_MTD,
    SUM(t.New_User_Target) AS Target_New_Users_MTD
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Daedalus.Daedalus_Targets` t
    ON t.Date <= b.date 
    AND t.Date >= DATE_TRUNC(b.date, MONTH)
    AND t.App_Name = b.App_Name
  GROUP BY b.date, b.App_Name
),

sticky_users AS (
  -- Count unique users from Sticky data with conditions and CT-JP/CT-Non-JP logic (MTD)
  SELECT 
    b.date,
    b.App_Name,
    COUNT(DISTINCT s.Updated_Cust_ID) AS Sticky_User_Count_MTD
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
    ON s.Date_of_Sale <= b.date 
    AND s.Date_of_Sale >= DATE_TRUNC(b.date, MONTH)
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

ss_users AS (
  -- Count unique users from SS data with conditions and CT-JP/CT-Non-JP logic (MTD)
  SELECT 
    b.date,
    b.App_Name,
    COUNT(DISTINCT ss.Updated_Cust_ID) AS SS_User_Count_MTD
  FROM base_table b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON ss.Date_of_Sale <= b.date 
    AND ss.Date_of_Sale >= DATE_TRUNC(b.date, MONTH)
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
)

-- Final SELECT with all calculations
SELECT 
  b.date AS Date,
  b.App_Name,
  b.Entity,
  COALESCE(a.Actual_Spend_MTD, 0) AS Actual_Spend_MTD,
  COALESCE(t.Target_Spend_MTD, 0) AS Target_Spend_MTD,
  COALESCE(t.Target_Spend_MTD, 0) - COALESCE(a.Actual_Spend_MTD, 0) AS Delta_Spend,
  COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0) AS Actual_New_Users_MTD,
  COALESCE(t.Target_New_Users_MTD, 0) AS Target_New_Users_MTD,
  COALESCE(t.Target_New_Users_MTD, 0) - (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)) AS Delta_Users,
  -- Delta Spend % = Delta Spend / Target Spend (MTD)
  CASE 
    WHEN COALESCE(t.Target_Spend_MTD, 0) = 0 THEN NULL
    ELSE (COALESCE(t.Target_Spend_MTD, 0) - COALESCE(a.Actual_Spend_MTD, 0)) / COALESCE(t.Target_Spend_MTD, 0)
  END AS Delta_Spend_Percent,
  -- Delta Users % = Delta Users / Target New Users (MTD)
  CASE 
    WHEN COALESCE(t.Target_New_Users_MTD, 0) = 0 THEN NULL
    ELSE (COALESCE(t.Target_New_Users_MTD, 0) - (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0))) / COALESCE(t.Target_New_Users_MTD, 0)
  END AS Delta_Users_Percent,
  -- Actual CAC = Actual Spend / Actual New Users
  CASE 
    WHEN (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)) = 0 THEN NULL
    ELSE COALESCE(a.Actual_Spend_MTD, 0) / (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0))
  END AS Actual_CAC,
  -- Target CAC = Target Spend / Target New Users
  CASE 
    WHEN COALESCE(t.Target_New_Users_MTD, 0) = 0 THEN NULL
    ELSE COALESCE(t.Target_Spend_MTD, 0) / COALESCE(t.Target_New_Users_MTD, 0)
  END AS Target_CAC,
  -- Delta CAC = Target CAC - Actual CAC
  CASE 
    WHEN COALESCE(t.Target_New_Users_MTD, 0) = 0 OR (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)) = 0 THEN NULL
    ELSE (COALESCE(t.Target_Spend_MTD, 0) / COALESCE(t.Target_New_Users_MTD, 0)) - (COALESCE(a.Actual_Spend_MTD, 0) / (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)))
  END AS Delta_CAC,
  -- Delta CAC % = Delta CAC / Target CAC
  CASE 
    WHEN COALESCE(t.Target_New_Users_MTD, 0) = 0 OR (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)) = 0 THEN NULL
    WHEN (COALESCE(t.Target_Spend_MTD, 0) / COALESCE(t.Target_New_Users_MTD, 0)) = 0 THEN NULL
    ELSE ((COALESCE(t.Target_Spend_MTD, 0) / COALESCE(t.Target_New_Users_MTD, 0)) - (COALESCE(a.Actual_Spend_MTD, 0) / (COALESCE(s.Sticky_User_Count_MTD, 0) - COALESCE(ss.SS_User_Count_MTD, 0)))) / (COALESCE(t.Target_Spend_MTD, 0) / COALESCE(t.Target_New_Users_MTD, 0))
  END AS Delta_CAC_Percent
FROM base_table b
LEFT JOIN actual_spend a 
  ON b.date = a.date AND b.App_Name = a.App_Name
LEFT JOIN target_spend t 
  ON b.date = t.date AND b.App_Name = t.App_Name
LEFT JOIN sticky_users s 
  ON b.date = s.date AND b.App_Name = s.App_Name
LEFT JOIN ss_users ss 
  ON b.date = ss.date AND b.App_Name = ss.App_Name
ORDER BY b.date, b.App_Name;
