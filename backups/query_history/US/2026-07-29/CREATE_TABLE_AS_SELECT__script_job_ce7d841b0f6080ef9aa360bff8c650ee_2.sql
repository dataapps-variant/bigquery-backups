-- job_id: script_job_ce7d841b0f6080ef9aa360bff8c650ee_2
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:01:13.526000+00:00
-- started: 2026-07-29T09:01:14.190000+00:00
-- ended: 2026-07-29T09:02:58.996000+00:00

CREATE TEMP TABLE temp_core AS

WITH
config AS (
  SELECT 7 AS recent_cac_days
),

-- =====================================================
-- CONDITIONAL FINAL COHORT SELECTION


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
FROM temp_cohort ics
  INNER JOIN temp_bc bedc
    ON ics.report_date = bedc.report_date
    AND ics.Product_Name_Final = bedc.Product_Name_Final
    AND ics.Country_Code = bedc.Country_Code
    AND ics.billing_cycle = bedc.billing_cycle
  WHERE bedc.cohort_method = 'use_selected_cohort'
  
  UNION ALL
  
  -- Use fresh join when constrained by limiting_days
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    bedc.calculated_denominator_bc,
    base.Updated_Cust_ID,
    base.Order_Price_Net_of_Tax_USD,
    'fresh_join' as final_cohort_source
  FROM temp_bc bedc
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
    
  FROM temp_bc bedc
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
-- DAY_0 METRICS CALCULATION
-- On-time rebills only (Delay_days_SOT <= 0 or NULL)
-- UPDATED: Product_Name_Final_Merged
-- =====================================================
day_0_metrics AS (
  SELECT 
    fc_distinct.report_date,
    fc_distinct.Product_Name_Final,
    fc_distinct.Country_Code,
    fc_distinct.billing_cycle,
    fc_distinct.calculated_denominator_bc,
    COUNT(rebill.Updated_Cust_ID) as final_day_0_user,
    SUM(rebill.Order_Price_Net_of_Tax_USD) as final_day_0_values
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
  INNER JOIN temp_bc bedc
    ON fc_distinct.report_date = bedc.report_date
    AND fc_distinct.Product_Name_Final = bedc.Product_Name_Final
    AND fc_distinct.Country_Code = bedc.Country_Code
    AND fc_distinct.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` rebill
    ON fc_distinct.Updated_Cust_ID = rebill.Updated_Cust_ID
    AND fc_distinct.Product_Name_Final = rebill.Product_Name_Final_Merged  -- CHANGED
    AND rebill.Billing_Cycle_Updated = fc_distinct.calculated_denominator_bc + 1
    AND (rebill.Delay_days_SOT <= 0 OR rebill.Delay_days_SOT IS NULL)
    AND (
      (bedc.Country_Code = 'JP' AND rebill.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (rebill.Spend_Country_Code_AFID != 'JP' OR rebill.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  GROUP BY fc_distinct.report_date, fc_distinct.Product_Name_Final, fc_distinct.Country_Code, fc_distinct.billing_cycle, fc_distinct.calculated_denominator_bc
),

-- =====================================================
-- SINGLE SALES USERS CALCULATION
-- UPDATED: Product_Name_Final_Main_Merged
-- =====================================================
single_sales_users_metrics AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    COUNT(DISTINCT ss.Order_Id) as final_ss_users
  FROM temp_bc bedc
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
-- SINGLE SALES CALCULATION
-- UPDATED: Product_Name_Final_Main_Merged
-- =====================================================
single_sales_metrics AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    SUM(ss.Order_Price_Net_of_Tax_Allocated_USD) as final_single_sale_value
  FROM temp_bc bedc
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
  FROM temp_bc bedc
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
  FROM temp_bc bedc
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
  INNER JOIN temp_bc bedc
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
  INNER JOIN temp_bc bedc
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
-- SOT_RATIO LOOKUP
-- UPDATED: ICARUS_Multi.7k_SOT_Ratio
-- =====================================================
sot_ratio_lookup AS (
  SELECT 
    bedc.report_date,
    bedc.Product_Name_Final,
    bedc.Country_Code,
    bedc.billing_cycle,
    COALESCE(sot.SOT_Ratio, 0) as final_sot_ratio
  FROM temp_bc bedc
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.7k_SOT_Ratio` sot  -- CHANGED
    ON bedc.report_date = sot.Report_date
    AND bedc.Product_Name_Final = sot.Product_Name_Final
    AND bedc.Country_Code = sot.Country_Code
    AND bedc.billing_cycle = sot.Billing_Cycle
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
    bedc.Trial_Type,
    
    COUNT(DISTINCT base.Updated_Cust_ID) as final_t30d_new_users
    
  FROM (
    SELECT DISTINCT report_date, Product_Name_Final, Country_Code, Trial_Type
    FROM temp_bc
  ) bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Product_Name_Final_Merged = bedc.Product_Name_Final  -- CHANGED
    AND base.Date_of_Sale BETWEEN DATE_SUB(bedc.report_date, INTERVAL 29 DAY) AND bedc.report_date
    AND base.Billing_Cycle_Updated = CASE 
      WHEN bedc.Trial_Type = 'NT' THEN 1
      ELSE 0
    END
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Trial_Type
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
    
    -- Day_0 metrics
    CASE 
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
      THEN COALESCE(sm.final_subscription_users, 0)
      ELSE COALESCE(d0m.final_day_0_user, 0)
    END as clean_day_0_user,
    
    CASE 
      WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
      THEN COALESCE(sm.final_subscription_value, 0)
      ELSE COALESCE(d0m.final_day_0_values, 0)
    END as clean_day_0_values,
    
    -- SOT_Ratio
    sot.final_sot_ratio as clean_sot_ratio,
    
    -- Crystal Ball metrics
    COALESCE(
      SAFE_DIVIDE(
        CASE 
          WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
          THEN COALESCE(sm.final_subscription_users, 0)
          ELSE COALESCE(d0m.final_day_0_user, 0)
        END,
        NULLIF(sot.final_sot_ratio, 0)
      ),
      0
    ) as clean_cb_user,
    
    COALESCE(
      SAFE_DIVIDE(
        CASE 
          WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0, 1)) OR bedc.billing_cycle = 0 
          THEN COALESCE(sm.final_subscription_value, 0)
          ELSE COALESCE(d0m.final_day_0_values, 0)
        END,
        NULLIF(sot.final_sot_ratio, 0)
      ),
      0
    ) as clean_cb_value,
    
    COALESCE(ssum.final_ss_users, 0) as clean_ss_users,
    COALESCE(ssm.final_single_sale_value, 0) as clean_single_sale_value,
    COALESCE(asm.final_spend_amount, 0) as clean_spend_amount,
    COALESCE(rsm.final_recent_spend, 0) as clean_recent_spend,
    COALESCE(rum.final_recent_users, 0) as clean_recent_users,
    COALESCE(t30d.final_t30d_new_users, 0) as clean_t30d_new_users
    
  FROM temp_bc bedc
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
  LEFT JOIN day_0_metrics d0m
    ON bedc.report_date = d0m.report_date 
    AND bedc.Product_Name_Final = d0m.Product_Name_Final 
    AND bedc.Country_Code = d0m.Country_Code
    AND bedc.billing_cycle = d0m.billing_cycle
  LEFT JOIN sot_ratio_lookup sot
    ON bedc.report_date = sot.report_date 
    AND bedc.Product_Name_Final = sot.Product_Name_Final 
    AND bedc.Country_Code = sot.Country_Code
    AND bedc.billing_cycle = sot.billing_cycle
  LEFT JOIN single_sales_users_metrics ssum
    ON bedc.report_date = ssum.report_date 
    AND bedc.Product_Name_Final = ssum.Product_Name_Final 
    AND bedc.Country_Code = ssum.Country_Code
    AND bedc.billing_cycle = ssum.billing_cycle
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
  LEFT JOIN t30d_new_users_calc t30d
    ON bedc.report_date = t30d.report_date 
    AND bedc.Product_Name_Final = t30d.Product_Name_Final 
     AND bedc.Country_Code = t30d.Country_Code
)

SELECT * FROM core_metrics
