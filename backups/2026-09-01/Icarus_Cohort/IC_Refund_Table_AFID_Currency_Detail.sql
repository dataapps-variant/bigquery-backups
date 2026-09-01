
-- =====================================================
-- REFUND TABLE — V3 AFID_SUFFIX, CURRENCY DETAIL
-- Each currency stays as its own row (no Multi collapse)
-- Table: Icarus_Cohort.IC_Refund_Table_AFID_Currency_Detail
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_Currency_Detail` AS

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
    0.00 AS refund_ratio_threshold,
    30 AS minimum_refund_count
),

-- =====================================================
-- PLAN_LIST AGGREGATION
-- Grain: Product × Country_Code × AFID_Suffix × Currency
-- =====================================================
plan_list_ranked AS (
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
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), COALESCE(CAST(AFID_Suffix AS STRING), 'NULL_GROUP'), Currency
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`
  WHERE Product_Name_Final IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    AFID_Suffix,
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
    AFID_Suffix,
    Currency,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`
  WHERE Product_Name_Final IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, AFID_Suffix, Currency
),

aggregated_plan_list AS (
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
  FROM plan_list_first_record fr
  INNER JOIN plan_list_trial_price_avg tp
    ON fr.Product_Name_Final = tp.Product_Name_Final
    AND (
      (fr.Country_Code IS NULL AND tp.Country_Code IS NULL)
      OR fr.Country_Code = tp.Country_Code
    )
    AND (
      (fr.AFID_Suffix IS NULL AND tp.AFID_Suffix IS NULL)
      OR fr.AFID_Suffix = tp.AFID_Suffix
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

afid_suffix_list AS (
  SELECT DISTINCT AFID_Suffix
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
    asl.AFID_Suffix,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.refund_ratio_threshold,
    cfg.minimum_refund_count
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN afid_suffix_list asl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT
-- INNER JOIN drops combos with no Plan_List match
-- =====================================================
enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.AFID_Suffix,
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
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND (
      (mc.AFID_Suffix IS NULL AND apl.AFID_Suffix IS NULL)
      OR mc.AFID_Suffix = apl.AFID_Suffix
    )
    AND (
      (mc.Country_Code IS NULL AND apl.Country_Code IS NULL)
      OR mc.Country_Code = apl.Country_Code
    )
    AND mc.Currency = apl.Currency
),

-- =====================================================
-- BUSINESS LOGIC
-- =====================================================
business_logic AS (
  SELECT 
    em.report_date,
    em.Product_Name_Final,
    em.AFID_Suffix,
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
-- EXCHANGE RATE
-- =====================================================
exchange_rates AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.AFID_Suffix,
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
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.AFID_Suffix, bl.billing_cycle, bl.Country_Code, bl.Currency, bl.calculated_bc_start_date
),

-- =====================================================
-- COHORT SELECTION — WITH CURRENCY FILTER (critical)
-- =====================================================
eligible_transactions AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.AFID_Suffix,
    bl.billing_cycle,
    bl.cohort_size,
    bl.calculated_bc_start_date,
    bl.cohort_selection_bc,
    bl.Country_Code,
    bl.Currency,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.AFID_Suffix, bl.billing_cycle, bl.Country_Code, bl.Currency
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND (
      (bl.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR bl.AFID_Suffix = base.AFID
    )
    AND base.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND bl.Currency = base.Currency                          -- ADDED: Currency filter
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
    AFID_Suffix,
    billing_cycle,
    cohort_size,
    Country_Code,
    Currency,
    Updated_Cust_ID,
    Date_of_Sale as original_purchase_date
  FROM eligible_transactions 
  WHERE transaction_rank <= cohort_size
),

cohort_analysis AS (
  SELECT 
    report_date,
    Product_Name_Final,
    AFID_Suffix,
    billing_cycle,
    Country_Code,
    Currency,
    MIN(original_purchase_date) as calculated_bc_end_date,
    COUNT(*) as actual_cohort_count,
    MAX(cohort_size) as cohort_size
  FROM selected_cohort
  GROUP BY report_date, Product_Name_Final, AFID_Suffix, billing_cycle, Country_Code, Currency
),

-- =====================================================
-- REFUNDS — WITH CURRENCY FILTER (critical)
-- =====================================================
all_customer_refunds AS (
  SELECT 
    sc.report_date,
    sc.Product_Name_Final,
    sc.AFID_Suffix,
    sc.billing_cycle,
    sc.Country_Code,
    sc.Currency,
    sc.Updated_Cust_ID,
    sc.original_purchase_date,
    base.Refund_Date,
    base.Refund_Amount_USD,
    base.Order_Id
  FROM selected_cohort sc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON sc.Updated_Cust_ID = base.Updated_Cust_ID
    AND sc.Product_Name_Final = base.Product_Name_Final_Merged
    AND (
      (sc.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR sc.AFID_Suffix = base.AFID
    )
    AND sc.Currency = base.Currency                          -- ADDED: Currency filter
    AND (
      (sc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (sc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (sc.Country_Code IS NULL OR sc.Country_Code = '' OR TRIM(sc.Country_Code) = '')
    )
  WHERE base.Refund_Amount_USD > 0
    AND base.Refund_Date IS NOT NULL
),

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
    AND (
      (acr.AFID_Suffix IS NULL AND bl.AFID_Suffix IS NULL)
      OR acr.AFID_Suffix = bl.AFID_Suffix
    )
    AND acr.billing_cycle = bl.billing_cycle
    AND acr.Country_Code = bl.Country_Code
    AND acr.Currency = bl.Currency
  WHERE acr.Refund_Date BETWEEN 
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY) AND
    DATE_ADD(acr.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY)
),

refund_metrics AS (
  SELECT 
    fr.report_date,
    fr.Product_Name_Final,
    fr.AFID_Suffix,
    fr.billing_cycle,
    fr.Country_Code,
    fr.Currency,
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
  GROUP BY fr.report_date, fr.Product_Name_Final, fr.AFID_Suffix, fr.billing_cycle, fr.Country_Code, fr.Currency, fr.Trial_Type
)

-- =====================================================
-- FINAL OUTPUT — PER CURRENCY, NO AGGREGATION
-- Grain: Report_date + Product_Name_Final + AFID_Suffix + Country_Code + Currency + Billing_Cycle
-- =====================================================
SELECT 
  bl.report_date AS Report_date,
  bl.Product_Name_Final,
  bl.AFID_Suffix,
  bl.billing_cycle AS Billing_Cycle,
  bl.Country_Code,
  bl.Currency,                              -- << ACTUAL CURRENCY, not 'Multi'
  bl.cohort_size AS Cohort_Size,
  bl.minimum_user_count AS Minimum_User_count,
  bl.retry_engine_period AS Retry_engine_Period,
  bl.Entity_Name,
  CASE 
    WHEN bl.Country_Code IS NULL OR bl.Country_Code = '' THEN bl.App_Name
    ELSE CONCAT(bl.App_Name, '-', bl.Country_Code)
  END AS App_Name,
  bl.Trial_Type,
  bl.Trial_Period,
  bl.Trial_Price,
  bl.Regular_Price,
  bl.calculated_regular_bc_period AS Regular_BC_period,
  er.final_exchange_rate AS Exchange_rate,
  bl.calculated_denominator_bc AS Denominator_BC,
  bl.calculated_bc_start_date AS BC_start_date,
  ca.calculated_bc_end_date AS BC_end_date,
  bl.calculated_start_offset_days AS start_offset_days,
  bl.calculated_end_offset_days AS end_offset_days,

  -- Cohort per currency
  CASE 
    WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size
    ELSE ca.actual_cohort_count
  END AS Cohort_final_users,

  -- Refund amount per currency
  COALESCE(rm.final_refund_amount, 0.0) AS Refund_Amount,

  -- Refund count per currency
  COALESCE(rm.final_refund_count, 0) AS Refund_Count,

  -- Refund Users per currency (NOT summed)
  CASE 
    WHEN bl.billing_cycle = 0 THEN 
      COALESCE(SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Trial_Price * er.final_exchange_rate, 0)), 0.0)
    ELSE 
      COALESCE(SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Regular_Price * er.final_exchange_rate, 0)), 0.0)
  END AS Refund_Users,

  -- Refund Ratio per currency (NOT weighted across currencies)
  CASE
    WHEN bl.billing_cycle = 0 AND bl.Trial_Type = 'NT' THEN 0.0
    WHEN bl.billing_cycle = 0 THEN
      CASE
        WHEN COALESCE(
               SAFE_DIVIDE(
                 SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Trial_Price * er.final_exchange_rate, 0)),
                 NULLIF(CASE WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size ELSE ca.actual_cohort_count END, 0)
               ), 0.0
             ) > bl.refund_ratio_threshold
             AND COALESCE(rm.final_refund_count, 0) < bl.minimum_refund_count
        THEN 0.0
        ELSE COALESCE(
               SAFE_DIVIDE(
                 SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Trial_Price * er.final_exchange_rate, 0)),
                 NULLIF(CASE WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size ELSE ca.actual_cohort_count END, 0)
               ), 0.0
             )
      END
    ELSE
      CASE
        WHEN COALESCE(
               SAFE_DIVIDE(
                 SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Regular_Price * er.final_exchange_rate, 0)),
                 NULLIF(CASE WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size ELSE ca.actual_cohort_count END, 0)
               ), 0.0
             ) > bl.refund_ratio_threshold
             AND COALESCE(rm.final_refund_count, 0) < bl.minimum_refund_count
        THEN 0.0
        ELSE COALESCE(
               SAFE_DIVIDE(
                 SAFE_DIVIDE(COALESCE(rm.final_refund_amount, 0.0), NULLIF(bl.Regular_Price * er.final_exchange_rate, 0)),
                 NULLIF(CASE WHEN ca.actual_cohort_count = ca.cohort_size THEN ca.cohort_size ELSE ca.actual_cohort_count END, 0)
               ), 0.0
             )
      END
  END AS Refund_Ratio

FROM business_logic bl
LEFT JOIN exchange_rates er
  ON bl.report_date = er.report_date 
  AND bl.Product_Name_Final = er.Product_Name_Final 
  AND (
    (bl.AFID_Suffix IS NULL AND er.AFID_Suffix IS NULL)
    OR bl.AFID_Suffix = er.AFID_Suffix
  )
  AND bl.billing_cycle = er.billing_cycle
  AND bl.Country_Code = er.Country_Code
  AND bl.Currency = er.Currency
LEFT JOIN cohort_analysis ca
  ON bl.report_date = ca.report_date 
  AND bl.Product_Name_Final = ca.Product_Name_Final 
  AND (
    (bl.AFID_Suffix IS NULL AND ca.AFID_Suffix IS NULL)
    OR bl.AFID_Suffix = ca.AFID_Suffix
  )
  AND bl.billing_cycle = ca.billing_cycle
  AND bl.Country_Code = ca.Country_Code
  AND bl.Currency = ca.Currency
LEFT JOIN refund_metrics rm
  ON bl.report_date = rm.report_date 
  AND bl.Product_Name_Final = rm.Product_Name_Final 
  AND (
    (bl.AFID_Suffix IS NULL AND rm.AFID_Suffix IS NULL)
    OR bl.AFID_Suffix = rm.AFID_Suffix
  )
  AND bl.billing_cycle = rm.billing_cycle
  AND bl.Country_Code = rm.Country_Code
  AND bl.Currency = rm.Currency
ORDER BY bl.report_date DESC, bl.Product_Name_Final, bl.AFID_Suffix, bl.Country_Code, bl.Currency, bl.billing_cycle;
