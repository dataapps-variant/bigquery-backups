CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Daily_Report_All` AS
WITH 
sticky_daily AS (
  SELECT
    DATE(Date_of_Sale) AS report_date,
    App_Name,
    Entity_Name,
    COUNT(DISTINCT CASE 
      WHEN Trial_Type = 'NT' AND CAST(Billing_Cycle AS STRING) = '1' 
      THEN Updated_Order_ID 
    END) AS nt_bc1_users,
    COUNT(DISTINCT CASE 
      WHEN (Trial_Type IS NULL OR Trial_Type <> 'NT') AND CAST(Billing_Cycle AS STRING) = '0' 
      THEN Updated_Order_ID 
    END) AS non_nt_bc0_users,
    COALESCE(SUM(Order_Price_Net_of_Tax_USD), 0) AS total_revenue,
    COALESCE(SUM(CASE 
      WHEN CAST(AFID_CHANNEL AS STRING) = '99' 
      THEN Order_Price_Net_of_Tax_USD 
    END), 0) AS organic_revenue
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale IS NOT NULL
  GROUP BY 1, 2, 3
),

sticky_with_7d AS (
  SELECT
    report_date,
    App_Name,
    Entity_Name,
    nt_bc1_users + non_nt_bc0_users AS new_users_total,
    total_revenue,
    organic_revenue,
    AVG(nt_bc1_users + non_nt_bc0_users) OVER (
      PARTITION BY App_Name, Entity_Name 
      ORDER BY report_date 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS t7d_users
  FROM sticky_daily
),

spend_daily AS (
  SELECT
    DATE(Date) AS report_date,
    App_Name,
    COALESCE(SUM(Amount), 0) AS daily_spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  WHERE Date IS NOT NULL
  GROUP BY 1, 2
),

spend_with_7d AS (
  SELECT
    report_date,
    App_Name,
    daily_spend,
    SUM(daily_spend) OVER (
      PARTITION BY App_Name 
      ORDER BY report_date 
      ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) / 7 AS t7d_spend
  FROM spend_daily
),

-- SS users & revenue strictly from Billing_Cycle = 0
ss_metrics AS (
  SELECT
    DATE(Date_of_Sale) AS report_date,
    App_Name,
    Entity_Name,
    COUNT(DISTINCT Order_Id) AS ss_user_count,
    COALESCE(SUM(Order_Price_Net_of_Tax_USD), 0) AS ss_revenue
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  WHERE Date_of_Sale IS NOT NULL
    AND CAST(Billing_Cycle AS STRING) = '0'
  GROUP BY 1, 2, 3
)

SELECT
  sd.report_date,
  sd.App_Name,
  sd.Entity_Name,
  sd.new_users_total,
  COALESCE(ss.ss_user_count, 0) AS new_users_ss,
  sd.new_users_total - COALESCE(ss.ss_user_count, 0) AS new_users_regular,
  ROUND(sd.t7d_users, 2) AS t7d_users,
  COALESCE(sp.daily_spend, 0) AS daily_spend,
  ROUND(COALESCE(sp.t7d_spend, 0), 2) AS t7d_spend,
  ROUND(SAFE_DIVIDE(sp.daily_spend, sd.new_users_total - COALESCE(ss.ss_user_count, 0)), 2) AS daily_cac,
  ROUND(SAFE_DIVIDE(ss.ss_user_count, NULLIF(sd.new_users_total, 0)), 4) AS ss_users_pct,
  ROUND(SAFE_DIVIDE(ss.ss_revenue, NULLIF(sd.total_revenue, 0)), 4) AS ss_rev_pct,
  ROUND(SAFE_DIVIDE(sd.organic_revenue, NULLIF(sd.total_revenue, 0)), 4) AS org_rev_pct
FROM sticky_with_7d sd
LEFT JOIN spend_with_7d sp
  ON sd.report_date = sp.report_date
  AND sd.App_Name = sp.App_Name
LEFT JOIN ss_metrics ss
  ON sd.report_date = ss.report_date
  AND sd.App_Name = ss.App_Name
  AND sd.Entity_Name = ss.Entity_Name
ORDER BY sd.report_date DESC, sd.App_Name, sd.Entity_Name;
