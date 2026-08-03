-- job_id: scheduled_query_6a6d59b5-0000-214f-b515-14c14ee86440
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-30T08:30:05.660000+00:00
-- started: 2026-07-30T08:30:05.706000+00:00
-- ended: 2026-07-30T08:30:33.552000+00:00

-- =====================================================
-- SIMPLE UNIVERSAL APPEND TEMPLATE (NO EXECUTE IMMEDIATE)
-- =====================================================
-- 
-- HOW TO USE:
-- 1. Find & Replace: Refund_Table → your actual table (4 places)
-- 2. In config CTE, change the 2 date lines (shown below)
-- 3. Paste your CTEs and final SELECT
--
-- CHANGES APPLIED:
-- 1. Currency filter added on eligible_transactions (Sticky_data join)
-- 2. Currency filter added on all_customer_refunds (Sticky_data join)
-- 3. aggregated_output shows 'Multi' for multi-currency plans, groups without Currency
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
DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
);

-- =====================================================
-- STEP 2: GET LAST DATE
-- ▼ CHANGE TABLE NAME (3 of 4) ▼
-- =====================================================
SET last_processed_date = (
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
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
  INSERT INTO `variant-finance-data-project.ICARUS_Multi.Refund_Table`

  -- =====================================================
  -- ▼▼▼ PASTE YOUR QUERY BELOW (from WITH to final SELECT) ▼▼▼
  -- =====================================================

 WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    new_end_date AS report_start_date,      -- ✅ CORRECT
    new_start_date AS report_end_date,      -- ✅ CORRECT
   7000 AS cohort_size,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    -- Data quality filter thresholds for refund ratio
    0.20 AS refund_ratio_threshold,
    30 AS minimum_refund_count
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
    Country_Code,
    Currency,
    First_Date_of_Sale          -- ADDED
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
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
    pl.Currency,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.refund_ratio_threshold,
    cfg.minimum_refund_count
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
    WHERE rd.report_date >= pl.First_Date_of_Sale

),

-- =====================================================
-- PLAN_LIST AGGREGATION - MODIFIED
-- Take first record ordered by Trial_Price for all fields
-- EXCEPT Trial_Price which is averaged
-- Using ROW_NUMBER() approach for BigQuery compatibility
-- NOTE: Groups by Product_Name_Final + Country_Code to preserve JP/Non-JP splits
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
   ROW_NUMBER() OVER (PARTITION BY Product_Name_Final, Country_Code, Currency ORDER BY Trial_Price) AS rn
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
    Currency,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, Currency
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
    AND fr.Currency = tp.Currency
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT - MODIFIED
-- Now uses aggregated_plan_list instead of direct Plan_List join
-- Joins on both Product_Name_Final AND Country_Code
-- =====================================================
enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
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
    mc.Currency,
    apl.Trial_Price,
    apl.Regular_Price
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Country_Code = apl.Country_Code
    AND mc.Currency = apl.Currency
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS
-- =====================================================
business_logic AS (
  SELECT 
    em.report_date,
    em.Product_Name_Final,
    em.billing_cycle,
    em.cohort_size,
    em.minimum_user_count,
    em.retry_engine_period,
    em.default_regular_bc_period,
    em.refund_ratio_threshold,
    em.minimum_refund_count,
    em.Entity_Name,
    em.App_Name,
    em.Trial_Type,
    em.Trial_Period,
    em.Currency,
    em.Trial_Price,
    em.Regular_Price,
    em.Country_Code,
    
    -- Regular_BC_period lookup
    COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) AS calculated_regular_bc_period,
    
    -- Denominator_BC calculation
    CASE 
      WHEN em.billing_cycle = 0 THEN 0
      WHEN em.billing_cycle = 1 AND em.Trial_Type = 'NT' THEN 1
      WHEN em.billing_cycle = 1 AND em.Trial_Type != 'NT' THEN 0
      ELSE em.billing_cycle - 1
    END AS calculated_denominator_bc,
    
    -- BC_start_date calculation
    CASE 
      -- For Non NT plans
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN 
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), INTERVAL 1 DAY)
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN 
        DATE_SUB(DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), 
                  INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
      -- For NT plans
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN em.report_date
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN 
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
    END AS calculated_bc_start_date,
    
    -- start_offset_days calculation
    CASE 
      -- For Non NT plans
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 1 THEN em.Trial_Period
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 2 THEN 
        em.Trial_Period + ((em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period))
      -- For NT plans
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 1 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 2 THEN 
        (em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)
    END AS calculated_start_offset_days,
    
    -- end_offset_days calculation
    CASE 
      -- For Non NT plans
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN em.Trial_Period - 1
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN 
        em.Trial_Period + (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
      -- For NT plans
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN 
        (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
    END AS calculated_end_offset_days,
    
    -- Fixed BC for cohort selection
    CASE 
      WHEN em.Trial_Type = 'NT' THEN 1
      ELSE 0
    END AS cohort_selection_bc
    
  FROM enriched_master em
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` delay_map
    ON em.Product_Name_Final = delay_map.`Plan Name`
),

-- =====================================================
-- EXCHANGE RATE CALCULATION
-- =====================================================
exchange_rates AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.Country_Code,
    bl.Currency,
    bl.calculated_bc_start_date,
    
    CASE 
      WHEN bl.Currency = 'USD' THEN 1.0
      ELSE COALESCE(AVG(er.Value_USD), 1.0)
    END as final_exchange_rate
    
  FROM business_logic bl
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON bl.Currency = er.Currency
    AND er.Date <= bl.calculated_bc_start_date
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.billing_cycle, bl.Country_Code, bl.Currency, bl.calculated_bc_start_date
),

-- =====================================================
-- COHORT SELECTION WITH COUNTRY_CODE FILTERING - MODIFIED
-- Changed: base.Product_Name_Final -> base.Product_Name_Final_Merged
-- CHANGE: Added Currency filter on Sticky_data join
-- =====================================================
eligible_transactions AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.cohort_size,
    bl.calculated_bc_start_date,
    bl.cohort_selection_bc,
    bl.Country_Code,
    bl.Currency,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.billing_cycle, bl.Country_Code, bl.Currency
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND bl.Currency = base.Currency                            -- ADDED: Currency filter
    -- Country_Code filtering logic
    AND (
      -- If Country_Code = 'JP', only include JP transactions
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      -- If Country_Code = 'Non-JP', include all non-JP transactions
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      -- If Country_Code is NULL or empty string, include all transactions (no filter)
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '' OR TRIM(bl.Country_Code) = '')
    )
),

selected_cohort AS (
  SELECT 
    report_date,
    Product_Name_Final,
    billing_cycle,
    Country_Code,
    Currency,
    Updated_Cust_ID,
    Date_of_Sale
  FROM eligible_transactions
  WHERE transaction_rank <= cohort_size
),

-- =====================================================
-- COHORT ANALYSIS
-- =====================================================
cohort_analysis AS (
  SELECT 
    subq.report_date,
    subq.Product_Name_Final,
    subq.billing_cycle,
    subq.Country_Code,
    subq.Currency,
    MIN(subq.Date_of_Sale) as oldest_transaction_date,
    COUNT(*) as actual_cohort_count,
    MAX(subq.cohort_size) as cohort_size
  FROM (
    SELECT 
      et.report_date,
      et.Product_Name_Final,
      et.billing_cycle,
      et.Country_Code,
      et.Currency,
      et.cohort_size,
      et.Updated_Cust_ID,
      et.Date_of_Sale,
      et.transaction_rank
    FROM eligible_transactions et
    WHERE et.transaction_rank <= et.cohort_size
  ) subq
  GROUP BY subq.report_date, subq.Product_Name_Final, subq.billing_cycle, subq.Country_Code, subq.Currency
),
bc_end_date_calculation AS (
  SELECT 
    ca.*,
    bl.calculated_bc_start_date,
    ca.oldest_transaction_date AS calculated_bc_end_date
  FROM cohort_analysis ca
  INNER JOIN business_logic bl
    ON ca.report_date = bl.report_date
    AND ca.Product_Name_Final = bl.Product_Name_Final
    AND ca.billing_cycle = bl.billing_cycle
    AND ca.Country_Code = bl.Country_Code
    AND ca.Currency = bl.Currency
),

-- =====================================================
-- REFUND CALCULATION - MODIFIED
-- Changed: base.Product_Name_Final -> base.Product_Name_Final_Merged
-- CHANGE: Added Currency filter on Sticky_data join
-- =====================================================

-- Step 1: Get all refunds for cohort customers
all_customer_refunds AS (
  SELECT 
    sc.report_date,
    sc.Product_Name_Final,
    sc.billing_cycle,
    sc.Country_Code,
    sc.Currency,
    sc.Updated_Cust_ID,
    sc.Date_of_Sale as original_purchase_date,
    base.Refund_Date,
    base.Refund_Amount_USD,
    base.Order_Id
  FROM selected_cohort sc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON sc.Updated_Cust_ID = base.Updated_Cust_ID
    AND sc.Product_Name_Final = base.Product_Name_Final_Merged
    AND sc.Currency = base.Currency                            -- ADDED: Currency filter
    -- Match Country_Code filtering
    AND (
      -- If Country_Code = 'JP', only include JP refunds
      (sc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      -- If Country_Code = 'Non-JP', include all non-JP refunds
      OR (sc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      -- If Country_Code is NULL or empty, include all refunds (no filter)
      OR (sc.Country_Code IS NULL OR sc.Country_Code = '' OR TRIM(sc.Country_Code) = '')
    )
  WHERE base.Refund_Amount_USD > 0
    AND base.Refund_Date IS NOT NULL
),

-- Step 2: Filter refunds by date window using offset days
filtered_refunds AS (
  SELECT 
    acr.*,
    bl.calculated_start_offset_days,
    bl.calculated_end_offset_days,
    bl.Trial_Type
  FROM all_customer_refunds acr
  INNER JOIN business_logic bl
    ON acr.report_date = bl.report_date
    AND acr.Product_Name_Final = bl.Product_Name_Final
    AND acr.billing_cycle = bl.billing_cycle
    AND acr.Country_Code = bl.Country_Code
    AND acr.Currency = bl.Currency
  WHERE acr.Refund_Date BETWEEN
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY) AND
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY)
),

-- Step 3: Calculate refund metrics
refund_metrics AS (
  SELECT 
    fr.report_date,
    fr.Product_Name_Final,
    fr.billing_cycle,
    fr.Country_Code,
    fr.Currency,
    fr.Trial_Type,
    
    -- Apply special rule: NT users BC0 always get 0
    CASE 
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0
      ELSE COUNT(DISTINCT fr.Order_Id)
    END as final_refund_count,
    
    CASE 
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0.0
      ELSE SUM(fr.Refund_Amount_USD)
    END as final_refund_amount
    
  FROM filtered_refunds fr
GROUP BY fr.report_date, fr.Product_Name_Final, fr.billing_cycle, fr.Country_Code, fr.Currency, fr.Trial_Type
),

-- =====================================================
-- CORE METRICS ASSEMBLY
-- =====================================================
core_metrics AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.billing_cycle,
    bl.cohort_size,
    bl.minimum_user_count,
    bl.retry_engine_period,
    bl.default_regular_bc_period,
    bl.refund_ratio_threshold,
    bl.minimum_refund_count,
    bl.Entity_Name,
    bl.App_Name,
    bl.Trial_Type,
    bl.Trial_Period,
    bl.Currency,
    bl.Trial_Price,
    bl.Regular_Price,
    bl.Country_Code,
    bl.calculated_regular_bc_period,
    bl.calculated_denominator_bc,
    bl.calculated_bc_start_date,
    bl.calculated_start_offset_days,
    bl.calculated_end_offset_days,
    bl.cohort_selection_bc,
    er.final_exchange_rate,
    bedc.calculated_bc_end_date,
    
    -- Cohort_final_users calculation
    CASE 
      WHEN bedc.actual_cohort_count = bedc.cohort_size THEN bedc.cohort_size
      ELSE bedc.actual_cohort_count
    END as final_cohort_final_users,
    
    COALESCE(rm.final_refund_count, 0) as clean_refund_count,
    COALESCE(rm.final_refund_amount, 0.0) as clean_refund_amount
    
  FROM business_logic bl
  LEFT JOIN exchange_rates er
    ON bl.report_date = er.report_date 
    AND bl.Product_Name_Final = er.Product_Name_Final 
    AND bl.billing_cycle = er.billing_cycle
    AND bl.Country_Code = er.Country_Code
    AND bl.Currency = er.Currency
  LEFT JOIN bc_end_date_calculation bedc
    ON bl.report_date = bedc.report_date 
    AND bl.Product_Name_Final = bedc.Product_Name_Final 
    AND bl.billing_cycle = bedc.billing_cycle
    AND bl.Country_Code = bedc.Country_Code
    AND bl.Currency = bedc.Currency
  LEFT JOIN refund_metrics rm
    ON bl.report_date = rm.report_date 
    AND bl.Product_Name_Final = rm.Product_Name_Final 
    AND bl.billing_cycle = rm.billing_cycle
    AND bl.Country_Code = rm.Country_Code
    AND bl.Currency = rm.Currency
),

-- =====================================================
-- FINAL CALCULATIONS
-- =====================================================
final_calculations AS (
  SELECT 
    cm.report_date,
    cm.Product_Name_Final,
    cm.billing_cycle,
    cm.cohort_size,
    cm.minimum_user_count,
    cm.retry_engine_period,
    cm.default_regular_bc_period,
    cm.refund_ratio_threshold,
    cm.minimum_refund_count,
    cm.Entity_Name,
    cm.App_Name,
    cm.Trial_Type,
    cm.Trial_Period,
    cm.Currency,
    cm.Trial_Price,
    cm.Regular_Price,
    cm.Country_Code,
    cm.calculated_regular_bc_period,
    cm.calculated_denominator_bc,
    cm.calculated_bc_start_date,
    cm.calculated_start_offset_days,
    cm.calculated_end_offset_days,
    cm.cohort_selection_bc,
    cm.final_exchange_rate,
    cm.calculated_bc_end_date,
    cm.final_cohort_final_users,
    cm.clean_refund_count,
    cm.clean_refund_amount,
    
    -- Refund_Users calculation
    CASE 
      WHEN cm.billing_cycle = 0 THEN 
        COALESCE(SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 0.0)
      ELSE 
        COALESCE(SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)), 0.0)
    END as Refund_Users,
    
    -- Refund Ratio calculation with exchange rate AND data quality filter
    CASE 
      -- For BC0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type = 'NT' THEN 0.0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type != 'NT' THEN 
        -- Calculate the ratio first
        CASE 
          -- Apply data quality filter - if ratio > threshold AND count < minimum, set to 0
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               ) > cm.refund_ratio_threshold 
               AND cm.clean_refund_count < cm.minimum_refund_count 
          THEN 0.0
          -- Otherwise return the calculated ratio
          ELSE COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               )
        END
      -- For BC1+
      ELSE 
        -- Calculate the ratio first
        CASE 
          -- Apply data quality filter - if ratio > threshold AND count < minimum, set to 0
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               ) > cm.refund_ratio_threshold 
               AND cm.clean_refund_count < cm.minimum_refund_count 
          THEN 0.0
          -- Otherwise return the calculated ratio
          ELSE COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               )
        END
    END as final_refund_ratio
    
FROM core_metrics cm
),

-- =====================================================
-- AGGREGATED OUTPUT - Collapse currency dimension back to original grain
-- Grain: Report_date + Product_Name_Final + Country_Code + Billing_Cycle
-- Currency shown as 'Multi' when plan has multiple currencies
-- Calculations are done per-currency above, then summed here
-- =====================================================
aggregated_output AS (
  SELECT
    fc.report_date,
    fc.Product_Name_Final,
    fc.billing_cycle,
    fc.Country_Code,
    -- CHANGED: Show 'Multi' when plan has multiple currencies, else the single currency
    CASE 
      WHEN COUNT(DISTINCT fc.Currency) > 1 THEN 'Multi'
      ELSE MIN(fc.Currency)
    END as Currency,
    MAX(fc.cohort_size) as cohort_size,
    MAX(fc.minimum_user_count) as minimum_user_count,
    MAX(fc.retry_engine_period) as retry_engine_period,
    MAX(fc.refund_ratio_threshold) as refund_ratio_threshold,
    MAX(fc.minimum_refund_count) as minimum_refund_count,
    MAX(fc.Entity_Name) as Entity_Name,
    MAX(fc.App_Name) as App_Name,
    MAX(fc.Trial_Type) as Trial_Type,
    MAX(fc.Trial_Period) as Trial_Period,
    MAX(fc.Trial_Price) as Trial_Price,
    MAX(fc.Regular_Price) as Regular_Price,
    MAX(fc.calculated_regular_bc_period) as calculated_regular_bc_period,
    MAX(fc.final_exchange_rate) as final_exchange_rate,
    MAX(fc.calculated_denominator_bc) as calculated_denominator_bc,
    MAX(fc.calculated_bc_start_date) as calculated_bc_start_date,
    MAX(fc.calculated_bc_end_date) as calculated_bc_end_date,
    MAX(fc.calculated_start_offset_days) as calculated_start_offset_days,
    MAX(fc.calculated_end_offset_days) as calculated_end_offset_days,
    SUM(fc.final_cohort_final_users) as final_cohort_final_users,
    SUM(fc.clean_refund_count) as clean_refund_count,
    SUM(fc.clean_refund_amount) as clean_refund_amount,
    SUM(fc.Refund_Users) as Refund_Users
  FROM final_calculations fc
  GROUP BY fc.report_date, fc.Product_Name_Final, fc.billing_cycle, fc.Country_Code
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  -- Primary Dimensions
  ao.report_date as Report_date,
  ao.Product_Name_Final,
  ao.billing_cycle as Billing_Cycle,
  
  -- Configuration Variables
  ao.cohort_size as Cohort_Size,
  ao.minimum_user_count as Minimum_User_count,
  ao.retry_engine_period as Retry_engine_Period,
  
  -- Product Details
  ao.Entity_Name,
  CASE 
    WHEN ao.Country_Code IS NULL OR ao.Country_Code = '' THEN ao.App_Name
    ELSE CONCAT(ao.App_Name, '-', ao.Country_Code)
  END as App_Name,
  ao.Trial_Type,
  ao.Trial_Period,
  ao.Currency,
  ao.Trial_Price,
  ao.Regular_Price,
  ao.Country_Code,
  ao.calculated_regular_bc_period as Regular_BC_period,
  ao.final_exchange_rate as Exchange_rate,
  ao.calculated_denominator_bc as Denominator_BC,
  
  -- Modified Dates
  ao.calculated_bc_start_date as BC_start_date,
  ao.calculated_bc_end_date as BC_end_date,
  
  -- Offset Days
  ao.calculated_start_offset_days as start_offset_days,
  ao.calculated_end_offset_days as end_offset_days,
  ao.final_cohort_final_users as Cohort_final_users,

  -- Refund Metrics
  ao.clean_refund_amount as Refund_Amount,
  ao.Refund_Users,
  
  -- Refund Ratio with data quality filter applied at aggregated level
  CASE
    WHEN ao.billing_cycle = 0 AND ao.Trial_Type = 'NT' THEN 0.0
    WHEN COALESCE(
           SAFE_DIVIDE(ao.Refund_Users, NULLIF(ao.final_cohort_final_users, 0)),
           0.0
         ) > ao.refund_ratio_threshold
         AND ao.clean_refund_count < ao.minimum_refund_count
    THEN 0.0
    ELSE COALESCE(
           SAFE_DIVIDE(ao.Refund_Users, NULLIF(ao.final_cohort_final_users, 0)),
           0.0
         )
  END as Refund_Ratio

FROM aggregated_output ao
ORDER BY ao.report_date DESC, ao.Product_Name_Final, ao.Country_Code, ao.billing_cycle;

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
