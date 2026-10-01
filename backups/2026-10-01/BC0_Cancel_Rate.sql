CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.BC0_Cancel_Rate` AS
WITH daily_data AS (
  SELECT 
    report_date, 
    app_name, 
    COUNT(1) AS orders, 
    COUNTIF(hold_date <= report_date + 1) AS cancels,
    COUNTIF(hold_date IS NULL) AS no_cancel,
    COUNTIF(hold_date > report_date + 1) AS cancelled_after_24h
  FROM (
    SELECT 
      Date_of_Sale AS report_date, 
      CASE 
        WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' 
        THEN 'CT - JP' 
        ELSE 'CT - US' 
      END AS app_name, 
      CASE 
        WHEN Hold_Date = '' THEN NULL 
        ELSE DATE(Hold_Date) 
      END AS hold_date
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
    WHERE Date_of_Sale BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 96 DAY) AND DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
      AND Final_Order_Status <> 7
      AND Billing_Cycle = '0'
      AND App_Name = 'CT'
      AND Trial_Type != 'SS'
      AND COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP'
  ) AS o
  GROUP BY report_date, app_name
  ORDER BY report_date DESC
),

rolling AS (
  SELECT
    report_date,
    orders,
    cancels,
    no_cancel,
    cancelled_after_24h,
    ROUND(SAFE_DIVIDE(cancels, orders) * 100, 2) AS daily_cancel_pct,
    SUM(orders) OVER (
      ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_orders,
    SUM(cancels) OVER (
      ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
    ) AS t7d_cancels,
    ROUND(SAFE_DIVIDE(
      SUM(cancels) OVER (
        ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      ),
      SUM(orders) OVER (
        ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING
      )
    ) * 100, 4) AS t7d_cancel_rate
  FROM daily_data
)

SELECT 
  report_date,
  orders,
  cancels,
  no_cancel,
  cancelled_after_24h,
  daily_cancel_pct,
  t7d_orders,
  t7d_cancels,
  t7d_cancel_rate,
  CASE 
    WHEN t7d_cancel_rate = MAX(t7d_cancel_rate) OVER () THEN '← ABSOLUTE HIGH'
    ELSE ''
  END AS is_highest
FROM rolling
WHERE report_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
  AND t7d_orders > 50
ORDER BY report_date ASC
