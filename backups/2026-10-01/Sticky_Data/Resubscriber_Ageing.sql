DECLARE cohort_start DATE DEFAULT '2025-01-01';
DECLARE cohort_end   DATE DEFAULT '2026-07-31';
DECLARE data_cutoff  DATE DEFAULT CURRENT_DATE();

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Resubscriber_Ageing` AS

WITH bc0_orders AS (
  -- One row per BC0 order. The GROUP BY collapses product-line and quantity
  -- rows so we don't count one order as several purchases.
  SELECT
    App_Name,
    Customer_Number,
    Order_Id,
    Date_of_Sale,
    MAX(COALESCE(NULLIF(TRIM(Ancestor_Order_Id), ''), Order_Id)) AS chain_key
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle = '0'
    AND App_Name IS NOT NULL
    AND Customer_Number IS NOT NULL
    AND TRIM(Customer_Number) <> ''
    AND Date_of_Sale IS NOT NULL
    -- No date floor here on purpose: we need full history to know who is truly first-time.
  GROUP BY 1, 2, 3, 4
),

ranked AS (
  SELECT
    App_Name,
    Customer_Number,
    Order_Id,
    Date_of_Sale,
    chain_key,
    ROW_NUMBER() OVER (
      PARTITION BY App_Name, Customer_Number
      ORDER BY Date_of_Sale, Order_Id
    ) AS bc0_seq
  FROM bc0_orders
),

first_bc0 AS (
  SELECT App_Name, Customer_Number, Date_of_Sale AS first_bc0_date
  FROM ranked
  WHERE bc0_seq = 1
),

second_bc0 AS (
  SELECT App_Name, Customer_Number, Date_of_Sale AS second_bc0_date
  FROM ranked
  WHERE bc0_seq = 2
),

bc1_chains AS (
  -- Every subscription chain that made it to its first real charge.
  SELECT DISTINCT
    App_Name,
    COALESCE(NULLIF(TRIM(Ancestor_Order_Id), ''), Order_Id) AS chain_key
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle = '1'
    AND App_Name IS NOT NULL
),

repeat_conversion AS (
  -- Looks only at 2nd-and-later trials. A conversion on someone's
  -- first trial deliberately does not count here.
  SELECT
    r.App_Name,
    r.Customer_Number,
    LOGICAL_OR(b.chain_key IS NOT NULL) AS converted_on_repeat,
    COUNT(*)                            AS repeat_chains,
    COUNTIF(b.chain_key IS NOT NULL)    AS repeat_chains_converted
  FROM ranked r
  LEFT JOIN bc1_chains b
    ON  r.App_Name  = b.App_Name
    AND r.chain_key = b.chain_key
  WHERE r.bc0_seq >= 2
  GROUP BY 1, 2
),

cust_revenue AS (
  -- Net revenue per customer across all billing cycles.
  -- MAX per Order_Id first, because the table has one row per product line —
  -- a plain SUM would multiply revenue by the number of lines on the order.
  SELECT
    App_Name,
    Customer_Number,
    SUM(order_net_usd) AS net_revenue_usd
  FROM (
    SELECT
      App_Name,
      Customer_Number,
      Order_Id,
      MAX(IFNULL(Order_Price_Net_of_Tax_USD, 0))
        - MAX(IF(LOWER(IFNULL(Is_Refund, 'no')) = 'yes',
                 IFNULL(Refund_Amount_USD, 0), 0)) AS order_net_usd
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE IFNULL(TRIM(Is_Chargeback), '0') NOT IN ('1', 'yes', 'true')
      AND App_Name IS NOT NULL
      AND Customer_Number IS NOT NULL
      AND TRIM(Customer_Number) <> ''
    GROUP BY 1, 2, 3
  )
  GROUP BY 1, 2
),

cohort AS (
  SELECT
    f.App_Name,
    f.Customer_Number,
    f.first_bc0_date,
    s.second_bc0_date,
    DATE_DIFF(s.second_bc0_date, f.first_bc0_date, DAY) AS gap_days,
    IFNULL(rc.converted_on_repeat, FALSE)  AS converted_on_repeat,
    IFNULL(rc.repeat_chains, 0)            AS repeat_chains,
    IFNULL(rc.repeat_chains_converted, 0)  AS repeat_chains_converted,
    IFNULL(cr.net_revenue_usd, 0)          AS net_revenue_usd
  FROM first_bc0 f
  LEFT JOIN second_bc0 s
    ON  f.App_Name        = s.App_Name
    AND f.Customer_Number = s.Customer_Number
  LEFT JOIN repeat_conversion rc
    ON  f.App_Name        = rc.App_Name
    AND f.Customer_Number = rc.Customer_Number
  LEFT JOIN cust_revenue cr
    ON  f.App_Name        = cr.App_Name
    AND f.Customer_Number = cr.Customer_Number
  -- Cohort window applied only after "first ever" has been established
  WHERE f.first_bc0_date BETWEEN cohort_start AND cohort_end
)

SELECT
  DATE_TRUNC(first_bc0_date, MONTH)                               AS Month,
  App_Name                                                        AS App_Name,
  COUNT(*)                                                        AS BC0_Customers,

  -- How long until the second purchase
  COUNTIF(gap_days = 0)                                           AS Same_Day,
  COUNTIF(gap_days BETWEEN   1 AND  30)                           AS Days_1_30,
  COUNTIF(gap_days BETWEEN  31 AND  60)                           AS Days_30_60,
  COUNTIF(gap_days BETWEEN  61 AND  90)                           AS Days_60_90,
  COUNTIF(gap_days BETWEEN  91 AND 180)                           AS Days_90_180,
  COUNTIF(gap_days BETWEEN 181 AND 360)                           AS Days_180_360,
  COUNTIF(gap_days > 360)                                         AS Days_360_Plus,

  COUNTIF(second_bc0_date IS NOT NULL)                            AS Total_Returned,
  COUNTIF(second_bc0_date IS NULL)                                AS Never_Returned,
  ROUND(100 * COUNTIF(second_bc0_date IS NOT NULL) / COUNT(*), 2) AS Return_Rate_Pct,

  -- Of those who came back, how many got charged on the repeat trial
  COUNTIF(converted_on_repeat)                                    AS Converted_On_Repeat_To_BC1,
  ROUND(SAFE_DIVIDE(100 * COUNTIF(converted_on_repeat),
                    NULLIF(COUNTIF(second_bc0_date IS NOT NULL), 0)), 2)
                                                                  AS Repeat_Conversion_Pct,
  SUM(repeat_chains)                                              AS Repeat_Chains,
  SUM(repeat_chains_converted)                                    AS Repeat_Chains_Converted,
  ROUND(SAFE_DIVIDE(100 * SUM(repeat_chains_converted),
                    NULLIF(SUM(repeat_chains), 0)), 2)            AS Repeat_Chain_Conversion_Pct,

  -- Revenue: refunds deducted, chargebacks excluded
  ROUND(SUM(IF(second_bc0_date IS NOT NULL, net_revenue_usd, 0)), 2)
                                                                  AS Net_Revenue_Repeat_Customers,
  ROUND(SUM(IF(second_bc0_date IS NULL, net_revenue_usd, 0)), 2)
                                                                  AS Net_Revenue_Single_Trial_Customers,
  ROUND(SAFE_DIVIDE(SUM(IF(second_bc0_date IS NOT NULL, net_revenue_usd, 0)),
                    NULLIF(COUNTIF(second_bc0_date IS NOT NULL), 0)), 2)
                                                                  AS Net_ARPU_Repeat_Customers,
  ROUND(SAFE_DIVIDE(SUM(IF(second_bc0_date IS NULL, net_revenue_usd, 0)),
                    NULLIF(COUNTIF(second_bc0_date IS NULL), 0)), 2)
                                                                  AS Net_ARPU_Single_Trial_Customers,

  -- Days of observation available to this cohort row, as at the build date
  DATE_DIFF(data_cutoff,
            LAST_DAY(DATE_TRUNC(MIN(first_bc0_date), MONTH)),
            DAY)                                                  AS Observed_Days,

  data_cutoff                                                     AS Data_Cutoff_Date

FROM cohort
GROUP BY Month, App_Name
ORDER BY App_Name, Month;
