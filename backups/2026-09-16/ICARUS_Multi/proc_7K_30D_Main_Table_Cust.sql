CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.proc_7K_30D_Main_Table_Cust()
BEGIN

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table_Cust` AS

WITH
-- =====================================================
-- CONFIGURATION VARIABLES  (identical to original)
-- =====================================================
config AS (
  SELECT
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    30 AS limiting_days,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    24 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    7 AS recent_cac_days,
    25 AS minimum_rebill_users
),

-- =====================================================
-- BASE DATA (NEW)
-- One scan of the raw table, person key computed once, columns pruned.
-- The base table already contains only approved orders (decision #6), so no
-- Final_Order_Status filter is applied here.
-- Person key is NULL-safe. Degenerate Customer_Number values (blank / '0' /
-- 'NULL') would collapse into a single synthetic person — see note B.
-- =====================================================
base_data AS (
  SELECT
    CONCAT(IFNULL(TRIM(App_Name), 'NULL_APP'), '||', IFNULL(TRIM(Customer_Number), 'NULL_CUST')) AS Cust_Key,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    Date_of_Sale,
    Order_Price_Net_of_Tax_USD,
    Updated_Order_ID,
    Delay_days_SOT,
    Spend_Country_Code_AFID
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged IS NOT NULL
),

-- =====================================================
-- BASE STRUCTURE GENERATION
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
-- PLAN_LIST AGGREGATION  (identical to original)
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
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP')
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
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
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
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
    AND (
      (fr.Country_Code IS NULL AND tp.Country_Code IS NULL)
      OR fr.Country_Code = tp.Country_Code
    )
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

master_combinations AS (
  SELECT
    rd.report_date,
    pl.Product_Name_Final,
    pl.Country_Code,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.limiting_days,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.minimum_rebill_users
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

enriched_master AS (
  SELECT
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    mc.limiting_days,
    mc.minimum_user_count,
    mc.retry_engine_period,
    mc.default_regular_bc_period,
    mc.minimum_rebill_users,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type,
    apl.Trial_Period,
    apl.Currency,
    apl.Trial_Price,
    apl.Regular_Price
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND (
      (mc.Country_Code IS NULL AND apl.Country_Code IS NULL)
      OR mc.Country_Code = apl.Country_Code
    )
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS  (identical to original)
-- =====================================================
business_logic AS (
  SELECT
    em.*,
    COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) AS calculated_regular_bc_period,

    CASE
      WHEN em.billing_cycle = 0 THEN 0
      WHEN em.billing_cycle = 1 AND em.Trial_Type = 'NT' THEN 1
      WHEN em.billing_cycle = 1 AND em.Trial_Type != 'NT' THEN 0
      ELSE em.billing_cycle - 1
    END AS calculated_denominator_bc,

    CASE
      WHEN em.billing_cycle = 0 THEN em.report_date
      WHEN em.billing_cycle = 1 AND em.Trial_Type = 'NT' THEN em.report_date
      WHEN em.billing_cycle = 1 AND em.Trial_Type != 'NT' THEN
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), INTERVAL em.retry_engine_period DAY)
      ELSE
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL em.retry_engine_period DAY)
    END AS calculated_bc_start_date

  FROM enriched_master em
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` delay_map
    ON em.Product_Name_Final = delay_map.`Plan Name`
),

-- =====================================================
-- INITIAL COHORT SELECTION — PERSON LEVEL  (was raw_eligible_transactions)
-- Collapse eligible base orders to one row per PERSON, keeping their most
-- recent anchor date, THEN rank persons and cap at cohort_size.
-- =====================================================
person_eligible AS (
  SELECT
    bl.report_date,
    bl.Product_Name_Final,
    bl.Country_Code,
    bl.billing_cycle,
    bl.calculated_bc_start_date,
    bl.calculated_denominator_bc,
    bd.Cust_Key,
    MAX(bd.Date_of_Sale) AS latest_date_of_sale   -- most-recent chain per person
  FROM business_logic bl
  INNER JOIN base_data bd
    ON bl.Product_Name_Final = bd.Product_Name_Final_Merged
    AND bd.Billing_Cycle_Updated = bl.calculated_denominator_bc
    AND bd.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
  GROUP BY
    bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.billing_cycle,
    bl.calculated_bc_start_date, bl.calculated_denominator_bc, bd.Cust_Key
),

ranked_persons AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY report_date, Product_Name_Final, Country_Code, billing_cycle
      ORDER BY latest_date_of_sale DESC
    ) AS person_rank
  FROM person_eligible
),

initial_cohort_selection AS (
  SELECT *
  FROM ranked_persons
  WHERE person_rank <= (SELECT cohort_size FROM config)
),

-- =====================================================
-- COHORT ANALYSIS AND BC_END_DATE  (counts persons, not orders)
-- =====================================================
cohort_analysis AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    calculated_bc_start_date,
    MIN(latest_date_of_sale) AS oldest_transaction_date,   -- oldest person's most-recent anchor
    COUNT(*) AS total_persons,
    COUNT(DISTINCT Cust_Key) AS unique_customers
  FROM initial_cohort_selection
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle, calculated_bc_start_date
),

bc_end_date_calculation AS (
  SELECT
    bl.*,
    ca.oldest_transaction_date,
    ca.total_persons,
    ca.unique_customers,

    CASE
      WHEN bl.Trial_Type = 'NT' AND bl.billing_cycle = 0 THEN bl.report_date
      WHEN COALESCE(ca.oldest_transaction_date, bl.calculated_bc_start_date) >=
           DATE_SUB(bl.calculated_bc_start_date, INTERVAL bl.limiting_days DAY)
      THEN COALESCE(ca.oldest_transaction_date, bl.calculated_bc_start_date)
      ELSE DATE_SUB(bl.calculated_bc_start_date, INTERVAL bl.limiting_days DAY)
    END AS calculated_bc_end_date,

    CASE
      WHEN COALESCE(ca.oldest_transaction_date, bl.calculated_bc_start_date) >=
           DATE_SUB(bl.calculated_bc_start_date, INTERVAL bl.limiting_days DAY)
      THEN 'use_selected_cohort'
      ELSE 'use_fresh_join'
    END AS cohort_method

  FROM business_logic bl
  LEFT JOIN cohort_analysis ca
    ON bl.report_date = ca.report_date
    AND bl.Product_Name_Final = ca.Product_Name_Final
    AND (bl.Country_Code = ca.Country_Code
         OR (bl.Country_Code IS NULL AND ca.Country_Code IS NULL))
    AND bl.billing_cycle = ca.billing_cycle
),

-- =====================================================
-- COHORT MEMBERSHIP — PERSON LEVEL  (was final_cohort, membership side)
-- selected_cohort: the top-7,000 persons already chosen.
-- fresh_join:      all persons with an anchor order in [bc_end, bc_start].
-- One row per person per (report_date, product, country, bc).
-- =====================================================
cohort_persons AS (
  -- Within limiting_days: use the selected top-7,000 persons
  SELECT
    ics.report_date,
    ics.Product_Name_Final,
    ics.Country_Code,
    ics.billing_cycle,
    ics.Cust_Key,
    'selected_cohort' AS cohort_source
  FROM initial_cohort_selection ics
  INNER JOIN bc_end_date_calculation bedc
    ON ics.report_date = bedc.report_date
    AND ics.Product_Name_Final = bedc.Product_Name_Final
    AND (ics.Country_Code = bedc.Country_Code
         OR (ics.Country_Code IS NULL AND bedc.Country_Code IS NULL))
    AND ics.billing_cycle = bedc.billing_cycle
  WHERE bedc.cohort_method = 'use_selected_cohort'

  UNION ALL

  -- Constrained by limiting_days: pull every person in the 30-day window
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    bd.Cust_Key,
    'fresh_join' AS cohort_source
  FROM bc_end_date_calculation bedc
  INNER JOIN base_data bd
    ON bedc.Product_Name_Final = bd.Product_Name_Final_Merged
    AND bd.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND bd.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND (
      (bedc.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE bedc.cohort_method = 'use_fresh_join'
  GROUP BY
    bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.billing_cycle, bd.Cust_Key
),

-- =====================================================
-- COHORT REVENUE — order-deduped on Updated_Order_ID  (decision #5)
-- Each cohort person's anchor-BC orders inside [bc_end, bc_start], collapsed
-- to one row per order, so revenue does not double count across product rows.
-- =====================================================
cohort_orders AS (
  SELECT
    cp.report_date,
    cp.Product_Name_Final,
    cp.Country_Code,
    cp.billing_cycle,
    cp.Cust_Key,
    bd.Updated_Order_ID,
    ANY_VALUE(bd.Order_Price_Net_of_Tax_USD) AS order_price
  FROM cohort_persons cp
  INNER JOIN bc_end_date_calculation bedc
    ON cp.report_date = bedc.report_date
    AND cp.Product_Name_Final = bedc.Product_Name_Final
    AND (cp.Country_Code = bedc.Country_Code
         OR (cp.Country_Code IS NULL AND bedc.Country_Code IS NULL))
    AND cp.billing_cycle = bedc.billing_cycle
  INNER JOIN base_data bd
    ON bd.Cust_Key = cp.Cust_Key
    AND bd.Product_Name_Final_Merged = cp.Product_Name_Final
    AND bd.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND bd.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND (
      (cp.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (cp.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (cp.Country_Code IS NULL OR cp.Country_Code = '')
    )
  GROUP BY
    cp.report_date, cp.Product_Name_Final, cp.Country_Code, cp.billing_cycle,
    cp.Cust_Key, bd.Updated_Order_ID
),

-- Subscription_users = distinct cohort persons (from membership, not revenue,
-- so a person with no in-window order still counts as a cohort member)
subscription_metrics AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    ANY_VALUE(cohort_source) AS final_cohort_source,
    COUNT(DISTINCT Cust_Key) AS final_subscription_users
  FROM cohort_persons
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
),

-- Subscription_value = sum of order-deduped anchor revenue
subscription_value AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    SUM(order_price) AS final_subscription_value
  FROM cohort_orders
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
),

-- =====================================================
-- REBILL / RETENTION — PERSON LEVEL, "ANY SUBSCRIPTION COUNTS"  (decision #3)
-- A cohort person is retained if ANY order under their person key sits at
-- Billing_Cycle_Updated = denominator_bc + 1 (same product/country) and was
-- placed on or before report_date (look-ahead guard). Orders deduped on
-- Updated_Order_ID for value; on-time flag per order for Day_0.
-- =====================================================
rebill_orders AS (
  SELECT
    fc.report_date,
    fc.Product_Name_Final,
    fc.Country_Code,
    fc.billing_cycle,
    fc.Cust_Key,
    bd.Updated_Order_ID,
    ANY_VALUE(bd.Order_Price_Net_of_Tax_USD) AS order_price,
    MAX(CASE WHEN bd.Delay_days_SOT <= 0 OR bd.Delay_days_SOT IS NULL THEN 1 ELSE 0 END) AS is_on_time
  FROM (
    SELECT DISTINCT report_date, Product_Name_Final, Country_Code, billing_cycle, Cust_Key
    FROM cohort_persons
  ) fc
  INNER JOIN bc_end_date_calculation bedc
    ON fc.report_date = bedc.report_date
    AND fc.Product_Name_Final = bedc.Product_Name_Final
    AND (fc.Country_Code = bedc.Country_Code
         OR (fc.Country_Code IS NULL AND bedc.Country_Code IS NULL))
    AND fc.billing_cycle = bedc.billing_cycle
  INNER JOIN base_data bd
    ON bd.Cust_Key = fc.Cust_Key
    AND bd.Product_Name_Final_Merged = fc.Product_Name_Final
    AND bd.Billing_Cycle_Updated = bedc.calculated_denominator_bc + 1
    AND bd.Date_of_Sale <= fc.report_date          -- look-ahead / observability guard
    AND (
      (fc.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (fc.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (fc.Country_Code IS NULL OR fc.Country_Code = '')
    )
  GROUP BY
    fc.report_date, fc.Product_Name_Final, fc.Country_Code, fc.billing_cycle,
    fc.Cust_Key, bd.Updated_Order_ID
),

rebill_metrics AS (
  SELECT
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    COUNT(DISTINCT Cust_Key) AS final_rebill_users,
    SUM(order_price) AS final_rebill_value,
    COUNT(DISTINCT CASE WHEN is_on_time = 1 THEN Cust_Key END) AS final_day_0_users
  FROM rebill_orders
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
),

-- =====================================================
-- EXCHANGE RATE LOOKUP  (identical to original)
-- =====================================================
exchange_rate_lookup AS (
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    bedc.Currency,
    CASE
      WHEN bedc.Currency = 'USD' THEN 1.0
      ELSE COALESCE(AVG(er.Value_USD), 1.0)
    END AS final_exchange_rate
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON bedc.Currency = er.Currency
    AND er.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle, bedc.Currency
),

-- =====================================================
-- SINGLE SALES  (grain unchanged — see note E)
-- =====================================================
single_sales_metrics AS (
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    COUNT(DISTINCT ss.Updated_Cust_ID) AS final_ss_users,
    SUM(ss.Order_Price_Net_of_Tax_Allocated_USD) AS final_single_sale_value
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON bedc.Product_Name_Final = ss.Product_Name_Final_Main_Merged
    AND ss.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND ss.Billing_Cycle_Updated = 0
    AND (
      (bedc.Country_Code = 'JP' AND ss.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (ss.Spend_Country_Code_AFID != 'JP' OR ss.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1)
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

-- =====================================================
-- AD SPEND  (identical to original — spend is not customer-grained)
-- =====================================================
ad_spend_metrics AS (
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    SUM(
      CASE
        WHEN bedc.Country_Code IS NULL OR bedc.Country_Code = ''
          THEN ads.allocated_spend
        WHEN bedc.Country_Code = 'JP' AND ads.Country = 'JP'
          THEN ads.allocated_spend
        WHEN bedc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL)
          THEN ads.allocated_spend
        ELSE 0
      END
    ) AS final_spend_amount
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged
    AND ads.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1)
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

-- =====================================================
-- RECENT SPEND WINDOW + SPEND  (identical to original)
-- =====================================================
recent_spend_date_window AS (
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    MAX(ads.Date) AS last_spend_date
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged
    AND ads.Date <= bedc.report_date
    AND ads.allocated_spend > 0
    AND (
      (bedc.Country_Code IS NULL OR bedc.Country_Code = '' OR
       (bedc.Country_Code = 'JP' AND ads.Country = 'JP') OR
       (bedc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL)))
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1)
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

recent_date_range AS (
  SELECT
    rsdw.report_date,
    rsdw.Product_Name_Final,
    rsdw.Country_Code,
    rsdw.billing_cycle,
    rsdw.last_spend_date,
    CASE
      WHEN rsdw.last_spend_date IS NOT NULL
      THEN DATE_SUB(rsdw.last_spend_date, INTERVAL (SELECT recent_cac_days FROM config) - 1 DAY)
      ELSE NULL
    END AS recent_start_date,
    rsdw.last_spend_date AS recent_end_date
  FROM recent_spend_date_window rsdw
),

recent_spend_metrics AS (
  SELECT
    rdr.report_date,
    rdr.Product_Name_Final,
    rdr.Country_Code,
    rdr.billing_cycle,
    CASE
      WHEN rdr.recent_start_date IS NOT NULL THEN
        SUM(
          CASE
            WHEN bedc.Country_Code IS NULL OR bedc.Country_Code = ''
              THEN ads.allocated_spend
            WHEN bedc.Country_Code = 'JP' AND ads.Country = 'JP'
              THEN ads.allocated_spend
            WHEN bedc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL)
              THEN ads.allocated_spend
            ELSE 0
          END
        )
      ELSE 0
    END AS final_recent_spend
  FROM recent_date_range rdr
  INNER JOIN bc_end_date_calculation bedc
    ON rdr.report_date = bedc.report_date
    AND rdr.Product_Name_Final = bedc.Product_Name_Final
    AND (rdr.Country_Code = bedc.Country_Code
         OR (rdr.Country_Code IS NULL AND bedc.Country_Code IS NULL))
    AND rdr.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged
    AND ads.Date BETWEEN rdr.recent_start_date AND rdr.recent_end_date
  GROUP BY rdr.report_date, rdr.Product_Name_Final, rdr.Country_Code, rdr.billing_cycle,
           rdr.recent_start_date, rdr.recent_end_date, bedc.Country_Code
),

-- =====================================================
-- RECENT USERS — DISTINCT PERSON count  (was Updated_Cust_ID)
-- =====================================================
recent_users_metrics AS (
  SELECT
    rdr.report_date,
    rdr.Product_Name_Final,
    rdr.Country_Code,
    rdr.billing_cycle,
    CASE
      WHEN rdr.recent_start_date IS NOT NULL THEN
        COUNT(DISTINCT bd.Cust_Key)
      ELSE 0
    END AS final_recent_users
  FROM recent_date_range rdr
  INNER JOIN bc_end_date_calculation bedc
    ON rdr.report_date = bedc.report_date
    AND rdr.Product_Name_Final = bedc.Product_Name_Final
    AND (rdr.Country_Code = bedc.Country_Code
         OR (rdr.Country_Code IS NULL AND bedc.Country_Code IS NULL))
    AND rdr.billing_cycle = bedc.billing_cycle
  LEFT JOIN base_data bd
    ON bedc.Product_Name_Final = bd.Product_Name_Final_Merged
    AND bd.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND bd.Date_of_Sale BETWEEN rdr.recent_start_date AND rdr.recent_end_date
    AND (
      (bedc.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  GROUP BY rdr.report_date, rdr.Product_Name_Final, rdr.Country_Code, rdr.billing_cycle, rdr.recent_start_date
),

-- =====================================================
-- T30D NEW USERS — DISTINCT PERSON count  (was Updated_Cust_ID)
-- =====================================================
t30d_new_users_calc AS (
  SELECT
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    COUNT(DISTINCT bd.Cust_Key) AS final_t30d_new_users
  FROM bc_end_date_calculation bedc
  LEFT JOIN base_data bd
    ON bedc.Product_Name_Final = bd.Product_Name_Final_Merged
    AND bd.Date_of_Sale BETWEEN DATE_SUB(bedc.report_date, INTERVAL 30 DAY) AND DATE_SUB(bedc.report_date, INTERVAL 1 DAY)
    AND bd.Billing_Cycle_Updated = CASE
      WHEN bedc.Trial_Type = 'NT' THEN 1
      ELSE 0
    END
    AND (
      (bedc.Country_Code = 'JP' AND bd.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (bd.Spend_Country_Code_AFID != 'JP' OR bd.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1)
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

-- =====================================================
-- CORE METRICS ASSEMBLY  (structure identical to original; inputs now person-level)
-- =====================================================
core_metrics AS (
  SELECT
    bedc.*,
    erl.final_exchange_rate,
    COALESCE(sm.final_subscription_users, 0) AS clean_subscription_users,
    COALESCE(sv.final_subscription_value, 0) AS clean_subscription_value,
    COALESCE(sm.final_cohort_source, 'no_data') AS clean_cohort_source,

    CASE
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0
      THEN COALESCE(sm.final_subscription_users, 0)
      ELSE COALESCE(rm.final_rebill_users, 0)
    END AS clean_rebill_users,

    CASE
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0
      THEN COALESCE(sv.final_subscription_value, 0)
      ELSE COALESCE(rm.final_rebill_value, 0)
    END AS clean_rebill_value,

    CASE
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0
      THEN COALESCE(sm.final_subscription_users, 0)
      ELSE COALESCE(rm.final_day_0_users, 0)
    END AS clean_day_0_users,

    COALESCE(ssm.final_ss_users, 0) AS clean_ss_users,
    COALESCE(ssm.final_single_sale_value, 0) AS clean_single_sale_value,
    COALESCE(asm.final_spend_amount, 0) AS clean_spend_amount,
    COALESCE(rsm.final_recent_spend, 0) AS clean_recent_spend,
    COALESCE(rum.final_recent_users, 0) AS clean_recent_users,
    COALESCE(t30.final_t30d_new_users, 0) AS clean_t30d_new_users

  FROM bc_end_date_calculation bedc
  LEFT JOIN exchange_rate_lookup erl
    ON bedc.report_date = erl.report_date
    AND bedc.Product_Name_Final = erl.Product_Name_Final
    AND (bedc.Country_Code = erl.Country_Code OR (bedc.Country_Code IS NULL AND erl.Country_Code IS NULL))
    AND bedc.billing_cycle = erl.billing_cycle
  LEFT JOIN subscription_metrics sm
    ON bedc.report_date = sm.report_date
    AND bedc.Product_Name_Final = sm.Product_Name_Final
    AND (bedc.Country_Code = sm.Country_Code OR (bedc.Country_Code IS NULL AND sm.Country_Code IS NULL))
    AND bedc.billing_cycle = sm.billing_cycle
  LEFT JOIN subscription_value sv
    ON bedc.report_date = sv.report_date
    AND bedc.Product_Name_Final = sv.Product_Name_Final
    AND (bedc.Country_Code = sv.Country_Code OR (bedc.Country_Code IS NULL AND sv.Country_Code IS NULL))
    AND bedc.billing_cycle = sv.billing_cycle
  LEFT JOIN rebill_metrics rm
    ON bedc.report_date = rm.report_date
    AND bedc.Product_Name_Final = rm.Product_Name_Final
    AND (bedc.Country_Code = rm.Country_Code OR (bedc.Country_Code IS NULL AND rm.Country_Code IS NULL))
    AND bedc.billing_cycle = rm.billing_cycle
  LEFT JOIN single_sales_metrics ssm
    ON bedc.report_date = ssm.report_date
    AND bedc.Product_Name_Final = ssm.Product_Name_Final
    AND (bedc.Country_Code = ssm.Country_Code OR (bedc.Country_Code IS NULL AND ssm.Country_Code IS NULL))
    AND bedc.billing_cycle = ssm.billing_cycle
  LEFT JOIN ad_spend_metrics asm
    ON bedc.report_date = asm.report_date
    AND bedc.Product_Name_Final = asm.Product_Name_Final
    AND (bedc.Country_Code = asm.Country_Code OR (bedc.Country_Code IS NULL AND asm.Country_Code IS NULL))
    AND bedc.billing_cycle = asm.billing_cycle
  LEFT JOIN recent_spend_metrics rsm
    ON bedc.report_date = rsm.report_date
    AND bedc.Product_Name_Final = rsm.Product_Name_Final
    AND (bedc.Country_Code = rsm.Country_Code OR (bedc.Country_Code IS NULL AND rsm.Country_Code IS NULL))
    AND bedc.billing_cycle = rsm.billing_cycle
  LEFT JOIN recent_users_metrics rum
    ON bedc.report_date = rum.report_date
    AND bedc.Product_Name_Final = rum.Product_Name_Final
    AND (bedc.Country_Code = rum.Country_Code OR (bedc.Country_Code IS NULL AND rum.Country_Code IS NULL))
    AND bedc.billing_cycle = rum.billing_cycle
  LEFT JOIN t30d_new_users_calc t30
    ON bedc.report_date = t30.report_date
    AND bedc.Product_Name_Final = t30.Product_Name_Final
    AND (bedc.Country_Code = t30.Country_Code OR (bedc.Country_Code IS NULL AND t30.Country_Code IS NULL))
    AND bedc.billing_cycle = t30.billing_cycle
),

-- =====================================================
-- BASE RATIOS  (identical formulas; inputs now person-level)
-- =====================================================
base_ratios AS (
  SELECT
    cm.*,

    CASE
      WHEN cm.billing_cycle = 0 THEN 0.00
      WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_rebill_users, NULLIF(cm.clean_subscription_users, 0)), 0)
    END AS base_churn_rate,

    COALESCE(rt.Refund_Ratio, 0.00) AS base_refund_ratio,

    COALESCE(
      CASE
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0
        THEN SAFE_DIVIDE(cm.clean_spend_amount, NULLIF(cm.clean_subscription_users, 0))
        ELSE 0.0
      END,
      0.0
    ) AS base_cac,

    COALESCE(
      CASE
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0
        THEN SAFE_DIVIDE(cm.clean_recent_spend, NULLIF(cm.clean_recent_users, 0))
        ELSE 0.0
      END,
      0.0
    ) AS base_recent_cac

  FROM core_metrics cm
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.Refund_Table` rt
    ON cm.report_date = rt.Report_date
    AND cm.Product_Name_Final = rt.Product_Name_Final
    AND (cm.Country_Code = rt.Country_Code OR (cm.Country_Code IS NULL AND rt.Country_Code IS NULL))
    AND cm.billing_cycle = rt.Billing_Cycle
),

-- =====================================================
-- RETENTION RATE CASCADE (BC0–BC24)  (identical to original)
-- Rebill_users < minimum_rebill_users -> NULL; NULL cascades upward via LAG.
-- =====================================================
retention_step_0 AS (
  SELECT br.*,
    CASE
      WHEN br.billing_cycle = 0 AND br.Trial_Type != 'NT'
        AND (br.clean_subscription_users = 0 OR br.clean_rebill_users < br.minimum_rebill_users) THEN NULL
      WHEN br.billing_cycle = 0 THEN 1.0
      WHEN br.Trial_Type = 'NT' AND br.billing_cycle = 1
        AND (br.clean_subscription_users = 0 OR br.clean_rebill_users < br.minimum_rebill_users) THEN NULL
      WHEN br.Trial_Type = 'NT' AND br.billing_cycle = 1 THEN 1.0
      ELSE NULL
    END AS step_0_retention
  FROM base_ratios br
),
retention_step_1 AS (
  SELECT rs0.*,
    CASE
      WHEN rs0.step_0_retention IS NOT NULL THEN rs0.step_0_retention
      WHEN rs0.billing_cycle = 1 AND rs0.Trial_Type != 'NT' THEN
        CASE
          WHEN LAG(rs0.step_0_retention) OVER (PARTITION BY rs0.report_date, rs0.Product_Name_Final, rs0.Country_Code ORDER BY rs0.billing_cycle) IS NULL THEN NULL
          WHEN rs0.clean_rebill_users < rs0.minimum_rebill_users THEN NULL
          ELSE 1.0 * (1 - rs0.base_churn_rate)
        END
      ELSE NULL
    END AS step_1_retention
  FROM retention_step_0 rs0
),
retention_step_2 AS (
  SELECT rs1.*,
    CASE
      WHEN rs1.step_1_retention IS NOT NULL THEN rs1.step_1_retention
      WHEN rs1.billing_cycle = 2 THEN
        CASE
          WHEN LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code ORDER BY rs1.billing_cycle) IS NULL THEN NULL
          WHEN rs1.clean_rebill_users < rs1.minimum_rebill_users THEN NULL
          ELSE LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code ORDER BY rs1.billing_cycle) * (1 - rs1.base_churn_rate)
        END
      ELSE NULL
    END AS step_2_retention
  FROM retention_step_1 rs1
),
retention_step_3 AS (
  SELECT rs2.*,
    CASE
      WHEN rs2.step_2_retention IS NOT NULL THEN rs2.step_2_retention
      WHEN rs2.billing_cycle = 3 THEN
        CASE
          WHEN LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code ORDER BY rs2.billing_cycle) IS NULL THEN NULL
          WHEN rs2.clean_rebill_users < rs2.minimum_rebill_users THEN NULL
          ELSE LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code ORDER BY rs2.billing_cycle) * (1 - rs2.base_churn_rate)
        END
      ELSE NULL
    END AS step_3_retention
  FROM retention_step_2 rs2
),
retention_step_4 AS (
  SELECT rs3.*,
    CASE
      WHEN rs3.step_3_retention IS NOT NULL THEN rs3.step_3_retention
      WHEN rs3.billing_cycle = 4 THEN
        CASE
          WHEN LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code ORDER BY rs3.billing_cycle) IS NULL THEN NULL
          WHEN rs3.clean_rebill_users < rs3.minimum_rebill_users THEN NULL
          ELSE LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code ORDER BY rs3.billing_cycle) * (1 - rs3.base_churn_rate)
        END
      ELSE NULL
    END AS step_4_retention
  FROM retention_step_3 rs3
),
retention_step_5 AS (
  SELECT rs4.*,
    CASE
      WHEN rs4.step_4_retention IS NOT NULL THEN rs4.step_4_retention
      WHEN rs4.billing_cycle = 5 THEN
        CASE
          WHEN LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code ORDER BY rs4.billing_cycle) IS NULL THEN NULL
          WHEN rs4.clean_rebill_users < rs4.minimum_rebill_users THEN NULL
          ELSE LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code ORDER BY rs4.billing_cycle) * (1 - rs4.base_churn_rate)
        END
      ELSE NULL
    END AS step_5_retention
  FROM retention_step_4 rs4
),
retention_step_6 AS (
  SELECT rs5.*,
    CASE
      WHEN rs5.step_5_retention IS NOT NULL THEN rs5.step_5_retention
      WHEN rs5.billing_cycle = 6 THEN
        CASE
          WHEN LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code ORDER BY rs5.billing_cycle) IS NULL THEN NULL
          WHEN rs5.clean_rebill_users < rs5.minimum_rebill_users THEN NULL
          ELSE LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code ORDER BY rs5.billing_cycle) * (1 - rs5.base_churn_rate)
        END
      ELSE NULL
    END AS step_6_retention
  FROM retention_step_5 rs5
),
retention_step_7 AS (
  SELECT rs6.*,
    CASE
      WHEN rs6.step_6_retention IS NOT NULL THEN rs6.step_6_retention
      WHEN rs6.billing_cycle = 7 THEN
        CASE
          WHEN LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code ORDER BY rs6.billing_cycle) IS NULL THEN NULL
          WHEN rs6.clean_rebill_users < rs6.minimum_rebill_users THEN NULL
          ELSE LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code ORDER BY rs6.billing_cycle) * (1 - rs6.base_churn_rate)
        END
      ELSE NULL
    END AS step_7_retention
  FROM retention_step_6 rs6
),
retention_step_8 AS (
  SELECT rs7.*,
    CASE
      WHEN rs7.step_7_retention IS NOT NULL THEN rs7.step_7_retention
      WHEN rs7.billing_cycle = 8 THEN
        CASE
          WHEN LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code ORDER BY rs7.billing_cycle) IS NULL THEN NULL
          WHEN rs7.clean_rebill_users < rs7.minimum_rebill_users THEN NULL
          ELSE LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code ORDER BY rs7.billing_cycle) * (1 - rs7.base_churn_rate)
        END
      ELSE NULL
    END AS step_8_retention
  FROM retention_step_7 rs7
),
retention_step_9 AS (
  SELECT rs8.*,
    CASE
      WHEN rs8.step_8_retention IS NOT NULL THEN rs8.step_8_retention
      WHEN rs8.billing_cycle = 9 THEN
        CASE
          WHEN LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code ORDER BY rs8.billing_cycle) IS NULL THEN NULL
          WHEN rs8.clean_rebill_users < rs8.minimum_rebill_users THEN NULL
          ELSE LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code ORDER BY rs8.billing_cycle) * (1 - rs8.base_churn_rate)
        END
      ELSE NULL
    END AS step_9_retention
  FROM retention_step_8 rs8
),
retention_step_10 AS (
  SELECT rs9.*,
    CASE
      WHEN rs9.step_9_retention IS NOT NULL THEN rs9.step_9_retention
      WHEN rs9.billing_cycle = 10 THEN
        CASE
          WHEN LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code ORDER BY rs9.billing_cycle) IS NULL THEN NULL
          WHEN rs9.clean_rebill_users < rs9.minimum_rebill_users THEN NULL
          ELSE LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code ORDER BY rs9.billing_cycle) * (1 - rs9.base_churn_rate)
        END
      ELSE NULL
    END AS step_10_retention
  FROM retention_step_9 rs9
),
retention_step_11 AS (
  SELECT rs10.*,
    CASE
      WHEN rs10.step_10_retention IS NOT NULL THEN rs10.step_10_retention
      WHEN rs10.billing_cycle = 11 THEN
        CASE
          WHEN LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code ORDER BY rs10.billing_cycle) IS NULL THEN NULL
          WHEN rs10.clean_rebill_users < rs10.minimum_rebill_users THEN NULL
          ELSE LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code ORDER BY rs10.billing_cycle) * (1 - rs10.base_churn_rate)
        END
      ELSE NULL
    END AS step_11_retention
  FROM retention_step_10 rs10
),
retention_step_12 AS (
  SELECT rs11.*,
    CASE
      WHEN rs11.step_11_retention IS NOT NULL THEN rs11.step_11_retention
      WHEN rs11.billing_cycle = 12 THEN
        CASE
          WHEN LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code ORDER BY rs11.billing_cycle) IS NULL THEN NULL
          WHEN rs11.clean_rebill_users < rs11.minimum_rebill_users THEN NULL
          ELSE LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code ORDER BY rs11.billing_cycle) * (1 - rs11.base_churn_rate)
        END
      ELSE NULL
    END AS step_12_retention
  FROM retention_step_11 rs11
),
retention_step_13 AS (
  SELECT rs12.*,
    CASE
      WHEN rs12.step_12_retention IS NOT NULL THEN rs12.step_12_retention
      WHEN rs12.billing_cycle = 13 THEN
        CASE
          WHEN LAG(rs12.step_12_retention) OVER (PARTITION BY rs12.report_date, rs12.Product_Name_Final, rs12.Country_Code ORDER BY rs12.billing_cycle) IS NULL THEN NULL
          WHEN rs12.clean_rebill_users < rs12.minimum_rebill_users THEN NULL
          ELSE LAG(rs12.step_12_retention) OVER (PARTITION BY rs12.report_date, rs12.Product_Name_Final, rs12.Country_Code ORDER BY rs12.billing_cycle) * (1 - rs12.base_churn_rate)
        END
      ELSE NULL
    END AS step_13_retention
  FROM retention_step_12 rs12
),
retention_step_14 AS (
  SELECT rs13.*,
    CASE
      WHEN rs13.step_13_retention IS NOT NULL THEN rs13.step_13_retention
      WHEN rs13.billing_cycle = 14 THEN
        CASE
          WHEN LAG(rs13.step_13_retention) OVER (PARTITION BY rs13.report_date, rs13.Product_Name_Final, rs13.Country_Code ORDER BY rs13.billing_cycle) IS NULL THEN NULL
          WHEN rs13.clean_rebill_users < rs13.minimum_rebill_users THEN NULL
          ELSE LAG(rs13.step_13_retention) OVER (PARTITION BY rs13.report_date, rs13.Product_Name_Final, rs13.Country_Code ORDER BY rs13.billing_cycle) * (1 - rs13.base_churn_rate)
        END
      ELSE NULL
    END AS step_14_retention
  FROM retention_step_13 rs13
),
retention_step_15 AS (
  SELECT rs14.*,
    CASE
      WHEN rs14.step_14_retention IS NOT NULL THEN rs14.step_14_retention
      WHEN rs14.billing_cycle = 15 THEN
        CASE
          WHEN LAG(rs14.step_14_retention) OVER (PARTITION BY rs14.report_date, rs14.Product_Name_Final, rs14.Country_Code ORDER BY rs14.billing_cycle) IS NULL THEN NULL
          WHEN rs14.clean_rebill_users < rs14.minimum_rebill_users THEN NULL
          ELSE LAG(rs14.step_14_retention) OVER (PARTITION BY rs14.report_date, rs14.Product_Name_Final, rs14.Country_Code ORDER BY rs14.billing_cycle) * (1 - rs14.base_churn_rate)
        END
      ELSE NULL
    END AS step_15_retention
  FROM retention_step_14 rs14
),
retention_step_16 AS (
  SELECT rs15.*,
    CASE
      WHEN rs15.step_15_retention IS NOT NULL THEN rs15.step_15_retention
      WHEN rs15.billing_cycle = 16 THEN
        CASE
          WHEN LAG(rs15.step_15_retention) OVER (PARTITION BY rs15.report_date, rs15.Product_Name_Final, rs15.Country_Code ORDER BY rs15.billing_cycle) IS NULL THEN NULL
          WHEN rs15.clean_rebill_users < rs15.minimum_rebill_users THEN NULL
          ELSE LAG(rs15.step_15_retention) OVER (PARTITION BY rs15.report_date, rs15.Product_Name_Final, rs15.Country_Code ORDER BY rs15.billing_cycle) * (1 - rs15.base_churn_rate)
        END
      ELSE NULL
    END AS step_16_retention
  FROM retention_step_15 rs15
),
retention_step_17 AS (
  SELECT rs16.*,
    CASE
      WHEN rs16.step_16_retention IS NOT NULL THEN rs16.step_16_retention
      WHEN rs16.billing_cycle = 17 THEN
        CASE
          WHEN LAG(rs16.step_16_retention) OVER (PARTITION BY rs16.report_date, rs16.Product_Name_Final, rs16.Country_Code ORDER BY rs16.billing_cycle) IS NULL THEN NULL
          WHEN rs16.clean_rebill_users < rs16.minimum_rebill_users THEN NULL
          ELSE LAG(rs16.step_16_retention) OVER (PARTITION BY rs16.report_date, rs16.Product_Name_Final, rs16.Country_Code ORDER BY rs16.billing_cycle) * (1 - rs16.base_churn_rate)
        END
      ELSE NULL
    END AS step_17_retention
  FROM retention_step_16 rs16
),
retention_step_18 AS (
  SELECT rs17.*,
    CASE
      WHEN rs17.step_17_retention IS NOT NULL THEN rs17.step_17_retention
      WHEN rs17.billing_cycle = 18 THEN
        CASE
          WHEN LAG(rs17.step_17_retention) OVER (PARTITION BY rs17.report_date, rs17.Product_Name_Final, rs17.Country_Code ORDER BY rs17.billing_cycle) IS NULL THEN NULL
          WHEN rs17.clean_rebill_users < rs17.minimum_rebill_users THEN NULL
          ELSE LAG(rs17.step_17_retention) OVER (PARTITION BY rs17.report_date, rs17.Product_Name_Final, rs17.Country_Code ORDER BY rs17.billing_cycle) * (1 - rs17.base_churn_rate)
        END
      ELSE NULL
    END AS step_18_retention
  FROM retention_step_17 rs17
),
retention_step_19 AS (
  SELECT rs18.*,
    CASE
      WHEN rs18.step_18_retention IS NOT NULL THEN rs18.step_18_retention
      WHEN rs18.billing_cycle = 19 THEN
        CASE
          WHEN LAG(rs18.step_18_retention) OVER (PARTITION BY rs18.report_date, rs18.Product_Name_Final, rs18.Country_Code ORDER BY rs18.billing_cycle) IS NULL THEN NULL
          WHEN rs18.clean_rebill_users < rs18.minimum_rebill_users THEN NULL
          ELSE LAG(rs18.step_18_retention) OVER (PARTITION BY rs18.report_date, rs18.Product_Name_Final, rs18.Country_Code ORDER BY rs18.billing_cycle) * (1 - rs18.base_churn_rate)
        END
      ELSE NULL
    END AS step_19_retention
  FROM retention_step_18 rs18
),
retention_step_20 AS (
  SELECT rs19.*,
    CASE
      WHEN rs19.step_19_retention IS NOT NULL THEN rs19.step_19_retention
      WHEN rs19.billing_cycle = 20 THEN
        CASE
          WHEN LAG(rs19.step_19_retention) OVER (PARTITION BY rs19.report_date, rs19.Product_Name_Final, rs19.Country_Code ORDER BY rs19.billing_cycle) IS NULL THEN NULL
          WHEN rs19.clean_rebill_users < rs19.minimum_rebill_users THEN NULL
          ELSE LAG(rs19.step_19_retention) OVER (PARTITION BY rs19.report_date, rs19.Product_Name_Final, rs19.Country_Code ORDER BY rs19.billing_cycle) * (1 - rs19.base_churn_rate)
        END
      ELSE NULL
    END AS step_20_retention
  FROM retention_step_19 rs19
),
retention_step_21 AS (
  SELECT rs20.*,
    CASE
      WHEN rs20.step_20_retention IS NOT NULL THEN rs20.step_20_retention
      WHEN rs20.billing_cycle = 21 THEN
        CASE
          WHEN LAG(rs20.step_20_retention) OVER (PARTITION BY rs20.report_date, rs20.Product_Name_Final, rs20.Country_Code ORDER BY rs20.billing_cycle) IS NULL THEN NULL
          WHEN rs20.clean_rebill_users < rs20.minimum_rebill_users THEN NULL
          ELSE LAG(rs20.step_20_retention) OVER (PARTITION BY rs20.report_date, rs20.Product_Name_Final, rs20.Country_Code ORDER BY rs20.billing_cycle) * (1 - rs20.base_churn_rate)
        END
      ELSE NULL
    END AS step_21_retention
  FROM retention_step_20 rs20
),
retention_step_22 AS (
  SELECT rs21.*,
    CASE
      WHEN rs21.step_21_retention IS NOT NULL THEN rs21.step_21_retention
      WHEN rs21.billing_cycle = 22 THEN
        CASE
          WHEN LAG(rs21.step_21_retention) OVER (PARTITION BY rs21.report_date, rs21.Product_Name_Final, rs21.Country_Code ORDER BY rs21.billing_cycle) IS NULL THEN NULL
          WHEN rs21.clean_rebill_users < rs21.minimum_rebill_users THEN NULL
          ELSE LAG(rs21.step_21_retention) OVER (PARTITION BY rs21.report_date, rs21.Product_Name_Final, rs21.Country_Code ORDER BY rs21.billing_cycle) * (1 - rs21.base_churn_rate)
        END
      ELSE NULL
    END AS step_22_retention
  FROM retention_step_21 rs21
),
retention_step_23 AS (
  SELECT rs22.*,
    CASE
      WHEN rs22.step_22_retention IS NOT NULL THEN rs22.step_22_retention
      WHEN rs22.billing_cycle = 23 THEN
        CASE
          WHEN LAG(rs22.step_22_retention) OVER (PARTITION BY rs22.report_date, rs22.Product_Name_Final, rs22.Country_Code ORDER BY rs22.billing_cycle) IS NULL THEN NULL
          WHEN rs22.clean_rebill_users < rs22.minimum_rebill_users THEN NULL
          ELSE LAG(rs22.step_22_retention) OVER (PARTITION BY rs22.report_date, rs22.Product_Name_Final, rs22.Country_Code ORDER BY rs22.billing_cycle) * (1 - rs22.base_churn_rate)
        END
      ELSE NULL
    END AS step_23_retention
  FROM retention_step_22 rs22
),
retention_step_24 AS (
  SELECT rs23.*,
    CASE
      WHEN rs23.step_23_retention IS NOT NULL THEN rs23.step_23_retention
      WHEN rs23.billing_cycle = 24 THEN
        CASE
          WHEN LAG(rs23.step_23_retention) OVER (PARTITION BY rs23.report_date, rs23.Product_Name_Final, rs23.Country_Code ORDER BY rs23.billing_cycle) IS NULL THEN NULL
          WHEN rs23.clean_rebill_users < rs23.minimum_rebill_users THEN NULL
          ELSE LAG(rs23.step_23_retention) OVER (PARTITION BY rs23.report_date, rs23.Product_Name_Final, rs23.Country_Code ORDER BY rs23.billing_cycle) * (1 - rs23.base_churn_rate)
        END
      ELSE rs23.step_23_retention
    END AS final_retention_rate
  FROM retention_step_23 rs23
),

-- =====================================================
-- FINAL CALCULATIONS  (identical to original)
-- =====================================================
final_calculations AS (
  SELECT
    rs24.*,

    CASE WHEN rs24.final_retention_rate IS NULL THEN NULL ELSE rs24.base_churn_rate END AS final_churn_rate,
    CASE WHEN rs24.final_retention_rate IS NULL THEN NULL ELSE rs24.base_refund_ratio END AS final_refund_ratio,
    CASE WHEN rs24.final_retention_rate IS NULL THEN NULL ELSE rs24.base_cac END AS final_cac,
    CASE WHEN rs24.final_retention_rate IS NULL THEN NULL ELSE rs24.base_recent_cac END AS final_recent_cac,

    CASE
      WHEN rs24.final_retention_rate IS NULL THEN NULL
      ELSE rs24.final_retention_rate - rs24.base_refund_ratio
    END AS final_net_retention_rate,

    CASE
      WHEN rs24.final_retention_rate IS NULL THEN NULL
      WHEN rs24.billing_cycle = 0 THEN
        rs24.final_retention_rate * rs24.Trial_Price * rs24.final_exchange_rate +
        COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
      ELSE
        rs24.final_retention_rate * rs24.Regular_Price * rs24.final_exchange_rate +
        COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
    END AS final_arpu,

    CASE
      WHEN rs24.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs24.clean_rebill_value, NULLIF(rs24.clean_rebill_users, 0)) * rs24.final_retention_rate,
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
    END AS final_arpu_discounted,

    CASE
      WHEN rs24.final_retention_rate IS NULL THEN NULL
      WHEN rs24.billing_cycle = 0 THEN
        (rs24.final_retention_rate - rs24.base_refund_ratio) * rs24.Trial_Price * rs24.final_exchange_rate +
        COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
      ELSE
        (rs24.final_retention_rate - rs24.base_refund_ratio) * rs24.Regular_Price * rs24.final_exchange_rate +
        COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
    END AS final_net_arpu,

    CASE
      WHEN rs24.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs24.clean_rebill_value, NULLIF(rs24.clean_rebill_users, 0)) * (rs24.final_retention_rate - rs24.base_refund_ratio),
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs24.clean_single_sale_value, NULLIF(rs24.clean_subscription_users, 0)), 0)
    END AS final_net_arpu_discounted

  FROM retention_step_24 rs24
),

-- =====================================================
-- FINAL PREP — computed app name, LTV, Active/Inactive  (identical to original)
-- =====================================================
final_output_prep AS (
  SELECT
    fc.*,

    CASE
      WHEN fc.Country_Code IS NOT NULL AND fc.Country_Code != ''
      THEN CONCAT(fc.App_Name, '-', fc.Country_Code)
      ELSE fc.App_Name
    END AS computed_app_name,

    CASE
      WHEN fc.final_retention_rate IS NULL THEN NULL
      ELSE fc.final_net_arpu - fc.final_recent_cac
    END AS final_net_ltv,

    CASE
      WHEN fc.final_retention_rate IS NULL THEN NULL
      ELSE fc.final_net_arpu_discounted - fc.final_recent_cac
    END AS final_net_ltv_discounted,

    CASE
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END AS active_inactive_status

  FROM final_calculations fc
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON CASE
         WHEN fc.Country_Code IS NOT NULL AND fc.Country_Code != ''
         THEN CONCAT(fc.App_Name, '-', fc.Country_Code)
         ELSE fc.App_Name
       END = ap.App_Name
    AND fc.Product_Name_Final = ap.Product_Name_Final
)

-- =====================================================
-- FINAL OUTPUT (50 COLUMNS — identical schema to 7K_30D_Main_Table)
-- =====================================================
SELECT
  fop.report_date AS Report_date,
  fop.Product_Name_Final,
  fop.active_inactive_status AS Active_Inactive,
  fop.billing_cycle AS Billing_Cycle,

  fop.cohort_size AS Cohort_Size,
  fop.limiting_days AS Limiting_days,
  fop.minimum_rebill_users AS Minimum_Rebill_Count,
  fop.retry_engine_period AS Retry_engine_Period,

  fop.Entity_Name,
  fop.computed_app_name AS App_Name,
  fop.Trial_Type,
  fop.Trial_Period,
  fop.Currency,
  fop.Trial_Price,
  fop.Regular_Price,
  fop.calculated_regular_bc_period AS Regular_BC_period,
  fop.final_exchange_rate AS Exchange_rate,
  fop.Country_Code,

  fop.calculated_bc_start_date AS BC_start_date,
  fop.calculated_bc_end_date AS BC_end_date,
  fop.calculated_denominator_bc AS Denominator_BC,

  fop.clean_cohort_source AS cohort_source,

  fop.clean_subscription_users AS Subscription_users,
  fop.clean_subscription_value AS Subscription_value,
  fop.clean_rebill_users AS Rebill_users,
  fop.clean_day_0_users AS Day_0_Users,
  SAFE_DIVIDE(fop.clean_day_0_users, NULLIF(fop.clean_rebill_users, 0)) AS Actual_SOT,
  fop.clean_rebill_value AS Rebill_value,
  fop.clean_ss_users AS SS_Users,
  fop.clean_single_sale_value AS Single_Sale_Value,
  fop.clean_spend_amount AS Spend_amount,
  fop.clean_recent_spend AS Recent_Spend,
  fop.clean_recent_users AS Recent_Users,

  fop.final_churn_rate AS Churn_rate,
  fop.final_refund_ratio AS Refund_ratio,
  fop.final_cac AS CAC,
  fop.final_recent_cac AS Recent_CAC,
  fop.final_retention_rate AS Retention_rate,
  fop.final_net_retention_rate AS NET_Retention_rate,

  fop.final_arpu AS ARPU,
  fop.final_arpu_discounted AS ARPU_Discounted,
  fop.final_net_arpu AS Net_ARPU,
  fop.final_net_arpu_discounted AS Net_ARPU_Discounted,

  fop.final_net_ltv AS Net_LTV,
  fop.final_net_ltv_discounted AS Net_LTV_Discounted,

  fop.clean_t30d_new_users AS T30D_New_Users

FROM final_output_prep fop
ORDER BY fop.report_date DESC, fop.Product_Name_Final, fop.Country_Code, fop.billing_cycle;

END;
