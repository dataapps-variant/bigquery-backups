CREATE OR REPLACE PROCEDURE `variant-finance-data-project.icarus_chargebee.proc_7k_SOT_Ratio`()
BEGIN

-- =====================================================
-- 7K SOT RATIO — CHARGEBEE VERSION
-- Same logic as ICARUS_Multi.proc_7k_SOT_Ratio, with:
--   • Plan list  → icarus_chargebee.Plan_List
--   • Fact data  → Platform = 'Chargebee' only
--   • Output     → icarus_chargebee.7k_SOT_Ratio
-- Run order: proc_Plan_List → proc_7k_SOT_Ratio
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.icarus_chargebee.7k_SOT_Ratio` AS    -- CHANGED

WITH 
-- =====================================================
-- CONFIGURATION
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    24 AS max_billing_cycles,
    'Chargebee' AS platform                                           -- NEW
),
plan_start_dates AS (
  SELECT 'PD1000AE' AS Product_Name_Final, DATE('2026-03-13') AS plan_start_date
),

-- =====================================================
-- CHARGEBEE ORDERS ONLY (NEW)
-- =====================================================
chargebee_base AS (
  SELECT
    b.Updated_Cust_ID,
    b.Product_Name_Final_Merged,
    b.Billing_Cycle_Updated,
    b.Date_of_Sale,
    b.Spend_Country_Code_AFID,
    b.Delay_days_SOT
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` b
  CROSS JOIN config cfg
  WHERE b.Platform = cfg.platform
    AND b.Product_Name_Final_Merged IS NOT NULL
),

-- =====================================================
-- BASE STRUCTURE
-- =====================================================
report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
    (SELECT report_end_date FROM config),
    (SELECT report_start_date FROM config),
    INTERVAL 1 DAY
  )) AS report_date
),

-- =====================================================
-- PLAN_LIST AGGREGATION (CHARGEBEE PLAN LIST)
-- =====================================================
plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, Country_Code 
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.icarus_chargebee.Plan_List`      -- CHANGED
  WHERE Product_Name_Final IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Regular_Price
  FROM plan_list_ranked
  WHERE rn = 1
),

plan_list_trial_price_avg AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.icarus_chargebee.Plan_List`      -- CHANGED
  WHERE Product_Name_Final IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final,
    fr.Country_Code,
    fr.Entity_Name,
    fr.App_Name,
    fr.Trial_Type,
    fr.Trial_Period,
    fr.Currency,
    fr.Regular_Price,
    tp.Trial_Price
  FROM plan_list_first_record fr
  INNER JOIN plan_list_trial_price_avg tp
    ON fr.Product_Name_Final = tp.Product_Name_Final
    AND fr.Country_Code = tp.Country_Code
),

product_list AS (
  SELECT DISTINCT 
    Product_Name_Final,
    Country_Code
  FROM aggregated_plan_list
  WHERE Product_Name_Final IS NOT NULL
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

-- =====================================================
-- MASTER COMBINATIONS
-- =====================================================
master_combinations AS (
  SELECT 
    rd.report_date,
    pl.Product_Name_Final,
    pl.Country_Code,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
  LEFT JOIN plan_start_dates psd
    ON pl.Product_Name_Final = psd.Product_Name_Final
  WHERE rd.report_date >= COALESCE(psd.plan_start_date, cfg.report_end_date)
),

enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Country_Code = apl.Country_Code
),

-- =====================================================
-- SUBSCRIPTION COHORT (reads CHARGEBEE orders)
-- =====================================================
subscription_cohort AS (
  SELECT 
    em.report_date,
    em.Product_Name_Final,
    em.Country_Code,
    em.billing_cycle,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY em.report_date, em.Product_Name_Final, em.Country_Code, em.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) AS user_rank
  FROM enriched_master em
  INNER JOIN chargebee_base base                                      -- CHANGED
    ON em.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Billing_Cycle_Updated = em.billing_cycle
    AND base.Date_of_Sale <= em.report_date
    AND (
      (em.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (em.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (em.Country_Code IS NULL OR em.Country_Code = '')
    )
),

top_cohort AS (
  SELECT 
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    Updated_Cust_ID,
    Delay_days_SOT
  FROM subscription_cohort
  WHERE user_rank <= (SELECT cohort_size FROM config)
),

-- =====================================================
-- METRICS
-- =====================================================
metrics AS (
  SELECT 
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    COUNT(Updated_Cust_ID) AS subscription_users,
    COUNT(
      CASE 
        WHEN Delay_days_SOT <= 0 OR Delay_days_SOT IS NULL 
        THEN 1 
      END
    ) AS sot_users
  FROM top_cohort
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT (same 11 columns as Sticky version)
-- =====================================================
SELECT 
  em.report_date AS Report_date,
  em.Product_Name_Final,
  em.billing_cycle AS Billing_Cycle,
  em.cohort_size AS Cohort_Size,
  em.Entity_Name,
  em.App_Name,
  em.Trial_Type,
  em.Country_Code,
  COALESCE(m.subscription_users, 0) AS Subscription_users,
  COALESCE(m.sot_users, 0) AS SOT_Users,
  COALESCE(
    SAFE_DIVIDE(
      COALESCE(m.sot_users, 0), 
      NULLIF(COALESCE(m.subscription_users, 0), 0)
    ),
    0
  ) AS SOT_Ratio
FROM enriched_master em
LEFT JOIN metrics m
  ON em.report_date = m.report_date
  AND em.Product_Name_Final = m.Product_Name_Final
  AND em.Country_Code = m.Country_Code
  AND em.billing_cycle = m.billing_cycle
ORDER BY em.report_date DESC, em.Product_Name_Final, em.Country_Code, em.billing_cycle;

END;
