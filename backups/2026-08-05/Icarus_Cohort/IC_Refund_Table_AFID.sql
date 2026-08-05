-- =====================================================
-- REFUND TABLE CREATION SCRIPT - V2 WITH AFID_SUFFIX
-- Refund Analysis for Subscription Business Metrics
-- Table: Icarus_Cohort.IC_Refund_Table
-- MODIFICATION: Added AFID_Suffix dimension to grain
-- SOURCE: IC_Plan_List_AFID (replaces IC_Plan_List)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID` AS

WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    0.00 AS refund_ratio_threshold,
    30 AS minimum_refund_count
),

-- =====================================================
-- PLAN_LIST AGGREGATION (4 CTEs)
-- UPDATED: Source changed to IC_Plan_List_AFID
-- UPDATED: AFID_Suffix added to grain
-- =====================================================
plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID,
    AFID_Suffix,                                                    -- NEW
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), AFID, COALESCE(CAST(AFID_Suffix AS STRING), 'NULL_GROUP')    -- NEW
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`    -- CHANGED SOURCE
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID,
    AFID_Suffix,                                                    -- NEW
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
    AFID_Suffix,                                                    -- NEW
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`    -- CHANGED SOURCE
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, AFID, AFID_Suffix     -- NEW
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final,
    fr.Country_Code,
    fr.AFID,
    fr.AFID_Suffix,                                                 -- NEW
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
    AND (                                                           -- NEW: NULL-safe AFID_Suffix join
      (fr.AFID_Suffix IS NULL AND tp.AFID_Suffix IS NULL)
      OR fr.AFID_Suffix = tp.AFID_Suffix
    )
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
  FROM aggregated_plan_list
),

-- UPDATED: Now pulls AFID + AFID_Suffix as a pair
afid_list AS (
  SELECT DISTINCT 
    AFID,
    AFID_Suffix                                                     -- NEW
  FROM aggregated_plan_list
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

-- =====================================================
-- MASTER COMBINATIONS TABLE
-- UPDATED: AFID_Suffix flows through from afid_list
-- =====================================================
master_combinations AS (
  SELECT 
    rd.report_date,
    pl.Product_Name_Final,
    al.AFID,
    al.AFID_Suffix,                                                 -- NEW
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
-- UPDATED: AFID_Suffix in INNER JOIN condition (NULL-safe)
-- =====================================================
enriched_master AS (
  SELECT 
    mc.*,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type,
    apl.Trial_Period,
    apl.Currency,
    apl.Trial_Price,
    apl.Regular_Price,
    apl.Country_Code
  FROM master_combinations mc
  INNER JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.AFID = apl.AFID
    AND (                                                           -- NEW: NULL-safe AFID_Suffix join
      (mc.AFID_Suffix IS NULL AND apl.AFID_Suffix IS NULL)
      OR mc.AFID_Suffix = apl.AFID_Suffix
    )
),

-- =====================================================
-- BUSINESS LOGIC CALCULATIONS
-- No logic changes — AFID_Suffix passes through via em.*
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
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN 
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), INTERVAL 1 DAY)
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN 
        DATE_SUB(DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.Trial_Period DAY), 
                  INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN em.report_date
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN 
        DATE_SUB(DATE_SUB(em.report_date, INTERVAL em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period) DAY), INTERVAL 1 DAY)
    END AS calculated_bc_start_date,
    
    CASE 
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 1 THEN em.Trial_Period
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 2 THEN 
        em.Trial_Period + ((em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period))
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 1 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 2 THEN 
        (em.billing_cycle - 1) * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)
    END AS calculated_start_offset_days,
    
    CASE 
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle = 0 THEN em.Trial_Period - 1
      WHEN em.Trial_Type != 'NT' AND em.billing_cycle >= 1 THEN 
        em.Trial_Period + (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle = 0 THEN 0
      WHEN em.Trial_Type = 'NT' AND em.billing_cycle >= 1 THEN 
        (em.billing_cycle * COALESCE(delay_map.`Delay days`, em.default_regular_bc_period)) - 1
    END AS calculated_end_offset_days,
    
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
-- UPDATED: AFID_Suffix added to GROUP BY
-- =====================================================
exchange_rates AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.AFID,
    bl.AFID_Suffix,                                                 -- NEW
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
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.AFID, bl.AFID_Suffix, bl.billing_cycle, bl.Country_Code, bl.Currency, bl.calculated_bc_start_date    -- NEW
),

-- =====================================================
-- COHORT SELECTION WITH AFID_SUFFIX FILTERING
-- UPDATED: AFID_Suffix in JOIN, PARTITION BY, and SELECT
-- =====================================================
eligible_transactions AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.AFID,
    bl.AFID_Suffix,                                                 -- NEW
    bl.billing_cycle,
    bl.cohort_size,
    bl.calculated_bc_start_date,
    bl.cohort_selection_bc,
    bl.Country_Code,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.AFID, bl.AFID_Suffix, bl.billing_cycle, bl.Country_Code    -- NEW
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND bl.AFID = base.AFID_CHANNEL
    AND (                                                           -- NEW: NULL-safe AFID_Suffix join
      (bl.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR bl.AFID_Suffix = base.AFID
    )
    AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '' OR TRIM(bl.Country_Code) = '')
    )
),

selected_cohort AS (
  SELECT 
    report_date,
    Product_Name_Final,
    AFID,
    AFID_Suffix,                                                    -- NEW
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
-- UPDATED: AFID_Suffix added to GROUP BY
-- =====================================================
cohort_analysis AS (
  SELECT 
    report_date,
    Product_Name_Final,
    AFID,
    AFID_Suffix,                                                    -- NEW
    billing_cycle,
    Country_Code,
    MIN(original_purchase_date) as calculated_bc_end_date,
    COUNT(*) as actual_cohort_count,
    MAX(cohort_size) as cohort_size
  FROM selected_cohort
  GROUP BY report_date, Product_Name_Final, AFID, AFID_Suffix, billing_cycle, Country_Code    -- NEW
),

-- =====================================================
-- REFUND CALCULATION (3-STEP PROCESS)
-- UPDATED: AFID_Suffix added throughout
-- =====================================================
-- Step 1: Get all refunds for cohort customers
all_customer_refunds AS (
  SELECT 
    sc.report_date,
    sc.Product_Name_Final,
    sc.AFID,
    sc.AFID_Suffix,                                                 -- NEW
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
    AND sc.Product_Name_Final = base.Product_Name_Final_Merged
    AND sc.AFID = base.AFID_CHANNEL
    AND (                                                           -- NEW: NULL-safe AFID_Suffix join
      (sc.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR sc.AFID_Suffix = base.AFID
    )
    AND (
      (sc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (sc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (sc.Country_Code IS NULL OR sc.Country_Code = '' OR TRIM(sc.Country_Code) = '')
    )
  WHERE base.Refund_Amount_USD > 0
    AND base.Refund_Date IS NOT NULL
),

-- Step 2: Filter refunds by date window
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
    AND acr.AFID = bl.AFID
    AND (                                                           -- NEW: NULL-safe AFID_Suffix join
      (acr.AFID_Suffix IS NULL AND bl.AFID_Suffix IS NULL)
      OR acr.AFID_Suffix = bl.AFID_Suffix
    )
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
    fr.AFID,
    fr.AFID_Suffix,                                                 -- NEW
    fr.billing_cycle,
    fr.Country_Code,
    fr.Trial_Type,
    
    CASE 
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0
      ELSE COUNT(DISTINCT fr.Order_Id)
    END as final_refund_count,
    
    CASE 
      WHEN fr.Trial_Type = 'NT' AND fr.billing_cycle = 0 THEN 0.0
      ELSE SUM(fr.Refund_Amount_USD)
    END as final_refund_amount
    
  FROM filtered_refunds fr
  GROUP BY fr.report_date, fr.Product_Name_Final, fr.AFID, fr.AFID_Suffix, fr.billing_cycle, fr.Country_Code, fr.Trial_Type    -- NEW
),

-- =====================================================
-- CORE METRICS ASSEMBLY
-- UPDATED: AFID_Suffix in ALL JOIN conditions (NULL-safe)
-- =====================================================
core_metrics AS (
  SELECT 
    bl.*,
    er.final_exchange_rate,
    ca.calculated_bc_end_date,
    
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
    AND bl.AFID = er.AFID
    AND (                                                           -- NEW
      (bl.AFID_Suffix IS NULL AND er.AFID_Suffix IS NULL)
      OR bl.AFID_Suffix = er.AFID_Suffix
    )
    AND bl.billing_cycle = er.billing_cycle
    AND bl.Country_Code = er.Country_Code
  LEFT JOIN cohort_analysis ca
    ON bl.report_date = ca.report_date 
    AND bl.Product_Name_Final = ca.Product_Name_Final
    AND bl.AFID = ca.AFID
    AND (                                                           -- NEW
      (bl.AFID_Suffix IS NULL AND ca.AFID_Suffix IS NULL)
      OR bl.AFID_Suffix = ca.AFID_Suffix
    )
    AND bl.billing_cycle = ca.billing_cycle
    AND bl.Country_Code = ca.Country_Code
  LEFT JOIN refund_metrics rm
    ON bl.report_date = rm.report_date 
    AND bl.Product_Name_Final = rm.Product_Name_Final
    AND bl.AFID = rm.AFID
    AND (                                                           -- NEW
      (bl.AFID_Suffix IS NULL AND rm.AFID_Suffix IS NULL)
      OR bl.AFID_Suffix = rm.AFID_Suffix
    )
    AND bl.billing_cycle = rm.billing_cycle
    AND bl.Country_Code = rm.Country_Code
),

-- =====================================================
-- FINAL CALCULATIONS
-- No logic changes — inherits AFID_Suffix from core_metrics
-- =====================================================
final_calculations AS (
  SELECT 
    cm.*,
    
    CASE 
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type = 'NT' THEN 0.0
      WHEN cm.billing_cycle = 0 AND cm.Trial_Type != 'NT' THEN 
        CASE 
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               ) > cm.refund_ratio_threshold 
               AND cm.clean_refund_count < cm.minimum_refund_count 
          THEN 0.0
          ELSE COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Trial_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               )
        END
      ELSE 
        CASE 
          WHEN COALESCE(
                 SAFE_DIVIDE(
                   SAFE_DIVIDE(cm.clean_refund_amount, NULLIF(cm.Regular_Price * cm.final_exchange_rate, 0)), 
                   NULLIF(cm.final_cohort_final_users, 0)
                 ), 
                 0.0
               ) > cm.refund_ratio_threshold 
               AND cm.clean_refund_count < cm.minimum_refund_count 
          THEN 0.0
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
-- UPDATED: AFID_Suffix added as output column
-- =====================================================
SELECT 
  fc.report_date as Report_date,
  fc.Product_Name_Final,
  fc.AFID,
  fc.AFID_Suffix,                                                   -- NEW OUTPUT COLUMN
  fc.billing_cycle as Billing_Cycle,
  
  fc.cohort_size as Cohort_Size,
  fc.minimum_user_count as Minimum_User_count,
  fc.retry_engine_period as Retry_engine_Period,
  
  fc.Entity_Name,
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
  
  fc.calculated_bc_start_date as BC_start_date,
  fc.calculated_bc_end_date as BC_end_date,
  
  fc.calculated_start_offset_days as start_offset_days,
  fc.calculated_end_offset_days as end_offset_days,
  fc.final_cohort_final_users as Cohort_final_users,
  
  fc.clean_refund_count as Refund_Count,
  fc.clean_refund_amount as Refund_Amount,
  fc.final_refund_ratio as Refund_Ratio

FROM final_calculations fc
ORDER BY fc.report_date DESC, fc.Product_Name_Final, fc.AFID, fc.AFID_Suffix, fc.Country_Code, fc.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - REFUND TABLE V2 WITH AFID_SUFFIX
--
-- NEW GRAIN: Report_date + Product_Name_Final + Country_Code + AFID + AFID_Suffix + Billing_Cycle
--
-- CHANGES SUMMARY:
-- 1. Source changed: IC_Plan_List → IC_Plan_List_AFID
-- 2. AFID_Suffix added to Plan List aggregation (4 CTEs)
-- 3. afid_list now pulls AFID + AFID_Suffix as paired values
-- 4. AFID_Suffix added to master_combinations via afid_list
-- 5. AFID_Suffix added to enriched_master INNER JOIN (NULL-safe)
-- 6. AFID_Suffix added to exchange_rates GROUP BY
-- 7. AFID_Suffix added to eligible_transactions JOIN + PARTITION BY
-- 8. AFID_Suffix added to selected_cohort and cohort_analysis
-- 9. AFID_Suffix added to all 3 refund calculation steps
-- 10. AFID_Suffix added to core_metrics (3 LEFT JOINs, all NULL-safe)
-- 11. AFID_Suffix added as output column
--
-- NULL-SAFE JOINS (8 total):
-- - aggregated_plan_list (first_record ↔ trial_price_avg)
-- - enriched_master (master_combinations ↔ aggregated_plan_list)
-- - eligible_transactions (business_logic ↔ base table)
-- - all_customer_refunds (selected_cohort ↔ base table)
-- - filtered_refunds (all_customer_refunds ↔ business_logic)
-- - core_metrics ↔ exchange_rates
-- - core_metrics ↔ cohort_analysis
-- - core_metrics ↔ refund_metrics
--
-- COLUMN MAPPING:
-- IC_Plan_List_AFID                     → AFID_Suffix (direct)
-- Sticky_data_API_original_V_Merged_TBL → AFID (NULL-safe match)
-- =====================================================
