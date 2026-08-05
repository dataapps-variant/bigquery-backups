-- ============================================================================
-- CIT & MIT METRICS CALCULATION (USING MERGED TABLE)
-- ============================================================================
-- CIT = Initial Transaction Approval Rate (Billing_Cycle = 0)
-- MIT = Rebill Transaction Approval Rate (Billing_Cycle >= 1, Retry_Attempt = 0)
-- 
-- Approved = Final_Order_Status IN (2, 6)
-- Total    = Final_Order_Status IN (2, 6, 7)
-- 
-- App_Name = From merged table column
-- Report_Date = Date_Of_Sale
-- 
-- FILTERED: Only data from 2025-01-01 onwards
-- CIT/MIT displayed as percentages (e.g., 81.00%)
-- ============================================================================


-- ============================================================================
-- LEVEL 1: APP LEVEL METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Level_Metrics` AS

WITH base_transactions AS (
  -- Single source from merged table
  SELECT 
    App_Name, 
    Order_Id, 
    Final_Order_Status, 
    Billing_Cycle, 
    Retry_Attempt, 
    AFID, 
    Date_Of_Sale 
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged`
  WHERE Date_Of_Sale >= '2025-01-01'
),

enriched_transactions AS (
  SELECT
    t.Date_Of_Sale AS Report_Date,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    t.AFID,
    t.App_Name,
    -- Channel lookup (with Organic exception for afid_channel = 99)
    CASE 
      WHEN afid.afid_channel = 99 THEN 'Organic'
      WHEN afid.Channel_Name IS NULL THEN 'Unknown'
      ELSE afid.Channel_Name
    END AS Channel_Name,
    afid.afid_channel
  FROM base_transactions t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
)

SELECT
  Report_Date,
  App_Name,
  
  -- CIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS CIT_Percent,
  
  -- MIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS MIT_Percent

FROM enriched_transactions
GROUP BY Report_Date, App_Name
ORDER BY Report_Date, App_Name;


-- ============================================================================
-- LEVEL 2: APP + CHANNEL LEVEL METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Channel_Level_Metrics` AS

WITH base_transactions AS (
  -- Single source from merged table
  SELECT 
    App_Name, 
    Order_Id, 
    Final_Order_Status, 
    Billing_Cycle, 
    Retry_Attempt, 
    AFID, 
    Date_Of_Sale 
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged`
  WHERE Date_Of_Sale >= '2025-01-01'
),

enriched_transactions AS (
  SELECT
    t.Date_Of_Sale AS Report_Date,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    t.AFID,
    t.App_Name,
    -- Channel lookup (with Organic exception for afid_channel = 99)
    CASE 
      WHEN afid.afid_channel = 99 THEN 'Organic'
      WHEN afid.Channel_Name IS NULL THEN 'Unknown'
      ELSE afid.Channel_Name
    END AS Channel_Name,
    afid.afid_channel
  FROM base_transactions t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
)

SELECT
  Report_Date,
  App_Name,
  Channel_Name,
  
  -- CIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS CIT_Percent,
  
  -- MIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS MIT_Percent

FROM enriched_transactions
GROUP BY Report_Date, App_Name, Channel_Name
ORDER BY Report_Date, App_Name, Channel_Name;


-- ============================================================================
-- LEVEL 3: APP + CHANNEL + AFID LEVEL METRICS
-- ============================================================================
CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.App_Channel_AFID_Level_Metrics` AS

WITH base_transactions AS (
  -- Single source from merged table
  SELECT 
    App_Name, 
    Order_Id, 
    Final_Order_Status, 
    Billing_Cycle, 
    Retry_Attempt, 
    AFID, 
    Date_Of_Sale 
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged`
  WHERE Date_Of_Sale >= '2025-01-01'
),

enriched_transactions AS (
  SELECT
    t.Date_Of_Sale AS Report_Date,
    t.Order_Id,
    t.Final_Order_Status,
    SAFE_CAST(t.Billing_Cycle AS INT64) AS Billing_Cycle,
    SAFE_CAST(t.Retry_Attempt AS INT64) AS Retry_Attempt,
    t.AFID,
    t.App_Name,
    -- Channel lookup (with Organic exception for afid_channel = 99)
    CASE 
      WHEN afid.afid_channel = 99 THEN 'Organic'
      WHEN afid.Channel_Name IS NULL THEN 'Unknown'
      ELSE afid.Channel_Name
    END AS Channel_Name,
    afid.afid_channel
  FROM base_transactions t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` afid
    ON t.AFID = afid.AFID
)

SELECT
  Report_Date,
  App_Name,
  Channel_Name,
  COALESCE(AFID, 'Unknown') AS AFID,
  
  -- CIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
    THEN Order_Id 
  END) AS CIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS CIT_Percent,
  
  -- MIT Metrics
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Approved,
  
  COUNT(DISTINCT CASE 
    WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
    THEN Order_Id 
  END) AS MIT_Total,
  
  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END),
      COUNT(DISTINCT CASE 
        WHEN Final_Order_Status IN (2, 6, 7) AND Billing_Cycle >= 1 AND Retry_Attempt = 0 
        THEN Order_Id 
      END)
    ) * 100, 2
  ) AS MIT_Percent

FROM enriched_transactions
GROUP BY Report_Date, App_Name, Channel_Name, AFID
ORDER BY Report_Date, App_Name, Channel_Name, AFID;
