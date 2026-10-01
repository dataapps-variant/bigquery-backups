CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_Currency_Detail` AS

WITH 
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    0.20 AS refund_ratio_threshold,
    30 AS minimum_refund_count
),

-- =====================================================
-- PLAN_LIST AGGREGATION (4 CTEs)
-- Partitioned by Product + Country_Code + AFID + Currency
-- =====================================================
plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), AFID, Currency
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID,
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
    AFID,
    Currency,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, AFID, Currency
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final,
    fr.Country_Code,
    fr.AFID,
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
    AND fr.AFID = tp.AFID
    AND (
      (fr.Country_Code IS NULL AND tp.Country_Code IS NULL)
      OR fr.Country_Code = tp.Country_Code
    )
    AND fr.Currency = tp.Currency
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

product_list AS (
  SELECT DISTINCT Product_Name_Final, Country_Code, Currency
  FROM aggregated_plan_list
),

afid_list AS (
  SELECT DISTINCT AFID
  FROM aggregated_plan_list
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

master_combinations AS (
  SELECT 
    rd.report_date,
    pl.Product_Name_Final,
    pl.Country_Code,
    pl.Currency,
    al.AFID,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.refund_ratio_threshold,
    cfg.minimum_refund_count
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN afid_list al
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT
-- INNER JOIN to drop combos with no Plan_List match
-- =====================================================
enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.AFID,
    mc.Country_Code,
    mc.Currency,
    mc.billing_cycle,
    mc.cohort_size,
    mc.minimum_user_count,
    mc.retry_engine_period,
    mc.default_regular_bc_period,
    mc.refund_ratio_threshold,
    mc.minimum_refund_count,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type,
    apl.Trial_Period,
    apl.Trial_Price,
    apl.Regular_Price
  FROM master_combinations mc
  INNER JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Pr
