-- =====================================================
-- MANUAL CHECK SCRIPT - IC_Refund_Table_AFID
-- Verify a single combination from the Refund Table
-- Mirrors the exact logic of the main AFID refund script
--
-- OUTPUTS 3 RESULT SETS:
--   1) Summary row (compare cell-by-cell against extract)
--   2) Cohort detail (every transaction in the cohort + refund match flag)
--   3) Refund detail (only qualifying refund records)
-- =====================================================

-- =====================================================
-- PARAMETERS: CHANGE THESE TO MATCH THE ROW YOU WANT TO VERIFY
-- =====================================================
DECLARE p_report_date DATE DEFAULT DATE('2026-02-19');
DECLARE p_product_name STRING DEFAULT 'JF2788ST';
DECLARE p_afid_suffix STRING DEFAULT 'gdnusd';        -- SET TO NULL for NULL AFID rows
DECLARE p_billing_cycle INT64 DEFAULT 1;
DECLARE p_country_code STRING DEFAULT NULL;            -- 'JP', 'Non-JP', or NULL for no country filter
DECLARE p_cohort_size INT64 DEFAULT 7000;
DECLARE p_minimum_refund_count INT64 DEFAULT 30;
DECLARE p_refund_ratio_threshold FLOAT64 DEFAULT 0.00;
DECLARE p_default_regular_bc_period INT64 DEFAULT 30;

-- =====================================================
-- STEP 1: PLAN ATTRIBUTES
-- First record by lowest Trial_Price + AVG(Trial_Price)
-- =====================================================
CREATE TEMP TABLE tmp_plan_attributes AS
WITH plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID_Suffix,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), COALESCE(CAST(AFID_Suffix AS STRING), 'NULL_GROUP')
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`
  WHERE Product_Name_Final = p_product_name
    AND (
      (p_afid_suffix IS NULL AND AFID_Suffix IS NULL)
      OR AFID_Suffix = p_afid_suffix
    )
    AND (
      (p_country_code IS NULL AND (Country_Code IS NULL OR Country_Code = '' OR TRIM(Country_Code) = ''))
      OR Country_Code = p_country_code
    )
),
plan_first_record AS (
  SELECT * FROM plan_list_ranked WHERE rn = 1
),
plan_trial_avg AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID_Suffix,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`
  WHERE Product_Name_Final = p_product_name
    AND (
      (p_afid_suffix IS NULL AND AFID_Suffix IS NULL)
      OR AFID_Suffix = p_afid_suffix
    )
    AND (
      (p_country_code IS NULL AND (Country_Code IS NULL OR Country_Code = '' OR TRIM(Country_Code) = ''))
      OR Country_Code = p_country_code
    )
  GROUP BY Product_Name_Final, Country_Code, AFID_Suffix
)
SELECT 
  fr.Product_Name_Final,
  fr.Country_Code,
  fr.AFID_Suffix,
  fr.Entity_Name,
  fr.App_Name,
  fr.Trial_Type,
  fr.Trial_Period,
  fr.Currency,
  fr.Regular_Price,
  tp.Trial_Price
FROM plan_first_record fr
INNER JOIN plan_trial_avg tp
  ON fr.Product_Name_Final = tp.Product_Name_Final
  AND (
    (fr.Country_Code IS NULL AND tp.Country_Code IS NULL)
    OR fr.Country_Code = tp.Country_Code
  )
  AND (
    (fr.AFID_Suffix IS NULL AND tp.AFID_Suffix IS NULL)
    OR fr.AFID_Suffix = tp.AFID_Suffix
  );

-- =====================================================
-- STEP 2: BUSINESS LOGIC (offsets, dates, cohort BC)
-- =====================================================
CREATE TEMP TABLE tmp_business_logic AS
WITH delay_lookup AS (
  SELECT `Delay days`
  FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map`
  WHERE `Plan Name` = p_product_name
  LIMIT 1
)
SELECT 
  pa.*,

  -- Regular BC period
  COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period) AS calculated_regular_bc_period,

  -- Denominator BC
  CASE 
    WHEN p_billing_cycle = 0 THEN 0
    WHEN p_billing_cycle = 1 AND pa.Trial_Type = 'NT' THEN 1
    WHEN p_billing_cycle = 1 AND pa.Trial_Type != 'NT' THEN 0
    ELSE p_billing_cycle - 1
  END AS calculated_denominator_bc,

  -- BC start date
  CASE 
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle = 0 THEN 
      DATE_SUB(DATE_SUB(p_report_date, INTERVAL pa.Trial_Period DAY), INTERVAL 1 DAY)
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle >= 1 THEN 
      DATE_SUB(DATE_SUB(DATE_SUB(p_report_date, INTERVAL pa.Trial_Period DAY), 
                INTERVAL p_billing_cycle * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period) DAY), INTERVAL 1 DAY)
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle = 0 THEN p_report_date
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle >= 1 THEN 
      DATE_SUB(DATE_SUB(p_report_date, INTERVAL p_billing_cycle * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period) DAY), INTERVAL 1 DAY)
  END AS calculated_bc_start_date,

  -- Start offset days
  CASE 
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle = 0 THEN 0
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle = 1 THEN pa.Trial_Period
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle >= 2 THEN 
      pa.Trial_Period + ((p_billing_cycle - 1) * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period))
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle = 0 THEN 0
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle = 1 THEN 0
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle >= 2 THEN 
      (p_billing_cycle - 1) * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period)
  END AS calculated_start_offset_days,

  -- End offset days
  CASE 
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle = 0 THEN pa.Trial_Period - 1
    WHEN pa.Trial_Type != 'NT' AND p_billing_cycle >= 1 THEN 
      pa.Trial_Period + (p_billing_cycle * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period)) - 1
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle = 0 THEN 0
    WHEN pa.Trial_Type = 'NT' AND p_billing_cycle >= 1 THEN 
      (p_billing_cycle * COALESCE((SELECT `Delay days` FROM delay_lookup), p_default_regular_bc_period)) - 1
  END AS calculated_end_offset_days,

  -- Cohort selection BC
  CASE 
    WHEN pa.Trial_Type = 'NT' THEN 1
    ELSE 0
  END AS cohort_selection_bc

FROM tmp_plan_attributes pa;

-- =====================================================
-- STEP 3: EXCHANGE RATE
-- =====================================================
CREATE TEMP TABLE tmp_exchange_rate AS
SELECT 
  CASE 
    WHEN bl.Currency = 'USD' THEN 1.0
    ELSE COALESCE(AVG(er.Value_USD), 1.0)
  END AS final_exchange_rate
FROM tmp_business_logic bl
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
  ON bl.Currency = er.Currency
  AND er.Date <= bl.calculated_bc_start_date
GROUP BY bl.Currency;

-- =====================================================
-- STEP 4: COHORT SELECTION (last N by Date_of_Sale DESC)
-- =====================================================
CREATE TEMP TABLE tmp_eligible_transactions AS
SELECT 
  base.Updated_Cust_ID,
  base.Date_of_Sale,
  ROW_NUMBER() OVER (ORDER BY base.Date_of_Sale DESC) AS transaction_rank
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
CROSS JOIN tmp_business_logic bl
WHERE base.Product_Name_Final_Merged = p_product_name
  AND (
    (p_afid_suffix IS NULL AND base.AFID IS NULL)
    OR base.AFID = p_afid_suffix
  )
  AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
  AND base.Date_of_Sale <= bl.calculated_bc_start_date
  AND (
    (p_country_code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
    OR (p_country_code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
    OR (p_country_code IS NULL OR p_country_code = '' OR TRIM(p_country_code) = '')
  );

CREATE TEMP TABLE tmp_selected_cohort AS
SELECT 
  Updated_Cust_ID,
  Date_of_Sale AS original_purchase_date,
  transaction_rank
FROM tmp_eligible_transactions
WHERE transaction_rank <= p_cohort_size;

-- =====================================================
-- STEP 5: COHORT ANALYSIS
-- =====================================================
CREATE TEMP TABLE tmp_cohort_analysis AS
SELECT 
  COUNT(*) AS actual_cohort_count,
  MIN(original_purchase_date) AS calculated_bc_end_date
FROM tmp_selected_cohort;

-- =====================================================
-- STEP 6: REFUND MATCHING
-- =====================================================
CREATE TEMP TABLE tmp_all_customer_refunds AS
SELECT 
  sc.Updated_Cust_ID,
  sc.original_purchase_date,
  base.Refund_Date,
  base.Refund_Amount_USD,
  base.Order_Id
FROM tmp_selected_cohort sc
INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
  ON sc.Updated_Cust_ID = base.Updated_Cust_ID
  AND base.Product_Name_Final_Merged = p_product_name
  AND (
    (p_afid_suffix IS NULL AND base.AFID IS NULL)
    OR base.AFID = p_afid_suffix
  )
  AND (
    (p_country_code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
    OR (p_country_code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
    OR (p_country_code IS NULL OR p_country_code = '' OR TRIM(p_country_code) = '')
  )
WHERE base.Refund_Amount_USD > 0
  AND base.Refund_Date IS NOT NULL;

CREATE TEMP TABLE tmp_filtered_refunds AS
SELECT 
  acr.*,
  bl.calculated_start_offset_days,
  bl.calculated_end_offset_days,
  bl.Trial_Type
FROM tmp_all_customer_refunds acr
CROSS JOIN tmp_business_logic bl
WHERE acr.Refund_Date BETWEEN 
  DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY) AND
  DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY);

CREATE TEMP TABLE tmp_refund_metrics AS
SELECT 
  CASE 
    WHEN (SELECT Trial_Type FROM tmp_business_logic) = 'NT' AND p_billing_cycle = 0 THEN 0
    ELSE COUNT(DISTINCT Order_Id)
  END AS final_refund_count,
  CASE 
    WHEN (SELECT Trial_Type FROM tmp_business_logic) = 'NT' AND p_billing_cycle = 0 THEN 0.0
    ELSE SUM(Refund_Amount_USD)
  END AS final_refund_amount
FROM tmp_filtered_refunds;

-- =============================================================================
-- OUTPUT 1: SUMMARY ROW — compare cell-by-cell against the extract
-- =============================================================================
SELECT 
  'SUMMARY' AS output_type,
  p_report_date AS Report_date,
  p_product_name AS Product_Name_Final,
  p_afid_suffix AS AFID_Suffix,
  p_billing_cycle AS Billing_Cycle,
  p_country_code AS Country_Code,

  bl.Entity_Name,
  bl.App_Name,
  bl.Trial_Type,
  bl.Trial_Period,
  bl.Currency,
  bl.Trial_Price,
  bl.Regular_Price,

  bl.calculated_regular_bc_period AS Regular_BC_period,
  er.final_exchange_rate AS Exchange_rate,
  bl.calculated_denominator_bc AS Denominator_BC,
  bl.calculated_bc_start_date AS BC_start_date,
  ca.calculated_bc_end_date AS BC_end_date,
  bl.calculated_start_offset_days AS start_offset_days,
  bl.calculated_end_offset_days AS end_offset_days,

  ca.actual_cohort_count AS Cohort_final_users,

  COALESCE(rm.final_refund_count, 0) AS Refund_Count,
  COALESCE(rm.final_refund_amount, 0.0) AS Refund_Amount,

  -- Refund ratio with threshold logic
  CASE 
    WHEN p_billing_cycle = 0 AND bl.Trial_Type = 'NT' THEN 0.0
    WHEN p_billing_cycle = 0 AND bl.Trial_Type != 'NT' THEN 
      CASE 
        WHEN COALESCE(SAFE_DIVIDE(SAFE_DIVIDE(rm.final_refund_amount, NULLIF(bl.Trial_Price * er.final_exchange_rate, 0)), NULLIF(ca.actual_cohort_count, 0)), 0.0) > p_refund_ratio_threshold 
             AND rm.final_refund_count < p_minimum_refund_count 
        THEN 0.0
        ELSE COALESCE(SAFE_DIVIDE(SAFE_DIVIDE(rm.final_refund_amount, NULLIF(bl.Trial_Price * er.final_exchange_rate, 0)), NULLIF(ca.actual_cohort_count, 0)), 0.0)
      END
    ELSE 
      CASE 
        WHEN COALESCE(SAFE_DIVIDE(SAFE_DIVIDE(rm.final_refund_amount, NULLIF(bl.Regular_Price * er.final_exchange_rate, 0)), NULLIF(ca.actual_cohort_count, 0)), 0.0) > p_refund_ratio_threshold 
             AND rm.final_refund_count < p_minimum_refund_count 
        THEN 0.0
        ELSE COALESCE(SAFE_DIVIDE(SAFE_DIVIDE(rm.final_refund_amount, NULLIF(bl.Regular_Price * er.final_exchange_rate, 0)), NULLIF(ca.actual_cohort_count, 0)), 0.0)
      END
  END AS Refund_Ratio

FROM tmp_business_logic bl
CROSS JOIN tmp_exchange_rate er
CROSS JOIN tmp_cohort_analysis ca
CROSS JOIN tmp_refund_metrics rm;

-- =============================================================================
-- OUTPUT 2: COHORT DETAIL — every transaction in the cohort with refund match
-- =============================================================================
SELECT 
  sc.transaction_rank,
  sc.Updated_Cust_ID,
  sc.original_purchase_date,
  bl.calculated_start_offset_days AS start_offset_days,
  bl.calculated_end_offset_days AS end_offset_days,
  DATE_ADD(sc.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY) AS refund_window_start,
  DATE_ADD(sc.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY) AS refund_window_end,
  CASE WHEN fr.Order_Id IS NOT NULL THEN 'YES' ELSE 'NO' END AS has_qualifying_refund,
  fr.Order_Id AS refund_order_id,
  fr.Refund_Date,
  fr.Refund_Amount_USD
FROM tmp_selected_cohort sc
CROSS JOIN tmp_business_logic bl
LEFT JOIN tmp_filtered_refunds fr
  ON sc.Updated_Cust_ID = fr.Updated_Cust_ID
  AND sc.original_purchase_date = fr.original_purchase_date
ORDER BY sc.transaction_rank ASC;

-- =============================================================================
-- OUTPUT 3: REFUND DETAIL — only the qualifying refund records
-- =============================================================================
SELECT 
  fr.Updated_Cust_ID,
  fr.original_purchase_date,
  fr.Refund_Date,
  fr.Refund_Amount_USD,
  fr.Order_Id,
  fr.calculated_start_offset_days,
  fr.calculated_end_offset_days,
  DATE_ADD(fr.original_purchase_date, INTERVAL fr.calculated_start_offset_days DAY) AS window_start,
  DATE_ADD(fr.original_purchase_date, INTERVAL fr.calculated_end_offset_days DAY) AS window_end
FROM tmp_filtered_refunds fr
ORDER BY fr.Refund_Date DESC;

-- =====================================================
-- CLEANUP
-- =====================================================
DROP TABLE IF EXISTS tmp_plan_attributes;
DROP TABLE IF EXISTS tmp_business_logic;
DROP TABLE IF EXISTS tmp_exchange_rate;
DROP TABLE IF EXISTS tmp_eligible_transactions;
DROP TABLE IF EXISTS tmp_selected_cohort;
DROP TABLE IF EXISTS tmp_cohort_analysis;
DROP TABLE IF EXISTS tmp_all_customer_refunds;
DROP TABLE IF EXISTS tmp_filtered_refunds;
DROP TABLE IF EXISTS tmp_refund_metrics;
