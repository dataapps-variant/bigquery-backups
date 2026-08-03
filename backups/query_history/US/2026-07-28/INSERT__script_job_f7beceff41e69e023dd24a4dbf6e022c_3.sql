-- job_id: script_job_f7beceff41e69e023dd24a4dbf6e022c_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T08:30:08.310000+00:00
-- started: 2026-07-28T08:30:08.492000+00:00
-- ended: 2026-07-28T08:30:31.751000+00:00

INSERT INTO `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Refund_Table`

  -- =====================================================
  -- ▼▼▼ PASTE YOUR QUERY BELOW (from WITH to final SELECT) ▼▼▼
  -- =====================================================

WITH 
config AS (
  SELECT 
    new_end_date AS report_start_date,
    new_start_date AS report_end_date,
    7000 AS cohort_size,
    100 AS minimum_user_count,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
    0.00 AS refund_ratio_threshold,
    30 AS minimum_refund_count
),

plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    Spend_Country_Code_AFID,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    First_Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP'), Spend_Country_Code_AFID, Currency
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `Icarus_Spend_Country_AFID.SCA_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND Spend_Country_Code_AFID IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    Spend_Country_Code_AFID,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Regular_Price,
    First_Date_of_Sale
  FROM plan_list_ranked
  WHERE rn = 1
),

plan_list_trial_price_avg AS (
  SELECT 
    Product_Name_Final,
    Country_Code,
    Spend_Country_Code_AFID,
    Currency,
    AVG(Trial_Price) AS Trial_Price
  FROM `Icarus_Spend_Country_AFID.SCA_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND Spend_Country_Code_AFID IS NOT NULL
  GROUP BY Product_Name_Final, Country_Code, Spend_Country_Code_AFID, Currency
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final,
    fr.Country_Code,
    fr.Spend_Country_Code_AFID,
    fr.Entity_Name,
    fr.App_Name,
    fr.Trial_Type,
    fr.Trial_Period,
    fr.Currency,
    fr.Regular_Price,
    fr.First_Date_of_Sale,
    tp.Trial_Price
  FROM plan_list_first_record fr
  INNER JOIN plan_list_trial_price_avg tp
    ON fr.Product_Name_Final = tp.Product_Name_Final
    AND fr.Spend_Country_Code_AFID = tp.Spend_Country_Code_AFID
    AND (
      (fr.Country_Code IS NULL AND tp.Country_Code IS NULL)
      OR fr.Country_Code = tp.Country_Code
    )
    AND fr.Currency = tp.Currency
),

report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
    (SELECT report_end_date FROM config),
    (SELECT report_start_date FROM config),
    INTERVAL 1 DAY
  )) AS report_date
),

product_sca_list AS (
  SELECT DISTINCT
    Product_Name_Final,
    Spend_Country_Code_AFID,
    Currency,
    First_Date_of_Sale
  FROM aggregated_plan_list
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

master_combinations AS (
  SELECT 
    rd.report_date,
    psl.Product_Name_Final,
    psl.Currency,
    psl.Spend_Country_Code_AFID,
    bcr.billing_cycle,
    cfg.cohort_size,
    cfg.minimum_user_count,
    cfg.retry_engine_period,
    cfg.default_regular_bc_period,
    cfg.refund_ratio_threshold,
    cfg.minimum_refund_count
  FROM report_dates rd
  CROSS JOIN product_sca_list psl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
  WHERE rd.report_date >= psl.First_Date_of_Sale
),

enriched_master AS (
  SELECT 
    mc.*,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type,
    apl.Trial_Period,
    apl.Trial_Price,
    apl.Regular_Price,
    apl.Country_Code
  FROM master_combinations mc
  INNER JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Spend_Country_Code_AFID = apl.Spend_Country_Code_AFID
    AND mc.Currency = apl.Currency
),

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

exchange_rates AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.Spend_Country_Code_AFID,
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
    AND er.Date >= DATE_SUB(bl.calculated_bc_start_date, INTERVAL 90 DAY)
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.Spend_Country_Code_AFID, bl.billing_cycle, bl.Country_Code, bl.Currency, bl.calculated_bc_start_date
),

eligible_transactions AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.Spend_Country_Code_AFID,
    bl.billing_cycle,
    bl.cohort_size,
    bl.calculated_bc_start_date,
    bl.cohort_selection_bc,
    bl.Country_Code,
    bl.Currency,
    base.Updated_Cust_ID,
    base.Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY bl.report_date, bl.Product_Name_Final, bl.Spend_Country_Code_AFID, bl.billing_cycle, bl.Country_Code, bl.Currency
      ORDER BY base.Date_of_Sale DESC
    ) as transaction_rank
  FROM business_logic bl
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Spend_Country_Code_AFID = bl.Spend_Country_Code_AFID
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
    Spend_Country_Code_AFID,
    billing_cycle,
    cohort_size,
    calculated_bc_start_date,
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
    Spend_Country_Code_AFID,
    billing_cycle,
    Country_Code,
    Currency,
    MIN(original_purchase_date) as calculated_bc_end_date,
    COUNT(*) as actual_cohort_count,
    MAX(cohort_size) as cohort_size
  FROM selected_cohort
  GROUP BY report_date, Product_Name_Final, Spend_Country_Code_AFID, billing_cycle, Country_Code, Currency
),

all_customer_refunds AS (
  SELECT 
    sc.report_date,
    sc.Product_Name_Final,
    sc.Spend_Country_Code_AFID,
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
    AND base.Spend_Country_Code_AFID = sc.Spend_Country_Code_AFID
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
    AND acr.Spend_Country_Code_AFID = bl.Spend_Country_Code_AFID
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
    fr.Spend_Country_Code_AFID,
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
  GROUP BY fr.report_date, fr.Product_Name_Final, fr.Spend_Country_Code_AFID, fr.billing_cycle, fr.Country_Code, fr.Currency, fr.Trial_Type
),

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
    AND bl.Spend_Country_Code_AFID = er.Spend_Country_Code_AFID
    AND bl.billing_cycle = er.billing_cycle
    AND bl.Country_Code = er.Country_Code
    AND bl.Currency = er.Currency
  LEFT JOIN cohort_analysis ca
    ON bl.report_date = ca.report_date 
    AND bl.Product_Name_Final = ca.Product_Name_Final
    AND bl.Spend_Country_Code_AFID = ca.Spend_Country_Code_AFID
    AND bl.billing_cycle = ca.billing_cycle
    AND bl.Country_Code = ca.Country_Code
    AND bl.Currency = ca.Currency
  LEFT JOIN refund_metrics rm
    ON bl.report_date = rm.report_date 
    AND bl.Product_Name_Final = rm.Product_Name_Final
    AND bl.Spend_Country_Code_AFID = rm.Spend_Country_Code_AFID
    AND bl.billing_cycle = rm.billing_cycle
    AND bl.Country_Code = rm.Country_Code
    AND bl.Currency = rm.Currency
),

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
),

currency_detail AS (
  SELECT
    fc.*,
    CASE 
      WHEN fc.billing_cycle = 0 THEN 
        COALESCE(SAFE_DIVIDE(fc.clean_refund_amount, NULLIF(fc.Trial_Price * fc.final_exchange_rate, 0)), 0.0)
      ELSE 
        COALESCE(SAFE_DIVIDE(fc.clean_refund_amount, NULLIF(fc.Regular_Price * fc.final_exchange_rate, 0)), 0.0)
    END as Refund_Users
  FROM final_calculations fc
),

aggregated_output AS (
  SELECT
    cd.report_date,
    cd.Product_Name_Final,
    cd.Spend_Country_Code_AFID,
    cd.billing_cycle,
    cd.Country_Code,
    MAX(cd.cohort_size) as cohort_size,
    MAX(cd.minimum_user_count) as minimum_user_count,
    MAX(cd.retry_engine_period) as retry_engine_period,
    MAX(cd.refund_ratio_threshold) as refund_ratio_threshold,
    MAX(cd.minimum_refund_count) as minimum_refund_count,
    MAX(cd.Entity_Name) as Entity_Name,
    MAX(cd.App_Name) as App_Name,
    MAX(cd.Trial_Type) as Trial_Type,
    MAX(cd.Trial_Period) as Trial_Period,
    MIN(cd.Currency) as Currency,
    MAX(cd.Trial_Price) as Trial_Price,
    MAX(cd.Regular_Price) as Regular_Price,
    MAX(cd.calculated_regular_bc_period) as calculated_regular_bc_period,
    MAX(cd.final_exchange_rate) as final_exchange_rate,
    MAX(cd.calculated_denominator_bc) as calculated_denominator_bc,
    MAX(cd.calculated_bc_start_date) as calculated_bc_start_date,
    MAX(cd.calculated_bc_end_date) as calculated_bc_end_date,
    MAX(cd.calculated_start_offset_days) as calculated_start_offset_days,
    MAX(cd.calculated_end_offset_days) as calculated_end_offset_days,
    SUM(cd.final_cohort_final_users) as final_cohort_final_users,
    SUM(cd.clean_refund_count) as clean_refund_count,
    SUM(cd.clean_refund_amount) as clean_refund_amount,
    SUM(cd.Refund_Users) as Refund_Users
  FROM currency_detail cd
  GROUP BY cd.report_date, cd.Product_Name_Final, cd.Spend_Country_Code_AFID, cd.billing_cycle, cd.Country_Code
)

SELECT 
  ao.report_date as Report_date,
  ao.Product_Name_Final,
  ao.Spend_Country_Code_AFID,
  ao.billing_cycle as Billing_Cycle,
  ao.cohort_size as Cohort_Size,
  ao.minimum_user_count as Minimum_User_count,
  ao.retry_engine_period as Retry_engine_Period,
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
  ao.calculated_bc_start_date as BC_start_date,
  ao.calculated_bc_end_date as BC_end_date,
  ao.calculated_start_offset_days as start_offset_days,
  ao.calculated_end_offset_days as end_offset_days,
  ao.final_cohort_final_users as Cohort_final_users,
  ao.clean_refund_count as Refund_Count,
  ao.clean_refund_amount as Refund_Amount,
  ao.Refund_Users,
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
