-- job_id: scheduled_query_6a888b9c-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-30T08:45:02.698000+00:00
-- started: 2026-07-30T08:45:02.747000+00:00
-- ended: 2026-07-30T08:46:03.960000+00:00

-- =====================================================
-- SIMPLE UNIVERSAL APPEND TEMPLATE (NO EXECUTE IMMEDIATE)
-- =====================================================
-- 
-- HOW TO USE:
-- 1. Find & Replace: Refund_Table → your actual table (4 places)
-- 2. In config CTE, change the 2 date lines (shown below)
-- 3. Paste your CTEs and final SELECT
--
-- =====================================================

-- CONFIG
DECLARE lookback_days INT64 DEFAULT 7;
DECLARE fallback_date DATE DEFAULT DATE('2025-01-01');

-- Runtime variables
DECLARE last_processed_date DATE;
DECLARE new_start_date DATE;
DECLARE new_end_date DATE;
DECLARE days_to_process INT64;

-- =====================================================
-- STEP 1: DELETE LAST N DAYS
-- ▼ CHANGE TABLE NAME (1 of 4) ▼
-- =====================================================
DELETE FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Main_Table_300`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
);

-- =====================================================
-- STEP 2: GET LAST DATE
-- ▼ CHANGE TABLE NAME (3 of 4) ▼
-- =====================================================
SET last_processed_date = (
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
);

-- =====================================================
-- STEP 3: CALCULATE DATE RANGE
-- =====================================================
SET new_start_date = DATE_ADD(last_processed_date, INTERVAL 1 DAY);
SET new_end_date = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
SET days_to_process = DATE_DIFF(new_end_date, new_start_date, DAY) + 1;

-- =====================================================
-- STEP 4: PROCESS IF NEW DATA EXISTS
-- =====================================================
IF days_to_process > 0 THEN

  SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status;

  -- =====================================================
  -- INSERT NEW DATA
  -- ▼ CHANGE TABLE NAME (4 of 4) ▼
  -- =====================================================
  INSERT INTO `variant-finance-data-project.VPU.15K_Main_Table_300`

  -- =====================================================
  -- ▼▼▼ PASTE YOUR QUERY BELOW (from WITH to final SELECT) ▼▼▼
  -- =====================================================
  
WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    new_end_date AS report_start_date,
    new_start_date AS report_end_date,
    15000 AS cohort_size,
    300 AS limiting_days,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    4 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    7 AS recent_cac_days,
    25 AS minimum_rebill_users
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

product_list AS (
  SELECT DISTINCT 
    Product_Name_Final,
    Country_Code
  FROM `variant-finance-data-project.VPU.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

-- =====================================================
-- MASTER COMBINATIONS TABLE
-- =====================================================
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

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT
-- =====================================================
enriched_master AS (
  SELECT 
    mc.*,
    plan.Entity_Name,
    plan.App_Name,
    plan.Trial_Type,
    plan.Trial_Period,
    plan.Currency,
    plan.Trial_Price,
    plan.Regular_Price
  FROM master_combinations mc
  LEFT JOIN `variant-finance-data-project.VPU.Plan_List` plan
    ON mc.Product_Name_Final = plan.Product_Name_Final
    AND mc.Country_Code = plan.Country_Code
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS
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
-- INITIAL COHORT SELECTION (15K TRANSACTIONS)
-- =====================================================
raw_eligible_transactions AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.Country_Code,
    bl.billing_cycle,
    bl.calculated_bc_start_date,
    bl.calculated_denominator_bc,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    base.Order_Price_Net_of_Tax_USD,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final
    AND base.Billing_Cycle_Updated = bl.calculated_denominator_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
),

initial_cohort_selection AS (
  SELECT 
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    calculated_bc_start_date,
    calculated_denominator_bc,
    Updated_Cust_ID,
    Date_of_Sale,
    Order_Price_Net_of_Tax_USD
  FROM raw_eligible_transactions 
  WHERE transaction_rank <= (SELECT cohort_size FROM config)
),

-- =====================================================
-- COHORT ANALYSIS AND BC_END_DATE DETERMINATION
-- =====================================================
cohort_analysis AS (
  SELECT 
    report_date,
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    calculated_bc_start_date,
    MIN(Date_of_Sale) as oldest_transaction_date,
    COUNT(*) as total_transactions,
    COUNT(DISTINCT Updated_Cust_ID) as unique_customers
  FROM initial_cohort_selection
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle, calculated_bc_start_date
),

bc_end_date_calculation AS (
  SELECT 
    bl.*,
    ca.oldest_transaction_date,
    ca.total_transactions,
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
    AND bl.Country_Code = ca.Country_Code
    AND bl.billing_cycle = ca.billing_cycle
),

-- =====================================================
-- CONDITIONAL FINAL COHORT SELECTION
-- =====================================================
final_cohort AS (
  SELECT 
    ics.report_date,
    ics.Product_Name_Final,
    ics.Country_Code,
    ics.billing_cycle,
    ics.calculated_denominator_bc,
    ics.Updated_Cust_ID,
    ics.Order_Price_Net_of_Tax_USD,
    'selected_cohort' as final_cohort_source
  FROM initial_cohort_selection ics
  INNER JOIN bc_end_date_calculation bedc
    ON ics.report_date = bedc.report_date
    AND ics.Product_Name_Final = bedc.Product_Name_Final
    AND ics.Country_Code = bedc.Country_Code
    AND ics.billing_cycle = bedc.billing_cycle
  WHERE bedc.cohort_method = 'use_selected_cohort'
  
  UNION ALL
  
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    bedc.calculated_denominator_bc,
    base.Updated_Cust_ID,
    base.Order_Price_Net_of_Tax_USD,
    'fresh_join' as final_cohort_source
  FROM bc_end_date_calculation bedc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bedc.Product_Name_Final = base.Product_Name_Final
    AND base.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND base.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE bedc.cohort_method = 'use_fresh_join'
),

-- =====================================================
-- EXCHANGE RATE LOOKUP
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
    END as final_exchange_rate
    
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON bedc.Currency = er.Currency
    AND er.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle, bedc.Currency
),

-- =====================================================
-- SUBSCRIPTION METRICS CALCULATION
-- =====================================================
subscription_metrics AS (
  SELECT 
    fc.report_date,
    fc.Product_Name_Final,
    fc.Country_Code,
    fc.billing_cycle,
    fc.final_cohort_source,
    COUNT(fc.Updated_Cust_ID) as final_subscription_users,
    SUM(fc.Order_Price_Net_of_Tax_USD) as final_subscription_value
  FROM final_cohort fc
  GROUP BY fc.report_date, fc.Product_Name_Final, fc.Country_Code, fc.billing_cycle, fc.final_cohort_source
),

-- =====================================================
-- REBILL METRICS CALCULATION
-- =====================================================
rebill_metrics AS (
  SELECT 
    fc_distinct.report_date,
    fc_distinct.Product_Name_Final,
    fc_distinct.Country_Code,
    fc_distinct.billing_cycle,
    fc_distinct.calculated_denominator_bc,
    COUNT(rebill.Updated_Cust_ID) as final_rebill_users,
    SUM(rebill.Order_Price_Net_of_Tax_USD) as final_rebill_value
  FROM (
    SELECT DISTINCT 
      report_date, 
      Product_Name_Final, 
      Country_Code,
      billing_cycle, 
      calculated_denominator_bc, 
      Updated_Cust_ID 
    FROM final_cohort
  ) fc_distinct
  INNER JOIN bc_end_date_calculation bedc
    ON fc_distinct.report_date = bedc.report_date
    AND fc_distinct.Product_Name_Final = bedc.Product_Name_Final
    AND fc_distinct.Country_Code = bedc.Country_Code
    AND fc_distinct.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` rebill
    ON fc_distinct.Updated_Cust_ID = rebill.Updated_Cust_ID
    AND fc_distinct.Product_Name_Final = rebill.Product_Name_Final
    AND rebill.Billing_Cycle_Updated = fc_distinct.calculated_denominator_bc + 1
    AND (
      (bedc.Country_Code = 'JP' AND rebill.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (rebill.Spend_Country_Code_AFID != 'JP' OR rebill.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  GROUP BY fc_distinct.report_date, fc_distinct.Product_Name_Final, fc_distinct.Country_Code, fc_distinct.billing_cycle, fc_distinct.calculated_denominator_bc
),

-- =====================================================
-- SINGLE SALES CALCULATION
-- =====================================================
single_sales_metrics AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    SUM(ss.Order_Price_Net_of_Tax_Allocated_USD) as final_single_sale_value
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON bedc.Product_Name_Final = ss.Product_Name_Final_Main
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
-- AD SPEND CALCULATION
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
    ) as final_spend_amount
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final
    AND ads.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) 
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

-- =====================================================
-- RECENT SPEND DATE WINDOW CALCULATION
-- =====================================================
recent_spend_date_window AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    MAX(ads.Date) as last_spend_date
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final
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
    END as recent_start_date,
    rsdw.last_spend_date as recent_end_date
  FROM recent_spend_date_window rsdw
),

-- =====================================================
-- RECENT SPEND CALCULATION
-- =====================================================
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
    END as final_recent_spend
  FROM recent_date_range rdr
  INNER JOIN bc_end_date_calculation bedc
    ON rdr.report_date = bedc.report_date
    AND rdr.Product_Name_Final = bedc.Product_Name_Final
    AND rdr.Country_Code = bedc.Country_Code
    AND rdr.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final
    AND ads.Date BETWEEN rdr.recent_start_date AND rdr.recent_end_date
  GROUP BY rdr.report_date, rdr.Product_Name_Final, rdr.Country_Code, rdr.billing_cycle, 
           rdr.recent_start_date, rdr.recent_end_date, bedc.Country_Code
),

-- =====================================================
-- RECENT USERS CALCULATION
-- =====================================================
recent_users_metrics AS (
  SELECT 
    rdr.report_date,
    rdr.Product_Name_Final,
    rdr.Country_Code,
    rdr.billing_cycle,
    CASE 
      WHEN rdr.recent_start_date IS NOT NULL THEN
        COUNT(DISTINCT base.Updated_Cust_ID)
      ELSE 0
    END as final_recent_users
  FROM recent_date_range rdr
  INNER JOIN bc_end_date_calculation bedc
    ON rdr.report_date = bedc.report_date
    AND rdr.Product_Name_Final = bedc.Product_Name_Final
    AND rdr.Country_Code = bedc.Country_Code
    AND rdr.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bedc.Product_Name_Final = base.Product_Name_Final
    AND base.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND base.Date_of_Sale BETWEEN rdr.recent_start_date AND rdr.recent_end_date
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  GROUP BY rdr.report_date, rdr.Product_Name_Final, rdr.Country_Code, rdr.billing_cycle, rdr.recent_start_date
),

-- =====================================================
-- CORE METRICS ASSEMBLY
-- =====================================================
core_metrics AS (
  SELECT 
    bedc.*,
    erl.final_exchange_rate,
    COALESCE(sm.final_subscription_users, 0) as clean_subscription_users,
    COALESCE(sm.final_subscription_value, 0) as clean_subscription_value,
    COALESCE(sm.final_cohort_source, 'no_data') as clean_cohort_source,
    
    CASE 
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
      THEN COALESCE(sm.final_subscription_users, 0)
      ELSE COALESCE(rm.final_rebill_users, 0)
    END as clean_rebill_users,
    
    CASE 
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
      THEN COALESCE(sm.final_subscription_value, 0)
      ELSE COALESCE(rm.final_rebill_value, 0)
    END as clean_rebill_value,
    
    COALESCE(ssm.final_single_sale_value, 0) as clean_single_sale_value,
    COALESCE(asm.final_spend_amount, 0) as clean_spend_amount,
    COALESCE(rsm.final_recent_spend, 0) as clean_recent_spend,
    COALESCE(rum.final_recent_users, 0) as clean_recent_users
    
  FROM bc_end_date_calculation bedc
  LEFT JOIN exchange_rate_lookup erl
    ON bedc.report_date = erl.report_date 
    AND bedc.Product_Name_Final = erl.Product_Name_Final 
    AND bedc.Country_Code = erl.Country_Code
    AND bedc.billing_cycle = erl.billing_cycle
  LEFT JOIN subscription_metrics sm
    ON bedc.report_date = sm.report_date 
    AND bedc.Product_Name_Final = sm.Product_Name_Final 
    AND bedc.Country_Code = sm.Country_Code
    AND bedc.billing_cycle = sm.billing_cycle
  LEFT JOIN rebill_metrics rm
    ON bedc.report_date = rm.report_date 
    AND bedc.Product_Name_Final = rm.Product_Name_Final 
    AND bedc.Country_Code = rm.Country_Code
    AND bedc.billing_cycle = rm.billing_cycle
  LEFT JOIN single_sales_metrics ssm
    ON bedc.report_date = ssm.report_date 
    AND bedc.Product_Name_Final = ssm.Product_Name_Final 
    AND bedc.Country_Code = ssm.Country_Code
    AND bedc.billing_cycle = ssm.billing_cycle
  LEFT JOIN ad_spend_metrics asm
    ON bedc.report_date = asm.report_date 
    AND bedc.Product_Name_Final = asm.Product_Name_Final 
    AND bedc.Country_Code = asm.Country_Code
    AND bedc.billing_cycle = asm.billing_cycle
  LEFT JOIN recent_spend_metrics rsm
    ON bedc.report_date = rsm.report_date 
    AND bedc.Product_Name_Final = rsm.Product_Name_Final 
    AND bedc.Country_Code = rsm.Country_Code
    AND bedc.billing_cycle = rsm.billing_cycle
  LEFT JOIN recent_users_metrics rum
    ON bedc.report_date = rum.report_date 
    AND bedc.Product_Name_Final = rum.Product_Name_Final 
    AND bedc.Country_Code = rum.Country_Code
    AND bedc.billing_cycle = rum.billing_cycle
),

-- =====================================================
-- RATIOS AND BASIC CALCULATIONS
-- Calculate base values (will be adjusted later based on Retention_rate)
-- =====================================================
calculated_ratios AS (
  SELECT 
    cm.*,
    
    -- Base churn rate calculation
    CASE 
      WHEN cm.billing_cycle = 0 THEN 0.00
      WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_rebill_users, NULLIF(cm.clean_subscription_users, 0)), 0)
    END as base_churn_rate,
    
    -- Base refund ratio
    COALESCE(rt.Refund_Ratio, 0.00) as base_refund_ratio,
    
    -- Base CAC calculation
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_spend_amount, NULLIF(cm.clean_subscription_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_cac,
    
    -- Base Recent_CAC calculation
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_recent_spend, NULLIF(cm.clean_recent_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_recent_cac
    
  FROM core_metrics cm
  LEFT JOIN `variant-finance-data-project.VPU.Refund_Table` rt
    ON cm.report_date = rt.Report_date 
    AND cm.Product_Name_Final = rt.Product_Name_Final 
    AND cm.Country_Code = rt.Country_Code
    AND cm.billing_cycle = rt.Billing_Cycle
),

-- =====================================================
-- RETENTION RATE CALCULATION (STEP-BY-STEP)
-- NULL cascade when Subscription_users = 0 OR Rebill_users < minimum_rebill_users at trigger BCs
-- Rebill_users < minimum_rebill_users sets retention to 0 at non-trigger BCs
-- =====================================================
retention_step_0 AS (
  SELECT 
    cr.*,
    CASE 
      -- Non-NT BC0: NULL if Subscription_users = 0 OR Rebill_users < minimum_rebill_users
      WHEN cr.billing_cycle = 0 AND cr.Trial_Type != 'NT' AND (cr.clean_subscription_users = 0 OR cr.clean_rebill_users < cr.minimum_rebill_users) THEN NULL
      WHEN cr.billing_cycle = 0 THEN 1.0
      
      -- NT BC1: NULL if Subscription_users = 0 OR Rebill_users < minimum_rebill_users
      WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 AND (cr.clean_subscription_users = 0 OR cr.clean_rebill_users < cr.minimum_rebill_users) THEN NULL
      WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 THEN 1.0
      
      ELSE NULL
    END as step_0_retention
  FROM calculated_ratios cr
),

retention_step_1 AS (
  SELECT 
    rs0.*,
    CASE 
      WHEN rs0.step_0_retention IS NOT NULL THEN rs0.step_0_retention
      WHEN rs0.billing_cycle = 1 AND rs0.Trial_Type != 'NT' THEN 
        CASE 
          -- Check if BC0 was NULL (cascade from BC0)
          WHEN LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.report_date, rs0.Product_Name_Final, rs0.Country_Code
            ORDER BY rs0.billing_cycle
          ) IS NULL THEN NULL
          -- Check if current BC has Rebill_users < minimum_rebill_users → set to 0
          WHEN rs0.clean_rebill_users < rs0.minimum_rebill_users THEN 0.0
          -- Otherwise calculate normally
          ELSE 1.0 * (1 - rs0.base_churn_rate)
        END
      ELSE NULL
    END as step_1_retention
  FROM retention_step_0 rs0
),

retention_step_2 AS (
  SELECT 
    rs1.*,
    CASE 
      WHEN rs1.step_1_retention IS NOT NULL THEN rs1.step_1_retention
      WHEN rs1.billing_cycle = 2 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code
            ORDER BY rs1.billing_cycle
          ) IS NULL THEN NULL
          -- Check if current BC has Rebill_users < minimum_rebill_users → set to 0
          WHEN rs1.clean_rebill_users < rs1.minimum_rebill_users THEN 0.0
          -- Otherwise calculate normally
          ELSE LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code
            ORDER BY rs1.billing_cycle
          ) * (1 - rs1.base_churn_rate)
        END
      ELSE NULL
    END as step_2_retention
  FROM retention_step_1 rs1
),

retention_step_3 AS (
  SELECT 
    rs2.*,
    CASE 
      WHEN rs2.step_2_retention IS NOT NULL THEN rs2.step_2_retention
      WHEN rs2.billing_cycle = 3 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code
            ORDER BY rs2.billing_cycle
          ) IS NULL THEN NULL
          -- Check if current BC has Rebill_users < minimum_rebill_users → set to 0
          WHEN rs2.clean_rebill_users < rs2.minimum_rebill_users THEN 0.0
          -- Otherwise calculate normally
          ELSE LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code
            ORDER BY rs2.billing_cycle
          ) * (1 - rs2.base_churn_rate)
        END
      ELSE NULL
    END as step_3_retention
  FROM retention_step_2 rs2
),

retention_step_4 AS (
  SELECT 
    rs3.*,
    CASE 
      WHEN rs3.step_3_retention IS NOT NULL THEN rs3.step_3_retention
      WHEN rs3.billing_cycle = 4 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code
            ORDER BY rs3.billing_cycle
          ) IS NULL THEN NULL
          -- Check if current BC has Rebill_users < minimum_rebill_users → set to 0
          WHEN rs3.clean_rebill_users < rs3.minimum_rebill_users THEN 0.0
          -- Otherwise calculate normally
          ELSE LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code
            ORDER BY rs3.billing_cycle
          ) * (1 - rs3.base_churn_rate)
        END
      ELSE rs3.step_3_retention
    END as final_retention_rate
  FROM retention_step_3 rs3
),

-- =====================================================
-- FINAL CALCULATIONS
-- Create adjusted metrics that become NULL when Retention_rate IS NULL
-- Refund_ratio becomes 0 when Retention_rate = 0
-- =====================================================
final_calculations AS (
  SELECT 
    rs4.*,
    
    -- Adjusted ratios (NULL when Retention_rate IS NULL)
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      ELSE rs4.base_churn_rate
    END as final_churn_rate,
    
    -- Refund_ratio: NULL when Retention IS NULL, 0 when Retention = 0
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      WHEN rs4.final_retention_rate = 0 THEN 0.00
      ELSE rs4.base_refund_ratio
    END as final_refund_ratio,
    
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      ELSE rs4.base_cac
    END as final_cac,
    
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      ELSE rs4.base_recent_cac
    END as final_recent_cac,
    
    -- NET_Retention_rate
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      WHEN rs4.final_retention_rate = 0 THEN 0.00
      ELSE rs4.final_retention_rate - rs4.base_refund_ratio
    END as final_net_retention_rate,
    
    -- ARPU
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      WHEN rs4.billing_cycle = 0 THEN 
        rs4.final_retention_rate * rs4.Trial_Price * rs4.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
      ELSE 
        rs4.final_retention_rate * rs4.Regular_Price * rs4.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
    END as final_arpu,
    
    -- ARPU_Discounted
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs4.clean_rebill_value, NULLIF(rs4.clean_rebill_users, 0)) * rs4.final_retention_rate,
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
    END as final_arpu_discounted,
    
    -- Net_ARPU
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      WHEN rs4.final_retention_rate = 0 THEN 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
      WHEN rs4.billing_cycle = 0 THEN 
        (rs4.final_retention_rate - rs4.base_refund_ratio) * rs4.Trial_Price * rs4.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
      ELSE 
        (rs4.final_retention_rate - rs4.base_refund_ratio) * rs4.Regular_Price * rs4.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
    END as final_net_arpu,
    
    -- Net_ARPU_Discounted
    CASE 
      WHEN rs4.final_retention_rate IS NULL THEN NULL
      WHEN rs4.final_retention_rate = 0 THEN 
        COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
      ELSE COALESCE(
        SAFE_DIVIDE(rs4.clean_rebill_value, NULLIF(rs4.clean_rebill_users, 0)) * (rs4.final_retention_rate - rs4.base_refund_ratio),
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs4.clean_single_sale_value, NULLIF(rs4.clean_subscription_users, 0)), 0)
    END as final_net_arpu_discounted
    
  FROM retention_step_4 rs4
),

-- =====================================================
-- FINAL PREP - Add computed app name and LTV
-- =====================================================
final_output_prep AS (
  SELECT 
    fc.*,
    
    CASE 
      WHEN fc.Country_Code IS NOT NULL AND fc.Country_Code != '' 
      THEN CONCAT(fc.App_Name, '-', fc.Country_Code)
      ELSE fc.App_Name
    END as computed_app_name,
    
    -- Net_LTV
    CASE 
      WHEN fc.final_retention_rate IS NULL THEN NULL
      ELSE fc.final_net_arpu - fc.final_recent_cac
    END as final_net_ltv,
    
    -- Net_LTV_Discounted
    CASE 
      WHEN fc.final_retention_rate IS NULL THEN NULL
      ELSE fc.final_net_arpu_discounted - fc.final_recent_cac
    END as final_net_ltv_discounted
    
  FROM final_calculations fc
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  fop.report_date as Report_date,
  fop.Product_Name_Final,
  fop.billing_cycle as Billing_Cycle,
  
  fop.cohort_size as Cohort_Size,
  fop.limiting_days as Limiting_days,
  fop.minimum_user_count as Minimum_User_count,
  fop.retry_engine_period as Retry_engine_Period,
  
  fop.Entity_Name,
  fop.computed_app_name as App_Name,
  fop.Trial_Type,
  fop.Trial_Period,
  fop.Currency,
  fop.Trial_Price,
  fop.Regular_Price,
  fop.calculated_regular_bc_period as Regular_BC_period,
  fop.final_exchange_rate as Exchange_rate,
  fop.Country_Code,
  
  fop.calculated_bc_start_date as BC_start_date,
  fop.calculated_bc_end_date as BC_end_date,
  fop.calculated_denominator_bc as Denominator_BC,
  
  fop.clean_cohort_source as cohort_source,
  
  fop.clean_subscription_users as Subscription_users,
  fop.clean_subscription_value as Subscription_value,
  fop.clean_rebill_users as Rebill_users,
  fop.clean_rebill_value as Rebill_value,
  fop.clean_single_sale_value as Single_Sale_Value,
  fop.clean_spend_amount as Spend_amount,
  
  fop.clean_recent_spend as Recent_Spend,
  fop.clean_recent_users as Recent_Users,
  
  fop.final_churn_rate as Churn_rate,
  fop.final_refund_ratio as Refund_ratio,
  fop.final_cac as CAC,
  fop.final_recent_cac as Recent_CAC,
  fop.final_retention_rate as Retention_rate,
  fop.final_net_retention_rate as NET_Retention_rate,
  
  fop.final_arpu as ARPU,
  fop.final_arpu_discounted as ARPU_Discounted,
  fop.final_net_arpu as Net_ARPU,
  fop.final_net_arpu_discounted as Net_ARPU_Discounted,
  
  fop.final_net_ltv as Net_LTV,
  fop.final_net_ltv_discounted as Net_LTV_Discounted

FROM final_output_prep fop
ORDER BY fop.report_date DESC, fop.Product_Name_Final, fop.Country_Code, fop.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - PARAMETERIZED minimum_rebill_users
-- 
-- CHANGES MADE:
-- =====================================================
-- 
-- 1. Added minimum_rebill_users = 25 to config CTE
-- 2. Added minimum_rebill_users to master_combinations CTE
-- 3. Carried minimum_rebill_users through all CTEs in data flow
-- 4. Replaced all hardcoded "< 25" with "< minimum_rebill_users"
--    in retention_step_0, retention_step_1, retention_step_2, 
--    retention_step_3, and retention_step_4
-- 
-- =====================================================
  -- =====================================================
  -- ▲▲▲ END OF YOUR QUERY ▲▲▲
  -- =====================================================

  SELECT 'SUCCESS' AS Status;

ELSE
  SELECT 
    last_processed_date AS Last_Processed,
    new_end_date AS Target_Date,
    'UP TO DATE' AS Status;
END IF;
