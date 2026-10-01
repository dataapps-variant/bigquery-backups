DECLARE as_of      DATE  DEFAULT CURRENT_DATE();
DECLARE grace_days INT64 DEFAULT 0;
DECLARE max_cycle  INT64 DEFAULT 18;
DECLARE min_trials INT64  DEFAULT 1;        -- the N
DECLARE match_mode STRING DEFAULT 'floor';  -- 'floor' = N or more, 'exact' = exactly N

WITH orders AS (
  SELECT
    Customer_Number,
    MAX(App_Name)                                    AS app_name,
    Order_Id,
    COALESCE(NULLIF(Ancestor_Order_Id,''), Order_Id) AS chain_id,
    SAFE_CAST(Billing_Cycle AS INT64)                AS bc,
    MIN(Date_of_Sale)                                AS order_date,
    MAX(Next_BC_Date_Calculated)                     AS next_bc_date,
    MAX(Spend_Country_Code_AFID)                     AS spend_country_afid,
    MAX(AFID_CHANNEL)                                AS afid_channel,
    MAX(Trial_Type)                                  AS trial_type,
    CASE
      WHEN LOGICAL_OR(UPPER(TRIM(COALESCE(Is_Chargeback,''))) IN ('1','YES','Y','TRUE'))
        THEN 0
      WHEN LOGICAL_OR(UPPER(TRIM(COALESCE(Is_Refund,'')))     IN ('1','YES','Y','TRUE'))
        THEN GREATEST(MAX(Order_Price_Net_of_Tax_USD)
                      - COALESCE(MAX(Refund_Amount_USD), 0), 0)
      ELSE MAX(Order_Price_Net_of_Tax_USD)
    END                                              AS revenue
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Customer_Number IS NOT NULL AND App_Name IS NOT NULL
    AND SAFE_CAST(Billing_Cycle AS INT64) IS NOT NULL
  GROUP BY 1,3,4,5
),

repeat_pairs AS (
  SELECT Customer_Number, app_name
  FROM orders
  WHERE bc = 0 AND order_date BETWEEN '2025-01-01' AND '2026-06-30'
  GROUP BY 1,2
  HAVING
    CASE match_mode
      WHEN 'exact' THEN COUNT(DISTINCT Order_Id) = min_trials
      ELSE              COUNT(DISTINCT Order_Id) >= min_trials
    END
),

-- both labels fixed from the customer's first trial, then applied everywhere
cust_label AS (
  SELECT
    o.Customer_Number,
    o.app_name,
    ARRAY_AGG(o.spend_country_afid IGNORE NULLS
              ORDER BY o.order_date, o.Order_Id LIMIT 1)[SAFE_OFFSET(0)] AS first_afid_country,
    ARRAY_AGG(o.afid_channel IGNORE NULLS
              ORDER BY o.order_date, o.Order_Id LIMIT 1)[SAFE_OFFSET(0)] AS first_afid_channel
  FROM orders o
  JOIN repeat_pairs r USING (Customer_Number, app_name)
  WHERE o.bc = 0 AND o.order_date BETWEEN '2025-01-01' AND '2026-06-30'
  GROUP BY 1,2
),

report_key AS (
  SELECT
    Customer_Number,
    app_name,
    IF(app_name = 'CT',
       IF(UPPER(TRIM(COALESCE(first_afid_country,''))) = 'JP', 'CT-JP', 'CT-Non-JP'),
       app_name)                                                  AS report_app,
    IF(app_name = 'CT',
       IF(UPPER(TRIM(COALESCE(first_afid_country,''))) = 'JP', 'JP', 'Non-JP'),
       'All')                                                     AS spend_country_code_afid,
    first_afid_channel                                            AS afid_channel
  FROM cust_label
),

cohort_chains AS (
  SELECT o.Customer_Number, o.app_name, o.chain_id
  FROM orders o
  JOIN repeat_pairs r USING (Customer_Number, app_name)
  WHERE o.bc = 0 AND o.order_date BETWEEN '2025-01-01' AND '2026-06-30'
),

-- SS-typed orders removed HERE, so units and revenue both inherit the exclusion
chain_orders AS (
  SELECT o.* EXCEPT(afid_channel), k.report_app, k.spend_country_code_afid, k.afid_channel
  FROM orders o
  JOIN cohort_chains c USING (Customer_Number, app_name, chain_id)
  JOIN report_key     k USING (Customer_Number, app_name)
  WHERE UPPER(TRIM(COALESCE(o.trial_type,''))) != 'SS'
),

chain_depth AS (
  SELECT
    Customer_Number, app_name, chain_id,
    ANY_VALUE(report_app)              AS report_app,
    ANY_VALUE(spend_country_code_afid) AS spend_country_code_afid,
    ANY_VALUE(afid_channel)            AS afid_channel,
    MAX(bc) AS max_bc,
    MAX(bc) + IF(
      ARRAY_AGG(next_bc_date ORDER BY bc DESC LIMIT 1)[OFFSET(0)]
        <= DATE_SUB(as_of, INTERVAL grace_days DAY), 1, 0) AS judged_depth
  FROM chain_orders
  GROUP BY 1,2,3
),

cust_depth AS (
  SELECT
    Customer_Number, app_name,
    ANY_VALUE(report_app)              AS report_app,
    ANY_VALUE(spend_country_code_afid) AS spend_country_code_afid,
    ANY_VALUE(afid_channel)            AS afid_channel,
    MAX(max_bc)       AS max_bc,
    MAX(judged_depth) AS judged_depth
  FROM chain_depth
  GROUP BY 1,2
),

cycles AS (SELECT n FROM UNNEST(GENERATE_ARRAY(0, max_cycle)) AS n),

-- revenue now split by channel too, so it still matches the unit denominator
revenue_by_cycle AS (
  SELECT report_app, spend_country_code_afid, afid_channel, bc AS n, SUM(revenue) AS revenue_usd
  FROM chain_orders
  WHERE bc BETWEEN 0 AND max_cycle
  GROUP BY 1,2,3,4
),

units AS (
  SELECT
    c.report_app,
    c.spend_country_code_afid,
    c.afid_channel,
    n,
    COUNTIF(c.judged_depth >= n) AS subscription_units,
    COUNTIF(c.max_bc       >= n) AS rebill_units
  FROM cycles CROSS JOIN cust_depth c
  GROUP BY 1,2,3,4
),

metrics AS (
  SELECT
    u.report_app,
    u.spend_country_code_afid,
    u.afid_channel,
    u.n,
    u.subscription_units,
    u.rebill_units,
    COALESCE(r.revenue_usd, 0)                            AS revenue_usd,
    SAFE_DIVIDE(r.revenue_usd, u.rebill_units)            AS arpu_usd,
    1 - SAFE_DIVIDE(u.rebill_units, u.subscription_units) AS churn_rate,
    EXP(SUM(LN(NULLIF(SAFE_DIVIDE(u.rebill_units, u.subscription_units), 0)))
        OVER (PARTITION BY u.report_app, u.spend_country_code_afid, u.afid_channel
              ORDER BY u.n))                              AS retention_rate
  FROM units u
  LEFT JOIN revenue_by_cycle r
    ON  r.report_app              = u.report_app
    AND r.spend_country_code_afid = u.spend_country_code_afid
    AND r.afid_channel            = u.afid_channel
    AND r.n                       = u.n
  WHERE u.subscription_units > 0
)

SELECT
  CONCAT(match_mode, '_', CAST(min_trials AS STRING)) AS cohort_def,
  n                        AS billing_cycle,
  report_app               AS App_Name,
  spend_country_code_afid  AS Spend_Country_Code_AFID,
  afid_channel             AS AFID_Channel,
  subscription_units,
  rebill_units,
  ROUND(revenue_usd, 2)    AS revenue_usd,
  ROUND(arpu_usd, 2)       AS arpu_usd,
  ROUND(churn_rate, 4)     AS churn_rate,
  ROUND(retention_rate, 4) AS retention_rate,
  ROUND(COALESCE(retention_rate * arpu_usd, 0), 2) AS weighted_arpu_usd,
  ROUND(SUM(COALESCE(retention_rate * arpu_usd, 0))
        OVER (PARTITION BY report_app, spend_country_code_afid, afid_channel
              ORDER BY n), 2) AS cumulative_arpu_usd
FROM metrics
ORDER BY App_Name, AFID_Channel, billing_cycle;
