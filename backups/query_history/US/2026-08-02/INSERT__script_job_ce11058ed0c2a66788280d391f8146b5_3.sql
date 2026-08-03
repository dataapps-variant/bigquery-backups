-- job_id: script_job_ce11058ed0c2a66788280d391f8146b5_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-08-02T08:45:04.303000+00:00
-- started: 2026-08-02T08:45:04.557000+00:00
-- ended: 2026-08-02T08:46:14.587000+00:00

INSERT INTO `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`

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
    7000 AS cohort_size,
    1000 AS limiting_days,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
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
-- =====================================================
-- PLAN_LIST AGGREGATION (UPDATED - reads from Sticky_data_API_original_V_Merged_TBL + Sticky_Dim_Product)
-- Handles multiple rows per Product_Name_Final + Country_Code
-- =====================================================
plan_list_base AS (
  SELECT 
    main.Product_Name_Final_Merged AS Product_Name_Final,
    CASE 
      WHEN main.App_Name = 'CT' THEN 
        CASE 
          WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
          ELSE 'Non-JP'
        END
      ELSE ''
    END AS Country_Code,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    main.Trial_Price,
    COALESCE(
      MIN(CASE WHEN dim.Currency = main.Currency THEN dim.Product_Price END),
      MIN(CASE WHEN TRIM(COALESCE(dim.Currency, '')) = '' THEN dim.Product_Price END)
    ) AS Regular_Price
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` main
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product` dim
    ON CONCAT(dim.Entity, dim.Product_Name_updated) = CONCAT(
        main.Entity_Name,
        REGEXP_EXTRACT(main.Product_Name_Final_Merged, r'^.{2}(\d+)')
    )
    AND (dim.Currency = main.Currency OR TRIM(COALESCE(dim.Currency, '')) = '')
  WHERE main.Product_Name_Final_Merged IS NOT NULL
    AND main.Product_Name_Final_Merged != ''
    AND RIGHT(main.Product_Name_Final_Merged, 2) != 'SS'
    AND main.Billing_Cycle_Updated BETWEEN 0 AND 12
    AND main.Date_of_Sale >= DATE('2025-01-01')
  GROUP BY 
    main.Product_Name_Final_Merged,
    main.Entity_Name,
    main.App_Name,
    main.Trial_Type,
    main.Trial_Period,
    main.Currency,
    main.Trial_Price,
    CASE 
      WHEN main.App_Name = 'CT' THEN 
        CASE 
          WHEN main.Spend_Country_Code_AFID = 'JP' THEN 'JP'
          ELSE 'Non-JP'
        END
      ELSE ''
    END
),

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
  FROM plan_list_base
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
  FROM plan_list_base
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

-- =====================================================
-- FIRST DATE OF SALE (inline, covers inactive plans too)
-- =====================================================
plan_first_sale AS (
  SELECT
    Product_Name_Final_Merged AS Product_Name_Final,
    CASE 
      WHEN App_Name = 'CT' THEN 
        CASE WHEN Spend_Country_Code_AFID = 'JP' THEN 'JP' ELSE 'Non-JP' END
      ELSE ''
    END AS Country_Code,
    GREATEST(MIN(Date_of_Sale), DATE '2025-01-01') AS First_Date_of_Sale
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Product_Name_Final_Merged IS NOT NULL
    AND Product_Name_Final_Merged != ''
    AND RIGHT(Product_Name_Final_Merged, 2) != 'SS'
    AND Billing_Cycle_Updated BETWEEN 0 AND 12
    AND Date_of_Sale >= DATE('2025-01-01')
  GROUP BY 1, 2
),

-- =====================================================
-- PRODUCT LIST (UPDATED TO USE INLINE FIRST SALE)
-- =====================================================
product_list AS (
  SELECT
    apl.Product_Name_Final,
    apl.Country_Code,
    pfs.First_Date_of_Sale
  FROM aggregated_plan_list apl
  INNER JOIN plan_first_sale pfs
    ON apl.Product_Name_Final = pfs.Product_Name_Final
    AND (
      (apl.Country_Code IS NULL AND pfs.Country_Code IS NULL)
      OR apl.Country_Code = pfs.Country_Code
    )
  WHERE apl.Product_Name_Final IS NOT NULL
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
  WHERE rd.report_date >= pl.First_Date_of_Sale                 -- EDIT: drops report dates before each plan's launch
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT (UPDATED JOIN)
-- =====================================================
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
-- INITIAL COHORT SELECTION (7K TRANSACTIONS)
-- UPDATED: Product_Name_Final_Merged
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
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged  -- CHANGED
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
    
    -- BC_end_date calculation
    CASE 
      WHEN bl.Trial_Type = 'NT' AND bl.billing_cycle = 0 THEN bl.report_date
      WHEN COALESCE(ca.oldest_transaction_date, bl.calculated_bc_start_date) >= 
           DATE_SUB(bl.calculated_bc_start_date, INTERVAL bl.limiting_days DAY) 
      THEN COALESCE(ca.oldest_transaction_date, bl.calculated_bc_start_date)
      ELSE DATE_SUB(bl.calculated_bc_start_date, INTERVAL bl.limiting_days DAY)
    END AS calculated_bc_end_date,
    
    -- Determine cohort selection method
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
-- UPDATED: Product_Name_Final_Merged
-- =====================================================
final_cohort AS (
  -- Use initial selection when within limiting_days
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
  
  -- Use fresh join when constrained by limiting_days
  -- UPDATED: Product_Name_Final_Merged
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
    ON bedc.Product_Name_Final = base.Product_Name_Final_Merged  -- CHANGED
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
-- UPDATED: Product_Name_Final_Merged
-- =====================================================
rebill_metrics AS (
  SELECT 
    fc_distinct.report_date,
    fc_distinct.Product_Name_Final,
    fc_distinct.Country_Code,
    fc_distinct.billing_cycle,
    fc_distinct.calculated_denominator_bc,
COUNT(rebill.Updated_Cust_ID) as final_rebill_users,
    SUM(rebill.Order_Price_Net_of_Tax_USD) as final_rebill_value,
    COUNT(CASE WHEN rebill.Delay_days_SOT <= 0 OR rebill.Delay_days_SOT IS NULL THEN rebill.Updated_Cust_ID END) as final_day_0_users
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
    AND fc_distinct.Product_Name_Final = rebill.Product_Name_Final_Merged  -- CHANGED
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
-- UPDATED: Product_Name_Final_Main_Merged
-- =====================================================
single_sales_metrics AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    
    -- SS_Users: Count of distinct customers in Single Sales
    COUNT(DISTINCT ss.Updated_Cust_ID) as final_ss_users,
    
    -- Single_Sale_Value: Sum of allocated USD
    SUM(ss.Order_Price_Net_of_Tax_Allocated_USD) as final_single_sale_value
    
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON bedc.Product_Name_Final = ss.Product_Name_Final_Main_Merged  -- CHANGED
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
-- UPDATED: Product_Name_Final_Merged
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
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged  -- CHANGED
    AND ads.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) 
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
),

-- =====================================================
-- RECENT SPEND DATE WINDOW CALCULATION
-- UPDATED: Product_Name_Final_Merged
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
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged  -- CHANGED
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
-- UPDATED: Product_Name_Final_Merged
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
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged  -- CHANGED
    AND ads.Date BETWEEN rdr.recent_start_date AND rdr.recent_end_date
  GROUP BY rdr.report_date, rdr.Product_Name_Final, rdr.Country_Code, rdr.billing_cycle, 
           rdr.recent_start_date, rdr.recent_end_date, bedc.Country_Code
),

-- =====================================================
-- RECENT USERS CALCULATION
-- UPDATED: Product_Name_Final_Merged
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
    ON bedc.Product_Name_Final = base.Product_Name_Final_Merged  -- CHANGED
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
-- T30D NEW USERS CALCULATION
-- UPDATED: Product_Name_Final_Merged
-- =====================================================
t30d_new_users_calc AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    
    COUNT(DISTINCT base.Updated_Cust_ID) as final_t30d_new_users
    
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bedc.Product_Name_Final = base.Product_Name_Final_Merged  -- CHANGED
    AND base.Date_of_Sale BETWEEN DATE_SUB(bedc.report_date, INTERVAL 30 DAY) AND DATE_SUB(bedc.report_date, INTERVAL 1 DAY)
    AND base.Billing_Cycle_Updated = CASE 
      WHEN bedc.Trial_Type = 'NT' THEN 1
      ELSE 0
    END
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) 
     OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.billing_cycle
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
    
    CASE 
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
      THEN COALESCE(sm.final_subscription_users, 0)
      ELSE COALESCE(rm.final_day_0_users, 0)
    END as clean_day_0_users,
    
    COALESCE(ssm.final_ss_users, 0) as clean_ss_users,
    COALESCE(ssm.final_single_sale_value, 0) as clean_single_sale_value,
    COALESCE(asm.final_spend_amount, 0) as clean_spend_amount,
    COALESCE(rsm.final_recent_spend, 0) as clean_recent_spend,
    COALESCE(rum.final_recent_users, 0) as clean_recent_users,
    COALESCE(t30.final_t30d_new_users, 0) as clean_t30d_new_users
    
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
  LEFT JOIN t30d_new_users_calc t30
    ON bedc.report_date = t30.report_date 
    AND bedc.Product_Name_Final = t30.Product_Name_Final 
    AND bedc.Country_Code = t30.Country_Code
    AND bedc.billing_cycle = t30.billing_cycle
),

-- =====================================================
-- BASE RATIOS CALCULATION
-- Calculate base metrics before retention logic
-- =====================================================
base_ratios AS (
  SELECT 
    cm.*,
    
    -- Base churn rate (before NULL logic)
    CASE 
      WHEN cm.billing_cycle = 0 THEN 0.00
      WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_rebill_users, NULLIF(cm.clean_subscription_users, 0)), 0)
    END as base_churn_rate,
    
    -- Base refund ratio (from table)
    COALESCE(rt.Refund_Ratio, 0.00) as base_refund_ratio,
    
    -- Base CAC
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_spend_amount, NULLIF(cm.clean_subscription_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_cac,
    
    -- Base Recent_CAC
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_recent_spend, NULLIF(cm.clean_recent_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_recent_cac
    
  FROM core_metrics cm
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.Refund_Table` rt
    ON cm.report_date = rt.Report_date 
    AND cm.Product_Name_Final = rt.Product_Name_Final 
    AND cm.Country_Code = rt.Country_Code
    AND cm.billing_cycle = rt.Billing_Cycle
),

-- =====================================================
-- RETENTION RATE CALCULATION WITH NULL CASCADE
-- 12 BILLING CYCLES (BC0-BC12)
-- UPDATED: Rebill_users < 25 → NULL (not 0.0)
-- =====================================================
retention_step_0 AS (
  SELECT 
    br.*,
    CASE 
      -- Non-NT BC0: NULL if Subscription_users = 0 OR Rebill_users < minimum_rebill_users
      WHEN br.billing_cycle = 0 AND br.Trial_Type != 'NT' 
        AND (br.clean_subscription_users = 0 OR br.clean_rebill_users < br.minimum_rebill_users) THEN NULL
      WHEN br.billing_cycle = 0 THEN 1.0
      
      -- NT BC1: NULL if Subscription_users = 0 OR Rebill_users < minimum_rebill_users
      WHEN br.Trial_Type = 'NT' AND br.billing_cycle = 1 
        AND (br.clean_subscription_users = 0 OR br.clean_rebill_users < br.minimum_rebill_users) THEN NULL
      WHEN br.Trial_Type = 'NT' AND br.billing_cycle = 1 THEN 1.0
      
      ELSE NULL
    END as step_0_retention
  FROM base_ratios br
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
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs0.clean_rebill_users < rs0.minimum_rebill_users THEN NULL
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
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs1.clean_rebill_users < rs1.minimum_rebill_users THEN NULL
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
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs2.clean_rebill_users < rs2.minimum_rebill_users THEN NULL
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
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs3.clean_rebill_users < rs3.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code
            ORDER BY rs3.billing_cycle
          ) * (1 - rs3.base_churn_rate)
        END
      ELSE NULL
    END as step_4_retention
  FROM retention_step_3 rs3
),

retention_step_5 AS (
  SELECT 
    rs4.*,
    CASE 
      WHEN rs4.step_4_retention IS NOT NULL THEN rs4.step_4_retention
      WHEN rs4.billing_cycle = 5 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs4.step_4_retention) OVER (
            PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code
            ORDER BY rs4.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs4.clean_rebill_users < rs4.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs4.step_4_retention) OVER (
            PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code
            ORDER BY rs4.billing_cycle
          ) * (1 - rs4.base_churn_rate)
        END
      ELSE NULL
    END as step_5_retention
  FROM retention_step_4 rs4
),

retention_step_6 AS (
  SELECT 
    rs5.*,
    CASE 
      WHEN rs5.step_5_retention IS NOT NULL THEN rs5.step_5_retention
      WHEN rs5.billing_cycle = 6 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs5.step_5_retention) OVER (
            PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code
            ORDER BY rs5.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs5.clean_rebill_users < rs5.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs5.step_5_retention) OVER (
            PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code
            ORDER BY rs5.billing_cycle
          ) * (1 - rs5.base_churn_rate)
        END
      ELSE NULL
    END as step_6_retention
  FROM retention_step_5 rs5
),

retention_step_7 AS (
  SELECT 
    rs6.*,
    CASE 
      WHEN rs6.step_6_retention IS NOT NULL THEN rs6.step_6_retention
      WHEN rs6.billing_cycle = 7 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs6.step_6_retention) OVER (
            PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code
            ORDER BY rs6.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs6.clean_rebill_users < rs6.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs6.step_6_retention) OVER (
            PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code
            ORDER BY rs6.billing_cycle
          ) * (1 - rs6.base_churn_rate)
        END
      ELSE NULL
    END as step_7_retention
  FROM retention_step_6 rs6
),

retention_step_8 AS (
  SELECT 
    rs7.*,
    CASE 
      WHEN rs7.step_7_retention IS NOT NULL THEN rs7.step_7_retention
      WHEN rs7.billing_cycle = 8 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs7.step_7_retention) OVER (
            PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code
            ORDER BY rs7.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs7.clean_rebill_users < rs7.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs7.step_7_retention) OVER (
            PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code
            ORDER BY rs7.billing_cycle
          ) * (1 - rs7.base_churn_rate)
        END
      ELSE NULL
    END as step_8_retention
  FROM retention_step_7 rs7
),

retention_step_9 AS (
  SELECT 
    rs8.*,
    CASE 
      WHEN rs8.step_8_retention IS NOT NULL THEN rs8.step_8_retention
      WHEN rs8.billing_cycle = 9 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs8.step_8_retention) OVER (
            PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code
            ORDER BY rs8.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs8.clean_rebill_users < rs8.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs8.step_8_retention) OVER (
            PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code
            ORDER BY rs8.billing_cycle
          ) * (1 - rs8.base_churn_rate)
        END
      ELSE NULL
    END as step_9_retention
  FROM retention_step_8 rs8
),

retention_step_10 AS (
  SELECT 
    rs9.*,
    CASE 
      WHEN rs9.step_9_retention IS NOT NULL THEN rs9.step_9_retention
      WHEN rs9.billing_cycle = 10 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs9.step_9_retention) OVER (
            PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code
            ORDER BY rs9.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs9.clean_rebill_users < rs9.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs9.step_9_retention) OVER (
            PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code
            ORDER BY rs9.billing_cycle
          ) * (1 - rs9.base_churn_rate)
        END
      ELSE NULL
    END as step_10_retention
  FROM retention_step_9 rs9
),

retention_step_11 AS (
  SELECT 
    rs10.*,
    CASE 
      WHEN rs10.step_10_retention IS NOT NULL THEN rs10.step_10_retention
      WHEN rs10.billing_cycle = 11 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs10.step_10_retention) OVER (
            PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code
            ORDER BY rs10.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs10.clean_rebill_users < rs10.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs10.step_10_retention) OVER (
            PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code
            ORDER BY rs10.billing_cycle
          ) * (1 - rs10.base_churn_rate)
        END
      ELSE NULL
    END as step_11_retention
  FROM retention_step_10 rs10
),

retention_step_12 AS (
  SELECT 
    rs11.*,
    CASE 
      WHEN rs11.step_11_retention IS NOT NULL THEN rs11.step_11_retention
      WHEN rs11.billing_cycle = 12 THEN 
        CASE
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code
            ORDER BY rs11.billing_cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs11.clean_rebill_users < rs11.minimum_rebill_users THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code
            ORDER BY rs11.billing_cycle
          ) * (1 - rs11.base_churn_rate)
        END
      ELSE rs11.step_11_retention
    END as final_retention_rate
  FROM retention_step_11 rs11
),

-- =====================================================
-- FINAL CALCULATIONS
-- ALL metrics become NULL when Retention_rate IS NULL
-- =====================================================
final_calculations AS (
  SELECT 
    rs12.*,
    
    -- All metrics NULL when Retention_rate IS NULL
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.base_churn_rate
    END as final_churn_rate,
    
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.base_refund_ratio
    END as final_refund_ratio,
    
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.base_cac
    END as final_cac,
    
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.base_recent_cac
    END as final_recent_cac,
    
    -- NET_Retention_rate
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.final_retention_rate - rs12.base_refund_ratio
    END as final_net_retention_rate,
    
    -- ARPU
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      WHEN rs12.billing_cycle = 0 THEN 
        rs12.final_retention_rate * rs12.Trial_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
      ELSE 
        rs12.final_retention_rate * rs12.Regular_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
    END as final_arpu,
    
    -- ARPU_Discounted
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.clean_rebill_value, NULLIF(rs12.clean_rebill_users, 0)) * rs12.final_retention_rate,
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
    END as final_arpu_discounted,
    
    -- Net_ARPU
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      WHEN rs12.billing_cycle = 0 THEN 
        (rs12.final_retention_rate - rs12.base_refund_ratio) * rs12.Trial_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
      ELSE 
        (rs12.final_retention_rate - rs12.base_refund_ratio) * rs12.Regular_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
    END as final_net_arpu,
    
    -- Net_ARPU_Discounted
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.clean_rebill_value, NULLIF(rs12.clean_rebill_users, 0)) * (rs12.final_retention_rate - rs12.base_refund_ratio),
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
    END as final_net_arpu_discounted
    
  FROM retention_step_12 rs12
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
    END as final_net_ltv_discounted,
    
    -- Active/Inactive Status
    CASE 
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
    
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
-- FINAL OUTPUT (50 COLUMNS)
-- =====================================================
SELECT 
  -- Primary Dimensions
  fop.report_date as Report_date,
  fop.Product_Name_Final,
  fop.active_inactive_status as Active_Inactive,
  fop.billing_cycle as Billing_Cycle,
  
  -- Configuration Variables
  fop.cohort_size as Cohort_Size,
  fop.limiting_days as Limiting_days,
  fop.minimum_rebill_users as Minimum_Rebill_Count,
  fop.retry_engine_period as Retry_engine_Period,
  
  -- Product Details
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
  
  -- Calculated Dates
  fop.calculated_bc_start_date as BC_start_date,
  fop.calculated_bc_end_date as BC_end_date,
  fop.calculated_denominator_bc as Denominator_BC,
  
  -- Cohort Diagnostics
  fop.clean_cohort_source as cohort_source,
  
  -- User & Revenue Metrics
  fop.clean_subscription_users as Subscription_users,
  fop.clean_subscription_value as Subscription_value,
  fop.clean_rebill_users as Rebill_users,
  fop.clean_day_0_users as Day_0_Users,
  SAFE_DIVIDE(fop.clean_day_0_users, NULLIF(fop.clean_rebill_users, 0)) as Actual_SOT,
  fop.clean_rebill_value as Rebill_value,
  fop.clean_ss_users as SS_Users,
  fop.clean_single_sale_value as Single_Sale_Value,
  fop.clean_spend_amount as Spend_amount,
  fop.clean_recent_spend as Recent_Spend,
  fop.clean_recent_users as Recent_Users,
  
  -- Performance Ratios
  fop.final_churn_rate as Churn_rate,
  fop.final_refund_ratio as Refund_ratio,
  fop.final_cac as CAC,
  fop.final_recent_cac as Recent_CAC,
  fop.final_retention_rate as Retention_rate,
  fop.final_net_retention_rate as NET_Retention_rate,
  
  -- ARPU Metrics
  fop.final_arpu as ARPU,
  fop.final_arpu_discounted as ARPU_Discounted,
  fop.final_net_arpu as Net_ARPU,
  fop.final_net_arpu_discounted as Net_ARPU_Discounted,
  
  -- LTV Calculations
  fop.final_net_ltv as Net_LTV,
  fop.final_net_ltv_discounted as Net_LTV_Discounted,
  
  -- T30D New Users (LAST COLUMN)
  fop.clean_t30d_new_users as T30D_New_Users

FROM final_output_prep fop
ORDER BY fop.report_date DESC, fop.Product_Name_Final, fop.Country_Code, fop.billing_cycle
