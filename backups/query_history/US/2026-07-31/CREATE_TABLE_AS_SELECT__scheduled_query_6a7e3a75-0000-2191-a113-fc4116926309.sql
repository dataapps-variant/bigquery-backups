-- job_id: scheduled_query_6a7e3a75-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:25:01.928000+00:00
-- started: 2026-07-31T08:25:02.292000+00:00
-- ended: 2026-07-31T08:25:45.887000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.Active_Subscriptions` AS

WITH 
-- Generate date series from Jan 1, 2025 to current date
date_series AS (
  SELECT date_value AS Date
  FROM UNNEST(
    GENERATE_DATE_ARRAY('2025-01-01', CURRENT_DATE())
  ) AS date_value
),

-- Get all unique App_Name and AFID_CHANNEL combinations from Active_Users_List
app_channel_combinations AS (
  SELECT DISTINCT
    App_Name,
    AFID_CHANNEL
  FROM `variant-finance-data-project.Daedalus.Active_Users_List`
  WHERE App_Name IS NOT NULL AND AFID_CHANNEL IS NOT NULL
),

-- Create base dimension table with all Date x App_Name x AFID_CHANNEL combinations
base_dimensions AS (
  SELECT
    ds.Date,
    acc.App_Name,
    acc.AFID_CHANNEL
  FROM date_series ds
  CROSS JOIN app_channel_combinations acc
),

-- ✅ CHANGED: Active_Subscription_30_Days_Ago from Active_Users_List
-- Sum Active_Users for Date - 29 days across all BC values
active_30_days_ago AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COALESCE(SUM(aul.Active_Users), 0) AS Active_Subscription_30_Days_Ago
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Daedalus.Active_Users_List` aul
    ON  aul.Date        = DATE_SUB(bd.Date, INTERVAL 29 DAY)
    AND aul.App_Name    = bd.App_Name
    AND aul.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- Calculate Cancelled Subscriptions (Voluntary) - refunds and chargebacks within 30 days
cancelled_voluntary AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COUNT(DISTINCT CASE 
      WHEN (sd.Final_Order_Status = 6 AND sd.Refund_Date BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date)
           OR (sd.Is_Chargeback = '1' AND SAFE.PARSE_DATE('%Y-%m-%d', SUBSTR(sd.Chargeback_Date, 1, 10)) BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date)
      THEN sd.Updated_Cust_ID
    END) AS Cancelled_Subscription_Voluntary
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sd
    ON ((sd.Final_Order_Status = 6 AND sd.Refund_Date BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date)
       OR (sd.Is_Chargeback = '1' AND SAFE.PARSE_DATE('%Y-%m-%d', SUBSTR(sd.Chargeback_Date, 1, 10)) BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date))
    AND sd.App_Name = bd.App_Name
    AND sd.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- Calculate Ended Subscriptions (Involuntary) - last active between 60 and 30 days ago
ended_involuntary AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COALESCE(SUM(ies.Involuntary_Ended_Subs), 0) AS Ended_Subscription_Involuntary
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Daedalus.Involuntary_Ended_Subscriptions` ies
    ON  ies.Date         = bd.Date
    AND ies.App_Name     = bd.App_Name
    AND ies.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- Calculate T30 Day New Subscriptions
t30_new_subscriptions AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COUNT(DISTINCT CASE
      WHEN (sd.Trial_Type = 'NT' AND sd.Billing_Cycle_Updated = 1)
           OR (sd.Trial_Type != 'NT' AND sd.Billing_Cycle_Updated = 0)
      THEN sd.Updated_Cust_ID
    END) AS T30_Day_New_Subscriptions
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sd
    ON sd.Date_of_Sale BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date
    AND sd.App_Name = bd.App_Name
    AND sd.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- ✅ CHANGED: Current_Active_Subscription from Active_Users_List
-- Sum Active_Users for bd.Date across all BC values
current_active AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COALESCE(SUM(aul.Active_Users), 0) AS Current_Active_Subscription
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Daedalus.Active_Users_List` aul
    ON  aul.Date         = bd.Date
    AND aul.App_Name     = bd.App_Name
    AND aul.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- ✅ CHANGED: Current_Pending_Subscriptions from Retry_Engine_Users_List
-- Sum Retry_Users for bd.Date across all BC values
current_pending AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COALESCE(SUM(re.Retry_Users), 0) AS Current_Pending_Subscriptions
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Daedalus.Retry_Engine_Users_List` re
    ON  re.Date         = bd.Date
    AND re.App_Name     = bd.App_Name
    AND re.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- Calculate T30 Day New SS Orders
t30_new_ss_orders AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COUNT(DISTINCT CASE
      WHEN sd.Trial_Type = 'SS' AND sd.Billing_Cycle_Updated = 0
      THEN sd.Updated_Cust_ID
    END) AS T30_Day_New_SS_Orders
  FROM base_dimensions bd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` sd
    ON sd.Date_of_Sale BETWEEN DATE_SUB(bd.Date, INTERVAL 30 DAY) AND bd.Date
    AND sd.App_Name = bd.App_Name
    AND sd.AFID_CHANNEL = bd.AFID_CHANNEL
  GROUP BY bd.Date, bd.App_Name, bd.AFID_CHANNEL
),

-- Combine all metrics into base result
base_result AS (
  SELECT
    bd.Date,
    bd.App_Name,
    bd.AFID_CHANNEL,
    COALESCE(a30.Active_Subscription_30_Days_Ago, 0)        AS Active_Subscription_30_Days_Ago,
    COALESCE(cv.Cancelled_Subscription_Voluntary, 0)         AS Cancelled_Subscription_Orders_Voluntary,
    COALESCE(ei.Ended_Subscription_Involuntary, 0)           AS Ended_Subscriptions_Involuntary,
    COALESCE(cv.Cancelled_Subscription_Voluntary, 0) + COALESCE(ei.Ended_Subscription_Involuntary, 0) AS Total_Lost_Subscriptions,
    CASE 
      WHEN COALESCE(a30.Active_Subscription_30_Days_Ago, 0) = 0 THEN 0
      ELSE ROUND(
        (COALESCE(cv.Cancelled_Subscription_Voluntary, 0) + COALESCE(ei.Ended_Subscription_Involuntary, 0)) * 100.0 
        / a30.Active_Subscription_30_Days_Ago, 
        2
      )
    END AS Churn_Rate_Percent,
    COALESCE(t30ns.T30_Day_New_Subscriptions, 0)             AS T30_Day_New_Subscriptions,
    COALESCE(ca.Current_Active_Subscription, 0)              AS Current_Active_Subscription,
    COALESCE(cp.Current_Pending_Subscriptions, 0)            AS Current_Pending_Subscriptions,
    CASE 
      WHEN COALESCE(ca.Current_Active_Subscription, 0) = 0 THEN 0
      ELSE ROUND(
        COALESCE(cp.Current_Pending_Subscriptions, 0) * 100.0 
        / ca.Current_Active_Subscription, 
        2
      )
    END AS Pending_Subscriptions_Percent,
    COALESCE(t30ss.T30_Day_New_SS_Orders, 0)                 AS T30_Day_New_SS_Orders,
    CASE 
      WHEN COALESCE(t30ns.T30_Day_New_Subscriptions, 0) = 0 THEN 0
      ELSE ROUND(
        COALESCE(t30ss.T30_Day_New_SS_Orders, 0) * 100.0 
        / t30ns.T30_Day_New_Subscriptions, 
        2
      )
    END AS SS_Orders_Percent
  FROM base_dimensions bd
  LEFT JOIN active_30_days_ago a30 
    ON bd.Date = a30.Date AND bd.App_Name = a30.App_Name AND bd.AFID_CHANNEL = a30.AFID_CHANNEL
  LEFT JOIN cancelled_voluntary cv 
    ON bd.Date = cv.Date AND bd.App_Name = cv.App_Name AND bd.AFID_CHANNEL = cv.AFID_CHANNEL
  LEFT JOIN ended_involuntary ei 
    ON bd.Date = ei.Date AND bd.App_Name = ei.App_Name AND bd.AFID_CHANNEL = ei.AFID_CHANNEL
  LEFT JOIN t30_new_subscriptions t30ns
    ON bd.Date = t30ns.Date AND bd.App_Name = t30ns.App_Name AND bd.AFID_CHANNEL = t30ns.AFID_CHANNEL
  LEFT JOIN current_active ca 
    ON bd.Date = ca.Date AND bd.App_Name = ca.App_Name AND bd.AFID_CHANNEL = ca.AFID_CHANNEL
  LEFT JOIN current_pending cp
    ON bd.Date = cp.Date AND bd.App_Name = cp.App_Name AND bd.AFID_CHANNEL = cp.AFID_CHANNEL
  LEFT JOIN t30_new_ss_orders t30ss
    ON bd.Date = t30ss.Date AND bd.App_Name = t30ss.App_Name AND bd.AFID_CHANNEL = t30ss.AFID_CHANNEL
)

-- Final SELECT with T30D rolling sums via self-join
SELECT
  br.Date,
  br.App_Name,
  br.AFID_CHANNEL,
  br.Active_Subscription_30_Days_Ago,
  br.Cancelled_Subscription_Orders_Voluntary,
  br.Ended_Subscriptions_Involuntary,
  br.Total_Lost_Subscriptions,
  br.Churn_Rate_Percent,
  br.T30_Day_New_Subscriptions,
  br.Current_Active_Subscription,
  br.Current_Pending_Subscriptions,
  br.Pending_Subscriptions_Percent,
  br.T30_Day_New_SS_Orders,
  br.SS_Orders_Percent,
  COALESCE(t30d.T30D_Current_Active_Subscription, 0)    AS T30D_Current_Active_Subscription,
  COALESCE(t30d.T30D_Current_Pending_Subscriptions, 0)  AS T30D_Current_Pending_Subscriptions
FROM base_result br
LEFT JOIN (
  SELECT
    b1.Date,
    b1.App_Name,
    b1.AFID_CHANNEL,
    SUM(b2.Current_Active_Subscription)   AS T30D_Current_Active_Subscription,
    SUM(b2.Current_Pending_Subscriptions) AS T30D_Current_Pending_Subscriptions
  FROM base_result b1
  INNER JOIN base_result b2
    ON  b2.App_Name     = b1.App_Name
    AND b2.AFID_CHANNEL = b1.AFID_CHANNEL
    AND b2.Date BETWEEN DATE_SUB(b1.Date, INTERVAL 29 DAY) AND b1.Date
  GROUP BY b1.Date, b1.App_Name, b1.AFID_CHANNEL
) t30d
  ON  br.Date         = t30d.Date
  AND br.App_Name     = t30d.App_Name
  AND br.AFID_CHANNEL = t30d.AFID_CHANNEL
ORDER BY br.Date, br.App_Name, br.AFID_CHANNEL;
