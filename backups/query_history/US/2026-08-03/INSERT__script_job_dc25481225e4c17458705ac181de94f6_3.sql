-- job_id: script_job_dc25481225e4c17458705ac181de94f6_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-08-03T08:30:04.548000+00:00
-- started: 2026-08-03T08:30:04.768000+00:00
-- ended: 2026-08-03T08:30:15.827000+00:00

INSERT INTO `variant-finance-data-project.VPU.Refund_Table`

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
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    4 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    -- NEW: Data quality filter thresholds for refund ratio
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
  SELECT DISTINCT Product_Name_Final
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
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT
-- Country_Code column from Plan_List
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
    plan.Regular_Price,
    plan.Country_Code
  FROM master_combinations mc
  LEFT JOIN `variant-finance-data-project.VPU.Plan_List` plan
    ON mc.Product_Name_Final = plan.Product_Name_Final
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS
-- =====================================================
business_logic AS (
  SELECT 
    em.*,
    
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
-- COHORT SELECTION WITH COUNTRY_CODE FILTERING
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
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.billing_cycle, bl.Country_Code
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final
    AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
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
    cohort_size,
    calculated_bc_start_date,
    Country_Code,
    Updated_Cust_ID,
    Date_of_Sale as original_purchase_date
  FROM eligible_transactions 
  WHERE transaction_rank <= cohort_size
),

-- =====================================================
-- COHORT ANALYSIS
-- =====================================================
cohort_analysis AS (
  SELECT 
    report_date,
    Product_Name_Final,
    billing_cycle,
    Country_Code,
    MIN(original_purchase_date) as calculated_bc_end_date,
    COUNT(*) as actual_cohort_count,
    MAX(cohort_size) as cohort_size
  FROM selected_cohort
  GROUP BY report_date, Product_Name_Final, billing_cycle, Country_Code
),

-- =====================================================
-- REFUND CALCULATION (3-STEP PROCESS)
-- =====================================================
-- Step 1: Get all refunds for cohort customers with proper filtering
all_customer_refunds AS (
  SELECT 
    sc.report_date,
    sc.Product_Name_Final,
    sc.billing_cycle,
    sc.Country_Code,
    sc.Updated_Cust_ID,
    sc.original_purchase_date,
    base.Refund_Date,
    base.Refund_Amount_USD,
    base.Order_Id
  FROM selected_cohort sc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON sc.Updated_Cust_ID = base.Updated_Cust_ID
    AND sc.Product_Name_Final = base.Product_Name_Final
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
  GROUP BY fr.report_date, fr.Product_Name_Final, fr.billing_cycle, fr.Country_Code, fr.Trial_Type
),

-- =====================================================
-- CORE METRICS ASSEMBLY
-- =====================================================
core_metrics AS (
  SELECT 
    bl.*,
    er.final_exchange_rate,
    ca.calculated_bc_end_date,
    
    -- Cohort_final_users calculation
    CASE 
      WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size
      ELSE ca.actual_cohort_count
    END as final_cohort_final_users,
    
    COALESCE(rm.final_refund_count, 0) as clean_refund_count,
    COALESCE(rm.final_refund_amount, 0.0) as clean_refund_amount
    
  FROM business_logic bl
  LEFT JOIN exchange_rates er
    ON bl.report_date = er.report_date 
    AND bl.Product_Name_Final = er.Product_Name_Final 
    AND bl.billing_cycle = er.billing_cycle
    AND bl.Country_Code = er.Country_Code
  LEFT JOIN cohort_analysis ca
    ON bl.report_date = ca.report_date 
    AND bl.Product_Name_Final = ca.Product_Name_Final 
    AND bl.billing_cycle = ca.billing_cycle
    AND bl.Country_Code = ca.Country_Code
  LEFT JOIN refund_metrics rm
    ON bl.report_date = rm.report_date 
    AND bl.Product_Name_Final = rm.Product_Name_Final 
    AND bl.billing_cycle = rm.billing_cycle
    AND bl.Country_Code = rm.Country_Code
),

-- =====================================================
-- FINAL CALCULATIONS
-- =====================================================
final_calculations AS (
  SELECT 
    cm.*,
    
    -- Refund Ratio calculation with exchange rate AND data quality filter
    CASE 
      -- For BC0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type = 'NT' THEN 0.0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type != 'NT' THEN 
        -- Calculate the ratio first
        CASE 
          -- NEW: Apply data quality filter - if ratio > threshold AND count < minimum, set to 0
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
          -- NEW: Apply data quality filter - if ratio > threshold AND count < minimum, set to 0
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
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  -- Primary Dimensions
  fc.report_date as Report_date,
  fc.Product_Name_Final,
  fc.billing_cycle as Billing_Cycle,
  
  -- Configuration Variables
  fc.cohort_size as Cohort_Size,
  fc.minimum_user_count as Minimum_User_count,
  fc.retry_engine_period as Retry_engine_Period,
  
  -- Product Details
  fc.Entity_Name,
  -- App_Name concatenated with Country_Code
  CASE 
    WHEN fc.Country_Code IS NULL OR fc.Country_Code = '' THEN fc.App_Name
    ELSE CONCAT(fc.App_Name, '-', fc.Country_Code)
  END as App_Name,
  fc.Trial_Type,
  fc.Trial_Period,
  fc.Currency,
  fc.Trial_Price,
  fc.Regular_Price,
  fc.Country_Code,
  fc.calculated_regular_bc_period as Regular_BC_period,
  fc.final_exchange_rate as Exchange_rate,
  fc.calculated_denominator_bc as Denominator_BC,
  
  -- Modified Dates
  fc.calculated_bc_start_date as BC_start_date,
  fc.calculated_bc_end_date as BC_end_date,
  
  -- Offset Days
  fc.calculated_start_offset_days as start_offset_days,
  fc.calculated_end_offset_days as end_offset_days,
  fc.final_cohort_final_users as Cohort_final_users,
  
  -- Refund Metrics
  fc.clean_refund_count as Refund_Count,
  fc.clean_refund_amount as Refund_Amount,
  fc.final_refund_ratio as Refund_Ratio

FROM final_calculations fc
ORDER BY fc.report_date DESC, fc.Product_Name_Final, fc.Country_Code, fc.billing_cycle
