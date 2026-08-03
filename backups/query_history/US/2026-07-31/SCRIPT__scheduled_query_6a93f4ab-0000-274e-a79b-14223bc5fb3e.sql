-- job_id: scheduled_query_6a93f4ab-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T08:15:02.188000+00:00
-- started: 2026-07-31T08:15:02.245000+00:00
-- ended: 2026-07-31T08:15:14.073000+00:00

-- ============================================================================
-- CIT & MIT DECLINE REASON ANALYSIS
-- ============================================================================
-- CIT Declines = Billing_Cycle = 0, Final_Order_Status = 7
-- MIT Declines = Billing_Cycle >= 1, Retry_Attempt = 0, Final_Order_Status = 7
-- 
-- Join Decline_Reason to Dim_Decline_Reasons to get Final_Category
-- Percentages = Category Count / Total Declines per grouping per Date
--
-- LEVEL 1: App_Name
-- LEVEL 2: App_Name + Channel_Name
-- LEVEL 3: App_Name + Channel_Name + AFID
-- ============================================================================


-- ============================================================================
-- LEVEL 1: APP LEVEL DECLINE REASON METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Decline_Reason_Metrics` AS

WITH base_declines AS (
  SELECT 
    t.Date_Of_Sale AS Report_Date,
    -- CT split into CT-JP and CT-Non-JP
    CASE 
      WHEN t.App_Name = 'CT' THEN 
        CASE 
          WHEN (
            CASE 
              WHEN afid.Country_Code IS NOT NULL THEN afid.Country_Code
              WHEN spend_valid.Country_Code IS NOT NULL THEN t.Spend_Country_Code
              ELSE 'OR'
            END
          ) = 'JP' THEN 'CT-JP'
          ELSE 'CT-Non-JP'
        END
      ELSE t.App_Name
    END AS App_Name,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    COALESCE(d.Final_Category, 'Unknown') AS Final_Category
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
  LEFT JOIN (
    SELECT DISTINCT Country_Code 
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
    WHERE Country_Code IS NOT NULL
  ) spend_valid
    ON t.Spend_Country_Code = spend_valid.Country_Code
  LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Reason_Final` d
    ON t.Decline_Reason = d.Decline_Reason
  WHERE t.Date_Of_Sale >= '2025-01-01'
    AND t.Final_Order_Status = 7
),

cit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS CIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name, Final_Category
),

mit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS MIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name, Final_Category
),

cit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    COUNT(DISTINCT Order_Id) AS CIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name
),

mit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    COUNT(DISTINCT Order_Id) AS MIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name
),

all_dimensions AS (
  SELECT DISTINCT Report_Date, App_Name, Final_Category
  FROM base_declines
)

SELECT
  a.Report_Date,
  a.App_Name,
  a.Final_Category,
  
  COALESCE(cit.CIT_Decline_Count, 0) AS CIT_Decline_Count,
  COALESCE(cit_t.CIT_Total_Declines, 0) AS CIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(cit.CIT_Decline_Count, 0),
      cit_t.CIT_Total_Declines
    ), 4
  ) AS CIT_Decline_Percent,
  
  COALESCE(mit.MIT_Decline_Count, 0) AS MIT_Decline_Count,
  COALESCE(mit_t.MIT_Total_Declines, 0) AS MIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(mit.MIT_Decline_Count, 0),
      mit_t.MIT_Total_Declines
    ), 4
  ) AS MIT_Decline_Percent

FROM all_dimensions a

LEFT JOIN cit_category_counts cit
  ON a.Report_Date = cit.Report_Date
  AND a.App_Name = cit.App_Name
  AND a.Final_Category = cit.Final_Category

LEFT JOIN mit_category_counts mit
  ON a.Report_Date = mit.Report_Date
  AND a.App_Name = mit.App_Name
  AND a.Final_Category = mit.Final_Category

LEFT JOIN cit_totals cit_t
  ON a.Report_Date = cit_t.Report_Date
  AND a.App_Name = cit_t.App_Name

LEFT JOIN mit_totals mit_t
  ON a.Report_Date = mit_t.Report_Date
  AND a.App_Name = mit_t.App_Name

ORDER BY Report_Date, App_Name, Final_Category;


-- ============================================================================
-- LEVEL 2: APP + CHANNEL LEVEL DECLINE REASON METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Channel_Decline_Reason_Metrics` AS

WITH base_declines AS (
  SELECT 
    t.Date_Of_Sale AS Report_Date,
    -- CT split into CT-JP and CT-Non-JP
    CASE 
      WHEN t.App_Name = 'CT' THEN 
        CASE 
          WHEN (
            CASE 
              WHEN afid.Country_Code IS NOT NULL THEN afid.Country_Code
              WHEN spend_valid.Country_Code IS NOT NULL THEN t.Spend_Country_Code
              ELSE 'OR'
            END
          ) = 'JP' THEN 'CT-JP'
          ELSE 'CT-Non-JP'
        END
      ELSE t.App_Name
    END AS App_Name,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    t.AFID,
    CASE 
      WHEN afid.afid_channel = 99 THEN 'Organic'
      WHEN afid.Channel_Name IS NULL THEN 'Unknown'
      ELSE afid.Channel_Name
    END AS Channel_Name,
    COALESCE(d.Final_Category, 'Unknown') AS Final_Category
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
  LEFT JOIN (
    SELECT DISTINCT Country_Code 
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
    WHERE Country_Code IS NOT NULL
  ) spend_valid
    ON t.Spend_Country_Code = spend_valid.Country_Code
  LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Reason_Final` d
    ON t.Decline_Reason = d.Decline_Reason
  WHERE t.Date_Of_Sale >= '2025-01-01'
    AND t.Final_Order_Status = 7
),

cit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS CIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name, Channel_Name, Final_Category
),

mit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS MIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name, Channel_Name, Final_Category
),

cit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    COUNT(DISTINCT Order_Id) AS CIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name, Channel_Name
),

mit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    COUNT(DISTINCT Order_Id) AS MIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name, Channel_Name
),

all_dimensions AS (
  SELECT DISTINCT Report_Date, App_Name, Channel_Name, Final_Category
  FROM base_declines
)

SELECT
  a.Report_Date,
  a.App_Name,
  a.Channel_Name,
  a.Final_Category,
  
  COALESCE(cit.CIT_Decline_Count, 0) AS CIT_Decline_Count,
  COALESCE(cit_t.CIT_Total_Declines, 0) AS CIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(cit.CIT_Decline_Count, 0),
      cit_t.CIT_Total_Declines
    ), 4
  ) AS CIT_Decline_Percent,
  
  COALESCE(mit.MIT_Decline_Count, 0) AS MIT_Decline_Count,
  COALESCE(mit_t.MIT_Total_Declines, 0) AS MIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(mit.MIT_Decline_Count, 0),
      mit_t.MIT_Total_Declines
    ), 4
  ) AS MIT_Decline_Percent

FROM all_dimensions a

LEFT JOIN cit_category_counts cit
  ON a.Report_Date = cit.Report_Date
  AND a.App_Name = cit.App_Name
  AND a.Channel_Name = cit.Channel_Name
  AND a.Final_Category = cit.Final_Category

LEFT JOIN mit_category_counts mit
  ON a.Report_Date = mit.Report_Date
  AND a.App_Name = mit.App_Name
  AND a.Channel_Name = mit.Channel_Name
  AND a.Final_Category = mit.Final_Category

LEFT JOIN cit_totals cit_t
  ON a.Report_Date = cit_t.Report_Date
  AND a.App_Name = cit_t.App_Name
  AND a.Channel_Name = cit_t.Channel_Name

LEFT JOIN mit_totals mit_t
  ON a.Report_Date = mit_t.Report_Date
  AND a.App_Name = mit_t.App_Name
  AND a.Channel_Name = mit_t.Channel_Name

ORDER BY Report_Date, App_Name, Channel_Name, Final_Category;


-- ============================================================================
-- LEVEL 3: APP + CHANNEL + AFID LEVEL DECLINE REASON METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Channel_AFID_Decline_Reason_Metrics` AS

WITH base_declines AS (
  SELECT 
    t.Date_Of_Sale AS Report_Date,
    -- CT split into CT-JP and CT-Non-JP
    CASE 
      WHEN t.App_Name = 'CT' THEN 
        CASE 
          WHEN (
            CASE 
              WHEN afid.Country_Code IS NOT NULL THEN afid.Country_Code
              WHEN spend_valid.Country_Code IS NOT NULL THEN t.Spend_Country_Code
              ELSE 'OR'
            END
          ) = 'JP' THEN 'CT-JP'
          ELSE 'CT-Non-JP'
        END
      ELSE t.App_Name
    END AS App_Name,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    COALESCE(t.AFID, 'Unknown') AS AFID,
    CASE 
      WHEN afid.afid_channel = 99 THEN 'Organic'
      WHEN afid.Channel_Name IS NULL THEN 'Unknown'
      ELSE afid.Channel_Name
    END AS Channel_Name,
    COALESCE(d.Final_Category, 'Unknown') AS Final_Category
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL` t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
  LEFT JOIN (
    SELECT DISTINCT Country_Code 
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID`
    WHERE Country_Code IS NOT NULL
  ) spend_valid
    ON t.Spend_Country_Code = spend_valid.Country_Code
  LEFT JOIN `variant-finance-data-project.Daedalus.Decline_Reason_Final` d
    ON t.Decline_Reason = d.Decline_Reason
  WHERE t.Date_Of_Sale >= '2025-01-01'
    AND t.Final_Order_Status = 7
),

cit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    AFID,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS CIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name, Channel_Name, AFID, Final_Category
),

mit_category_counts AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    AFID,
    Final_Category,
    COUNT(DISTINCT Order_Id) AS MIT_Decline_Count
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name, Channel_Name, AFID, Final_Category
),

cit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    AFID,
    COUNT(DISTINCT Order_Id) AS CIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle = 0
  GROUP BY Report_Date, App_Name, Channel_Name, AFID
),

mit_totals AS (
  SELECT
    Report_Date,
    App_Name,
    Channel_Name,
    AFID,
    COUNT(DISTINCT Order_Id) AS MIT_Total_Declines
  FROM base_declines
  WHERE Billing_Cycle >= 1 AND Retry_Attempt = 0
  GROUP BY Report_Date, App_Name, Channel_Name, AFID
),

all_dimensions AS (
  SELECT DISTINCT Report_Date, App_Name, Channel_Name, AFID, Final_Category
  FROM base_declines
)

SELECT
  a.Report_Date,
  a.App_Name,
  a.Channel_Name,
  a.AFID,
  a.Final_Category,
  
  COALESCE(cit.CIT_Decline_Count, 0) AS CIT_Decline_Count,
  COALESCE(cit_t.CIT_Total_Declines, 0) AS CIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(cit.CIT_Decline_Count, 0),
      cit_t.CIT_Total_Declines
    ), 4
  ) AS CIT_Decline_Percent,
  
  COALESCE(mit.MIT_Decline_Count, 0) AS MIT_Decline_Count,
  COALESCE(mit_t.MIT_Total_Declines, 0) AS MIT_Total_Declines,
  ROUND(
    SAFE_DIVIDE(
      COALESCE(mit.MIT_Decline_Count, 0),
      mit_t.MIT_Total_Declines
    ), 4
  ) AS MIT_Decline_Percent

FROM all_dimensions a

LEFT JOIN cit_category_counts cit
  ON a.Report_Date = cit.Report_Date
  AND a.App_Name = cit.App_Name
  AND a.Channel_Name = cit.Channel_Name
  AND a.AFID = cit.AFID
  AND a.Final_Category = cit.Final_Category

LEFT JOIN mit_category_counts mit
  ON a.Report_Date = mit.Report_Date
  AND a.App_Name = mit.App_Name
  AND a.Channel_Name = mit.Channel_Name
  AND a.AFID = mit.AFID
  AND a.Final_Category = mit.Final_Category

LEFT JOIN cit_totals cit_t
  ON a.Report_Date = cit_t.Report_Date
  AND a.App_Name = cit_t.App_Name
  AND a.Channel_Name = cit_t.Channel_Name
  AND a.AFID = cit_t.AFID

LEFT JOIN mit_totals mit_t
  ON a.Report_Date = mit_t.Report_Date
  AND a.App_Name = mit_t.App_Name
  AND a.Channel_Name = mit_t.Channel_Name
  AND a.AFID = mit_t.AFID

ORDER BY Report_Date, App_Name, Channel_Name, AFID, Final_Category;
