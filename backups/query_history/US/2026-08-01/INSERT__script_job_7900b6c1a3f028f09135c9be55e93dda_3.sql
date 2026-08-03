-- job_id: script_job_7900b6c1a3f028f09135c9be55e93dda_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-08-01T08:45:06.572000+00:00
-- started: 2026-08-01T08:45:06.808000+00:00
-- ended: 2026-08-01T08:45:49.330000+00:00

INSERT INTO `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`

  -- =====================================================
  -- ▼▼▼ PASTE YOUR QUERY BELOW (from WITH to final SELECT) ▼▼▼
  -- =====================================================

WITH 
config AS (
  SELECT 
   new_end_date AS report_start_date,
    new_start_date AS report_end_date,
    7000 AS cohort_size,
    30 AS limiting_days,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    7 AS recent_cac_days,
    25 AS minimum_rebill_users
),

plan_list_ranked AS (
  SELECT 
    Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
    Entity_Name, App_Name, Trial_Type, Trial_Period, Currency,
    Trial_Price, Regular_Price, First_Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), Spend_Country_Code_AFID
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `Icarus_Spend_Country_AFID.SCA_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND Spend_Country_Code_AFID IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
    Entity_Name, App_Name, Trial_Type, Trial_Period, Currency,
    Regular_Price, First_Date_of_Sale
  FROM plan_list_ranked WHERE rn = 1
),

plan_list_trial_price_avg AS (
  SELECT 
    Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
    AVG(Trial_Price) AS Trial_Price
  FROM `Icarus_Spend_Country_AFID.SCA_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND Spend_Country_Code_AFID IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, Spend_Country_Code_AFID
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final, fr.Country_Code, fr.Spend_Country_Code_AFID,
    fr.Entity_Name, fr.App_Name, fr.Trial_Type, fr.Trial_Period,
    fr.Currency, fr.Regular_Price, fr.First_Date_of_Sale, tp.Trial_Price
  FROM plan_list_first_record fr
  INNER JOIN plan_list_trial_price_avg tp
    ON fr.Product_Name_Final = tp.Product_Name_Final
    AND fr.Spend_Country_Code_AFID = tp.Spend_Country_Code_AFID
    AND ((fr.Country_Code IS NULL AND tp.Country_Code IS NULL) OR fr.Country_Code = tp.Country_Code)
),

report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
  (SELECT report_end_date FROM config),    -- new_start_date (earlier)
    (SELECT report_start_date FROM config),  -- new_end_date (later)
    INTERVAL 1 DAY
  )) AS report_date
),

sca_product_combinations AS (
  SELECT DISTINCT Product_Name_Final, Country_Code, Spend_Country_Code_AFID, First_Date_of_Sale
  FROM aggregated_plan_list
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

master_combinations AS (
  SELECT 
    rd.report_date, spc.Product_Name_Final, spc.Country_Code, spc.Spend_Country_Code_AFID,
    bcr.billing_cycle, cfg.cohort_size, cfg.limiting_days, cfg.minimum_user_count,
    cfg.retry_engine_period, cfg.default_regular_bc_period, cfg.minimum_rebill_users
  FROM report_dates rd
  CROSS JOIN sca_product_combinations spc
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
  WHERE rd.report_date >= spc.First_Date_of_Sale
),

enriched_master AS (
  SELECT mc.*, apl.Entity_Name, apl.App_Name, apl.Trial_Type, apl.Trial_Period,
    apl.Currency, apl.Trial_Price, apl.Regular_Price
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Country_Code = apl.Country_Code
    AND mc.Spend_Country_Code_AFID = apl.Spend_Country_Code_AFID
),

business_logic AS (
  SELECT em.*,
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

raw_eligible_transactions AS (
  SELECT 
    bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.Spend_Country_Code_AFID,
    bl.billing_cycle, bl.calculated_bc_start_date, bl.calculated_denominator_bc,
    base.Updated_Cust_ID, base.Date_of_Sale, base.Order_Price_Net_of_Tax_USD,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.Spend_Country_Code_AFID, bl.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Spend_Country_Code_AFID = bl.Spend_Country_Code_AFID
    AND base.Billing_Cycle_Updated = bl.calculated_denominator_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
),

initial_cohort_selection AS (
  SELECT report_date, Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
    billing_cycle, calculated_bc_start_date, calculated_denominator_bc,
    Updated_Cust_ID, Date_of_Sale, Order_Price_Net_of_Tax_USD
  FROM raw_eligible_transactions 
  WHERE transaction_rank <= (SELECT cohort_size FROM config)
),

cohort_analysis AS (
  SELECT report_date, Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
    billing_cycle, calculated_bc_start_date,
    MIN(Date_of_Sale) as oldest_transaction_date,
    COUNT(*) as total_transactions,
    COUNT(DISTINCT Updated_Cust_ID) as unique_customers
  FROM initial_cohort_selection
  GROUP BY report_date, Product_Name_Final, Country_Code, Spend_Country_Code_AFID, billing_cycle, calculated_bc_start_date
),

bc_end_date_calculation AS (
  SELECT bl.*, ca.oldest_transaction_date, ca.total_transactions, ca.unique_customers,
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
      THEN 'use_selected_cohort' ELSE 'use_fresh_join'
    END AS cohort_method
  FROM business_logic bl
  LEFT JOIN cohort_analysis ca
    ON bl.report_date = ca.report_date AND bl.Product_Name_Final = ca.Product_Name_Final
    AND bl.Country_Code = ca.Country_Code AND bl.Spend_Country_Code_AFID = ca.Spend_Country_Code_AFID
    AND bl.billing_cycle = ca.billing_cycle
),

final_cohort AS (
  SELECT ics.report_date, ics.Product_Name_Final, ics.Country_Code, ics.Spend_Country_Code_AFID,
    ics.billing_cycle, ics.calculated_denominator_bc,
    ics.Updated_Cust_ID, ics.Order_Price_Net_of_Tax_USD, 'selected_cohort' as final_cohort_source
  FROM initial_cohort_selection ics
  INNER JOIN bc_end_date_calculation bedc
    ON ics.report_date = bedc.report_date AND ics.Product_Name_Final = bedc.Product_Name_Final
    AND ics.Country_Code = bedc.Country_Code AND ics.Spend_Country_Code_AFID = bedc.Spend_Country_Code_AFID
    AND ics.billing_cycle = bedc.billing_cycle
  WHERE bedc.cohort_method = 'use_selected_cohort'

  UNION ALL

  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Spend_Country_Code_AFID,
    bedc.billing_cycle, bedc.calculated_denominator_bc,
    base.Updated_Cust_ID, base.Order_Price_Net_of_Tax_USD, 'fresh_join' as final_cohort_source
  FROM bc_end_date_calculation bedc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bedc.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Spend_Country_Code_AFID = bedc.Spend_Country_Code_AFID
    AND base.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND base.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE bedc.cohort_method = 'use_fresh_join'
),

exchange_rate_lookup AS (
  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle, bedc.Currency,
    CASE WHEN bedc.Currency = 'USD' THEN 1.0 ELSE COALESCE(AVG(er.Value_USD), 1.0) END as final_exchange_rate
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON bedc.Currency = er.Currency AND er.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle, bedc.Currency
),

subscription_metrics AS (
  SELECT fc.report_date, fc.Product_Name_Final, fc.Country_Code, fc.Spend_Country_Code_AFID,
    fc.billing_cycle, fc.final_cohort_source,
    COUNT(fc.Updated_Cust_ID) as final_subscription_users,
    SUM(fc.Order_Price_Net_of_Tax_USD) as final_subscription_value
  FROM final_cohort fc
  GROUP BY fc.report_date, fc.Product_Name_Final, fc.Country_Code,
    fc.Spend_Country_Code_AFID, fc.billing_cycle, fc.final_cohort_source
),

rebill_metrics AS (
  SELECT fc_distinct.report_date, fc_distinct.Product_Name_Final, fc_distinct.Country_Code,
    fc_distinct.Spend_Country_Code_AFID, fc_distinct.billing_cycle, fc_distinct.calculated_denominator_bc,
    COUNT(rebill.Updated_Cust_ID) as final_rebill_users,
    SUM(rebill.Order_Price_Net_of_Tax_USD) as final_rebill_value
  FROM (
    SELECT DISTINCT report_date, Product_Name_Final, Country_Code, Spend_Country_Code_AFID,
      billing_cycle, calculated_denominator_bc, Updated_Cust_ID FROM final_cohort
  ) fc_distinct
  INNER JOIN bc_end_date_calculation bedc
    ON fc_distinct.report_date = bedc.report_date AND fc_distinct.Product_Name_Final = bedc.Product_Name_Final
    AND fc_distinct.Country_Code = bedc.Country_Code AND fc_distinct.Spend_Country_Code_AFID = bedc.Spend_Country_Code_AFID
    AND fc_distinct.billing_cycle = bedc.billing_cycle
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` rebill
    ON fc_distinct.Updated_Cust_ID = rebill.Updated_Cust_ID
    AND fc_distinct.Product_Name_Final = rebill.Product_Name_Final_Merged
    AND rebill.Spend_Country_Code_AFID = fc_distinct.Spend_Country_Code_AFID
    AND rebill.Billing_Cycle_Updated = fc_distinct.calculated_denominator_bc + 1
    AND (
      (bedc.Country_Code = 'JP' AND rebill.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (rebill.Spend_Country_Code_AFID != 'JP' OR rebill.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  GROUP BY fc_distinct.report_date, fc_distinct.Product_Name_Final, fc_distinct.Country_Code,
    fc_distinct.Spend_Country_Code_AFID, fc_distinct.billing_cycle, fc_distinct.calculated_denominator_bc
),

ad_spend_metrics AS (
  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle,
    SUM(CASE WHEN bedc.Country_Code IS NULL OR bedc.Country_Code = '' THEN ads.allocated_spend
             WHEN bedc.Country_Code = 'JP' AND ads.Country = 'JP' THEN ads.allocated_spend
             WHEN bedc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) THEN ads.allocated_spend
             ELSE 0 END) as final_spend_amount
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged
    AND ads.Country = bedc.Spend_Country_Code_AFID
    AND ads.Date BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Spend_Country_Code_AFID, bedc.billing_cycle
),

single_sale_metrics AS (
  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle,
    COUNT(DISTINCT ss.Updated_Cust_ID) as final_ss_users,
    SUM(ss.Order_Price_Net_of_Tax_Allocated_USD) as final_ss_value
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL` ss
    ON bedc.Product_Name_Final = ss.Product_Name_Final_Main_Merged
    AND ss.Spend_Country_Code_AFID = bedc.Spend_Country_Code_AFID
    AND ss.Billing_Cycle_Updated = 0
    AND ss.Date_of_Sale BETWEEN bedc.calculated_bc_end_date AND bedc.calculated_bc_start_date
    AND (
      (bedc.Country_Code = 'JP' AND ss.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (ss.Spend_Country_Code_AFID != 'JP' OR ss.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Spend_Country_Code_AFID, bedc.billing_cycle
),

recent_spend_metrics AS (
  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle,
    SUM(CASE WHEN bedc.Country_Code IS NULL OR bedc.Country_Code = '' THEN ads.allocated_spend
             WHEN bedc.Country_Code = 'JP' AND ads.Country = 'JP' THEN ads.allocated_spend
             WHEN bedc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) THEN ads.allocated_spend
             ELSE 0 END) as final_recent_spend
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bedc.Product_Name_Final = ads.Product_Name_Final_Merged
    AND ads.Country = bedc.Spend_Country_Code_AFID
    AND ads.Date BETWEEN DATE_SUB(bedc.report_date, INTERVAL 6 DAY) AND bedc.report_date
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Spend_Country_Code_AFID, bedc.billing_cycle
),

recent_users_metrics AS (
  SELECT bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code,
    bedc.Spend_Country_Code_AFID, bedc.billing_cycle,
    COUNT(DISTINCT base.Updated_Cust_ID) as final_recent_users
  FROM bc_end_date_calculation bedc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bedc.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Spend_Country_Code_AFID = bedc.Spend_Country_Code_AFID
    AND base.Billing_Cycle_Updated = bedc.calculated_denominator_bc
    AND base.Date_of_Sale BETWEEN DATE_SUB(bedc.report_date, INTERVAL 6 DAY) AND bedc.report_date
    AND (
      (bedc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bedc.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bedc.Country_Code IS NULL OR bedc.Country_Code = '')
    )
  WHERE (bedc.Trial_Type = 'NT' AND bedc.billing_cycle = 1) OR (bedc.Trial_Type != 'NT' AND bedc.billing_cycle = 0)
  GROUP BY bedc.report_date, bedc.Product_Name_Final, bedc.Country_Code, bedc.Spend_Country_Code_AFID, bedc.billing_cycle
),

core_metrics AS (
  SELECT bedc.*, erl.final_exchange_rate,
    COALESCE(sm.final_subscription_users, 0) as clean_subscription_users,
    COALESCE(sm.final_subscription_value, 0) as clean_subscription_value,
    COALESCE(sm.final_cohort_source, 'no_data') as clean_cohort_source,
    COALESCE(ssm.final_ss_users, 0) as clean_ss_users,
    COALESCE(ssm.final_ss_value, 0) as clean_ss_value,
    CASE WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0,1)) OR bedc.billing_cycle = 0
         THEN COALESCE(sm.final_subscription_users, 0) ELSE COALESCE(rm.final_rebill_users, 0) END as clean_rebill_users,
    CASE WHEN (bedc.Trial_Type = 'NT' AND bedc.billing_cycle IN (0,1)) OR bedc.billing_cycle = 0
         THEN COALESCE(sm.final_subscription_value, 0) ELSE COALESCE(rm.final_rebill_value, 0) END as clean_rebill_value,
    COALESCE(rsm.final_recent_spend, 0) as clean_recent_spend,
    COALESCE(rum.final_recent_users, 0) as clean_recent_users
  FROM bc_end_date_calculation bedc
  LEFT JOIN exchange_rate_lookup erl ON bedc.report_date=erl.report_date AND bedc.Product_Name_Final=erl.Product_Name_Final AND bedc.Country_Code=erl.Country_Code AND bedc.Spend_Country_Code_AFID=erl.Spend_Country_Code_AFID AND bedc.billing_cycle=erl.billing_cycle
  LEFT JOIN subscription_metrics sm ON bedc.report_date=sm.report_date AND bedc.Product_Name_Final=sm.Product_Name_Final AND bedc.Country_Code=sm.Country_Code AND bedc.Spend_Country_Code_AFID=sm.Spend_Country_Code_AFID AND bedc.billing_cycle=sm.billing_cycle
  LEFT JOIN single_sale_metrics ssm ON bedc.report_date=ssm.report_date AND bedc.Product_Name_Final=ssm.Product_Name_Final AND bedc.Country_Code=ssm.Country_Code AND bedc.Spend_Country_Code_AFID=ssm.Spend_Country_Code_AFID AND bedc.billing_cycle=ssm.billing_cycle
  LEFT JOIN rebill_metrics rm ON bedc.report_date=rm.report_date AND bedc.Product_Name_Final=rm.Product_Name_Final AND bedc.Country_Code=rm.Country_Code AND bedc.Spend_Country_Code_AFID=rm.Spend_Country_Code_AFID AND bedc.billing_cycle=rm.billing_cycle
  LEFT JOIN recent_spend_metrics rsm ON bedc.report_date=rsm.report_date AND bedc.Product_Name_Final=rsm.Product_Name_Final AND bedc.Country_Code=rsm.Country_Code AND bedc.Spend_Country_Code_AFID=rsm.Spend_Country_Code_AFID AND bedc.billing_cycle=rsm.billing_cycle
  LEFT JOIN recent_users_metrics rum ON bedc.report_date=rum.report_date AND bedc.Product_Name_Final=rum.Product_Name_Final AND bedc.Country_Code=rum.Country_Code AND bedc.Spend_Country_Code_AFID=rum.Spend_Country_Code_AFID AND bedc.billing_cycle=rum.billing_cycle
),

calculated_ratios AS (
  SELECT cm.*,
    CASE WHEN cm.billing_cycle = 0 THEN 0.00
         WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
         ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_rebill_users, NULLIF(cm.clean_subscription_users, 0)), 0)
    END as base_churn_rate,
    COALESCE(rt.Refund_Ratio, 0.00) as base_refund_ratio,
    COALESCE(CASE WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0
                  THEN SAFE_DIVIDE(cm.clean_recent_spend, NULLIF(cm.clean_recent_users, 0))
                  ELSE 0.0 END, 0.0) as base_recent_cac
  FROM core_metrics cm
  LEFT JOIN `Icarus_Spend_Country_AFID.SCA_Refund_Table` rt
    ON cm.report_date=rt.Report_date AND cm.Product_Name_Final=rt.Product_Name_Final
    AND cm.Country_Code=rt.Country_Code AND cm.Spend_Country_Code_AFID=rt.Spend_Country_Code_AFID
    AND cm.billing_cycle=rt.Billing_Cycle
),

retention_step_0 AS (
  SELECT cr.*,
    CASE WHEN cr.billing_cycle = 0 AND cr.Trial_Type != 'NT' AND (cr.clean_subscription_users = 0 OR cr.clean_rebill_users < cr.minimum_rebill_users) THEN NULL
         WHEN cr.billing_cycle = 0 THEN 1.0
         WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 AND (cr.clean_subscription_users = 0 OR cr.clean_rebill_users < cr.minimum_rebill_users) THEN NULL
         WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 THEN 1.0
         ELSE NULL END as step_0_retention
  FROM calculated_ratios cr
),
retention_step_1 AS (
  SELECT rs0.*,
    CASE WHEN rs0.step_0_retention IS NOT NULL THEN rs0.step_0_retention
         WHEN rs0.billing_cycle = 1 AND rs0.Trial_Type != 'NT' THEN
           CASE WHEN LAG(rs0.step_0_retention) OVER (PARTITION BY rs0.report_date, rs0.Product_Name_Final, rs0.Country_Code, rs0.Spend_Country_Code_AFID ORDER BY rs0.billing_cycle) IS NULL THEN NULL
                WHEN rs0.clean_rebill_users < rs0.minimum_rebill_users THEN 0.0
                ELSE 1.0 * (1 - rs0.base_churn_rate) END
         ELSE NULL END as step_1_retention FROM retention_step_0 rs0
),
retention_step_2 AS (
  SELECT rs1.*,
    CASE WHEN rs1.step_1_retention IS NOT NULL THEN rs1.step_1_retention
         WHEN rs1.billing_cycle = 2 THEN
           CASE WHEN LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code, rs1.Spend_Country_Code_AFID ORDER BY rs1.billing_cycle) IS NULL THEN NULL
                WHEN rs1.clean_rebill_users < rs1.minimum_rebill_users THEN 0.0
                ELSE LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code, rs1.Spend_Country_Code_AFID ORDER BY rs1.billing_cycle) * (1 - rs1.base_churn_rate) END
         ELSE NULL END as step_2_retention FROM retention_step_1 rs1
),
retention_step_3 AS (
  SELECT rs2.*,
    CASE WHEN rs2.step_2_retention IS NOT NULL THEN rs2.step_2_retention
         WHEN rs2.billing_cycle = 3 THEN
           CASE WHEN LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code, rs2.Spend_Country_Code_AFID ORDER BY rs2.billing_cycle) IS NULL THEN NULL
                WHEN rs2.clean_rebill_users < rs2.minimum_rebill_users THEN 0.0
                ELSE LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code, rs2.Spend_Country_Code_AFID ORDER BY rs2.billing_cycle) * (1 - rs2.base_churn_rate) END
         ELSE NULL END as step_3_retention FROM retention_step_2 rs2
),
retention_step_4 AS (
  SELECT rs3.*,
    CASE WHEN rs3.step_3_retention IS NOT NULL THEN rs3.step_3_retention
         WHEN rs3.billing_cycle = 4 THEN
           CASE WHEN LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code, rs3.Spend_Country_Code_AFID ORDER BY rs3.billing_cycle) IS NULL THEN NULL
                WHEN rs3.clean_rebill_users < rs3.minimum_rebill_users THEN 0.0
                ELSE LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code, rs3.Spend_Country_Code_AFID ORDER BY rs3.billing_cycle) * (1 - rs3.base_churn_rate) END
         ELSE rs3.step_3_retention END as step_4_retention FROM retention_step_3 rs3
),
retention_step_5 AS (
  SELECT rs4.*,
    CASE WHEN rs4.step_4_retention IS NOT NULL THEN rs4.step_4_retention
         WHEN rs4.billing_cycle = 5 THEN
           CASE WHEN LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code, rs4.Spend_Country_Code_AFID ORDER BY rs4.billing_cycle) IS NULL THEN NULL
                WHEN rs4.clean_rebill_users < rs4.minimum_rebill_users THEN 0.0
                ELSE LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code, rs4.Spend_Country_Code_AFID ORDER BY rs4.billing_cycle) * (1 - rs4.base_churn_rate) END
         ELSE NULL END as step_5_retention FROM retention_step_4 rs4
),
retention_step_6 AS (
  SELECT rs5.*,
    CASE WHEN rs5.step_5_retention IS NOT NULL THEN rs5.step_5_retention
         WHEN rs5.billing_cycle = 6 THEN
           CASE WHEN LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code, rs5.Spend_Country_Code_AFID ORDER BY rs5.billing_cycle) IS NULL THEN NULL
                WHEN rs5.clean_rebill_users < rs5.minimum_rebill_users THEN 0.0
                ELSE LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code, rs5.Spend_Country_Code_AFID ORDER BY rs5.billing_cycle) * (1 - rs5.base_churn_rate) END
         ELSE NULL END as step_6_retention FROM retention_step_5 rs5
),
retention_step_7 AS (
  SELECT rs6.*,
    CASE WHEN rs6.step_6_retention IS NOT NULL THEN rs6.step_6_retention
         WHEN rs6.billing_cycle = 7 THEN
           CASE WHEN LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code, rs6.Spend_Country_Code_AFID ORDER BY rs6.billing_cycle) IS NULL THEN NULL
                WHEN rs6.clean_rebill_users < rs6.minimum_rebill_users THEN 0.0
                ELSE LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code, rs6.Spend_Country_Code_AFID ORDER BY rs6.billing_cycle) * (1 - rs6.base_churn_rate) END
         ELSE NULL END as step_7_retention FROM retention_step_6 rs6
),
retention_step_8 AS (
  SELECT rs7.*,
    CASE WHEN rs7.step_7_retention IS NOT NULL THEN rs7.step_7_retention
         WHEN rs7.billing_cycle = 8 THEN
           CASE WHEN LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code, rs7.Spend_Country_Code_AFID ORDER BY rs7.billing_cycle) IS NULL THEN NULL
                WHEN rs7.clean_rebill_users < rs7.minimum_rebill_users THEN 0.0
                ELSE LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code, rs7.Spend_Country_Code_AFID ORDER BY rs7.billing_cycle) * (1 - rs7.base_churn_rate) END
         ELSE NULL END as step_8_retention FROM retention_step_7 rs7
),
retention_step_9 AS (
  SELECT rs8.*,
    CASE WHEN rs8.step_8_retention IS NOT NULL THEN rs8.step_8_retention
         WHEN rs8.billing_cycle = 9 THEN
           CASE WHEN LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code, rs8.Spend_Country_Code_AFID ORDER BY rs8.billing_cycle) IS NULL THEN NULL
                WHEN rs8.clean_rebill_users < rs8.minimum_rebill_users THEN 0.0
                ELSE LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code, rs8.Spend_Country_Code_AFID ORDER BY rs8.billing_cycle) * (1 - rs8.base_churn_rate) END
         ELSE NULL END as step_9_retention FROM retention_step_8 rs8
),
retention_step_10 AS (
  SELECT rs9.*,
    CASE WHEN rs9.step_9_retention IS NOT NULL THEN rs9.step_9_retention
         WHEN rs9.billing_cycle = 10 THEN
           CASE WHEN LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code, rs9.Spend_Country_Code_AFID ORDER BY rs9.billing_cycle) IS NULL THEN NULL
                WHEN rs9.clean_rebill_users < rs9.minimum_rebill_users THEN 0.0
                ELSE LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code, rs9.Spend_Country_Code_AFID ORDER BY rs9.billing_cycle) * (1 - rs9.base_churn_rate) END
         ELSE NULL END as step_10_retention FROM retention_step_9 rs9
),
retention_step_11 AS (
  SELECT rs10.*,
    CASE WHEN rs10.step_10_retention IS NOT NULL THEN rs10.step_10_retention
         WHEN rs10.billing_cycle = 11 THEN
           CASE WHEN LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code, rs10.Spend_Country_Code_AFID ORDER BY rs10.billing_cycle) IS NULL THEN NULL
                WHEN rs10.clean_rebill_users < rs10.minimum_rebill_users THEN 0.0
                ELSE LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code, rs10.Spend_Country_Code_AFID ORDER BY rs10.billing_cycle) * (1 - rs10.base_churn_rate) END
         ELSE NULL END as step_11_retention FROM retention_step_10 rs10
),
retention_step_12 AS (
  SELECT rs11.*,
    CASE WHEN rs11.step_11_retention IS NOT NULL THEN rs11.step_11_retention
         WHEN rs11.billing_cycle = 12 THEN
           CASE WHEN LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code, rs11.Spend_Country_Code_AFID ORDER BY rs11.billing_cycle) IS NULL THEN NULL
                WHEN rs11.clean_rebill_users < rs11.minimum_rebill_users THEN 0.0
                ELSE LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code, rs11.Spend_Country_Code_AFID ORDER BY rs11.billing_cycle) * (1 - rs11.base_churn_rate) END
         ELSE rs11.step_11_retention END as final_retention_rate
  FROM retention_step_11 rs11
),

final_calculations AS (
  SELECT rs12.*,
    CASE WHEN rs12.final_retention_rate IS NULL THEN NULL ELSE rs12.base_churn_rate END as final_churn_rate,
    rs12.base_refund_ratio as final_refund_ratio,
    CASE WHEN rs12.final_retention_rate IS NULL THEN NULL ELSE rs12.base_recent_cac END as final_recent_cac,
    CASE WHEN rs12.final_retention_rate IS NULL THEN NULL WHEN rs12.final_retention_rate = 0 THEN 0.00
         ELSE rs12.final_retention_rate - rs12.base_refund_ratio END as final_net_retention_rate,
    CASE WHEN rs12.final_retention_rate IS NULL THEN NULL WHEN rs12.final_retention_rate = 0 THEN 0.0
         ELSE COALESCE(SAFE_DIVIDE(rs12.clean_rebill_value, NULLIF(rs12.clean_rebill_users, 0)) * rs12.final_retention_rate, 0.0)
              + COALESCE(SAFE_DIVIDE(rs12.clean_ss_value, NULLIF(rs12.clean_subscription_users, 0)), 0) END as final_arpu_discounted,
    CASE WHEN rs12.final_retention_rate IS NULL THEN NULL WHEN rs12.final_retention_rate = 0 THEN 0.0
         ELSE COALESCE(SAFE_DIVIDE(rs12.clean_rebill_value + COALESCE(rs12.clean_ss_value, 0), NULLIF(rs12.clean_rebill_users, 0)) * (rs12.final_retention_rate - rs12.base_refund_ratio), 0.0)
    END as final_net_arpu_discounted
  FROM retention_step_12 rs12
),

final_output_prep AS (
  SELECT fc.*,
    CASE WHEN fc.Country_Code IS NOT NULL AND fc.Country_Code != ''
         THEN CONCAT(fc.App_Name, '-', fc.Country_Code) ELSE fc.App_Name END as computed_app_name,
    CASE WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active' ELSE 'Inactive' END as Active_Inactive
  FROM final_calculations fc
  LEFT JOIN (SELECT DISTINCT Product_Name_Final FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`) ap
    ON fc.Product_Name_Final = ap.Product_Name_Final
)

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
  fop.Trial_Type, fop.Trial_Period, fop.Currency, fop.Trial_Price, fop.Regular_Price,
  fop.calculated_regular_bc_period as Regular_BC_period,
  fop.final_exchange_rate as Exchange_rate,
  fop.Country_Code,
  fop.Spend_Country_Code_AFID,
  fop.calculated_bc_start_date as BC_start_date,
  fop.calculated_bc_end_date as BC_end_date,
  fop.calculated_denominator_bc as Denominator_BC,
  fop.clean_cohort_source as cohort_source,
  fop.clean_subscription_users as Subscription_users,
  fop.clean_subscription_value as Subscription_value,
  fop.clean_ss_users as SS_Users,
  fop.clean_ss_value as SS_Value,
  fop.clean_rebill_users as Rebill_users,
  fop.clean_rebill_value as Rebill_value,
  fop.clean_recent_spend as Recent_Spend,
  fop.clean_recent_users as Recent_Users,
  fop.clean_recent_spend / 7.0 as T7D_Spend,
  fop.clean_recent_users / 7.0 as T7D_Users,
  fop.final_churn_rate as Churn_rate,
  fop.final_refund_ratio as Refund_ratio,
  fop.final_recent_cac as Recent_CAC,
  fop.final_retention_rate as Retention_rate,
  fop.final_net_retention_rate as NET_Retention_rate,
  fop.final_arpu_discounted as ARPU_Discounted,
  fop.final_net_arpu_discounted as Net_ARPU_Discounted,
  CASE WHEN fop.final_retention_rate IS NULL THEN NULL
       ELSE fop.final_net_arpu_discounted - fop.final_recent_cac END as Net_LTV_Discounted,
  fop.Active_Inactive,
  CONCAT(fop.Product_Name_Final, '_', fop.Spend_Country_Code_AFID) as Product_SCA

FROM final_output_prep fop
ORDER BY fop.report_date DESC, fop.Product_Name_Final, fop.Country_Code, fop.Spend_Country_Code_AFID, fop.billing_cycle
