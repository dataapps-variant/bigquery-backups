-- =====================================================
-- DAILY REPORT ALL REBILL - SIMPLIFIED VERSION
-- No Cohort Size Limitation, No 7K/30D constraints
-- 
-- OUTPUT FIELDS:
-- 1. report_date
-- 2. Billing_Cycle
-- 3. App_Name
-- 4. Subscription_Users
-- 5. Rebill_User
-- 6. Retention_rate
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Daily_Report_All_Rebill` AS

WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    30 AS retry_engine_period,
    12 AS max_billing_cycles,
    30 AS default_regular_bc_period,
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
-- PLAN_LIST AGGREGATION
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
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, COALESCE(Country_Code, 'NULL_GROUP')
      ORDER BY Trial_Price ASC
    ) AS rn
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
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
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
-- PRODUCT LIST
-- =====================================================
product_list AS (
  SELECT DISTINCT 
    Product_Name_Final,
    Country_Code
  FROM aggregated_plan_list
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
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
    mc.billing_cycle,
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
-- SUBSCRIPTION USERS CALCULATION (ALL TRANSACTIONS)
-- No 7K limitation - takes ALL transactions
-- =====================================================
subscription_metrics AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.Country_Code,
    bl.billing_cycle,
    bl.calculated_denominator_bc,
    COUNT(DISTINCT base.Updated_Cust_ID) as subscription_users,
    SUM(base.Order_Price_Net_of_Tax_USD) as subscription_value
  FROM business_logic bl
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON bl.Product_Name_Final = base.Product_Name_Final_Merged
    AND base.Billing_Cycle_Updated = bl.calculated_denominator_bc
    AND base.Date_of_Sale <= bl.calculated_bc_start_date
    AND (
      (bl.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
  GROUP BY bl.report_date, bl.Product_Name_Final, bl.Country_Code, bl.billing_cycle, bl.calculated_denominator_bc
),

-- =====================================================
-- REBILL METRICS CALCULATION
-- =====================================================
rebill_metrics AS (
  SELECT 
    sm.report_date,
    sm.Product_Name_Final,
    sm.Country_Code,
    sm.billing_cycle,
    sm.calculated_denominator_bc,
    COUNT(DISTINCT rebill.Updated_Cust_ID) as rebill_users,
    SUM(rebill.Order_Price_Net_of_Tax_USD) as rebill_value
  FROM subscription_metrics sm
  INNER JOIN business_logic bl
    ON sm.report_date = bl.report_date
    AND sm.Product_Name_Final = bl.Product_Name_Final
    AND sm.Country_Code = bl.Country_Code
    AND sm.billing_cycle = bl.billing_cycle
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` rebill
    ON rebill.Product_Name_Final_Merged = sm.Product_Name_Final
    AND rebill.Billing_Cycle_Updated = sm.calculated_denominator_bc + 1
    AND (
      (bl.Country_Code = 'JP' AND rebill.Spend_Country_Code_AFID = 'JP')
      OR (bl.Country_Code = 'Non-JP' AND (rebill.Spend_Country_Code_AFID != 'JP' OR rebill.Spend_Country_Code_AFID IS NULL))
      OR (bl.Country_Code IS NULL OR bl.Country_Code = '')
    )
  GROUP BY sm.report_date, sm.Product_Name_Final, sm.Country_Code, sm.billing_cycle, sm.calculated_denominator_bc
),

-- =====================================================
-- CORE METRICS ASSEMBLY
-- =====================================================
core_metrics AS (
  SELECT 
    bl.report_date,
    bl.Product_Name_Final,
    bl.Country_Code,
    bl.billing_cycle,
    bl.Trial_Type,
    bl.App_Name,
    bl.minimum_rebill_users,
    COALESCE(sm.subscription_users, 0) as clean_subscription_users,
    
    CASE 
      WHEN (bl.Trial_Type = 'NT' AND bl.billing_cycle IN (0, 1)) OR bl.billing_cycle = 0 
      THEN COALESCE(sm.subscription_users, 0)
      ELSE COALESCE(rm.rebill_users, 0)
    END as clean_rebill_users
    
  FROM business_logic bl
  LEFT JOIN subscription_metrics sm
    ON bl.report_date = sm.report_date 
    AND bl.Product_Name_Final = sm.Product_Name_Final 
    AND bl.Country_Code = sm.Country_Code
    AND bl.billing_cycle = sm.billing_cycle
  LEFT JOIN rebill_metrics rm
    ON bl.report_date = rm.report_date 
    AND bl.Product_Name_Final = rm.Product_Name_Final 
    AND bl.Country_Code = rm.Country_Code
    AND bl.billing_cycle = rm.billing_cycle
),

-- =====================================================
-- BASE CHURN RATE CALCULATION
-- =====================================================
base_ratios AS (
  SELECT 
    cm.*,
    
    -- Base churn rate (before NULL logic)
    CASE 
      WHEN cm.billing_cycle = 0 THEN 0.00
      WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_rebill_users, NULLIF(cm.clean_subscription_users, 0)), 0)
    END as base_churn_rate
    
  FROM core_metrics cm
),

-- =====================================================
-- RETENTION RATE CALCULATION WITH NULL CASCADE
-- 12 BILLING CYCLES (BC0-BC12)
-- Rebill_users < 25 → NULL cascade logic
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
          WHEN LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.report_date, rs0.Product_Name_Final, rs0.Country_Code
            ORDER BY rs0.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs0.clean_rebill_users < rs0.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.report_date, rs1.Product_Name_Final, rs1.Country_Code
            ORDER BY rs1.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs1.clean_rebill_users < rs1.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code
            ORDER BY rs2.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs2.clean_rebill_users < rs2.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.report_date, rs3.Product_Name_Final, rs3.Country_Code
            ORDER BY rs3.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs3.clean_rebill_users < rs3.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs4.step_4_retention) OVER (
            PARTITION BY rs4.report_date, rs4.Product_Name_Final, rs4.Country_Code
            ORDER BY rs4.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs4.clean_rebill_users < rs4.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs5.step_5_retention) OVER (
            PARTITION BY rs5.report_date, rs5.Product_Name_Final, rs5.Country_Code
            ORDER BY rs5.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs5.clean_rebill_users < rs5.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs6.step_6_retention) OVER (
            PARTITION BY rs6.report_date, rs6.Product_Name_Final, rs6.Country_Code
            ORDER BY rs6.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs6.clean_rebill_users < rs6.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs7.step_7_retention) OVER (
            PARTITION BY rs7.report_date, rs7.Product_Name_Final, rs7.Country_Code
            ORDER BY rs7.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs7.clean_rebill_users < rs7.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs8.step_8_retention) OVER (
            PARTITION BY rs8.report_date, rs8.Product_Name_Final, rs8.Country_Code
            ORDER BY rs8.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs8.clean_rebill_users < rs8.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs9.step_9_retention) OVER (
            PARTITION BY rs9.report_date, rs9.Product_Name_Final, rs9.Country_Code
            ORDER BY rs9.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs9.clean_rebill_users < rs9.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs10.step_10_retention) OVER (
            PARTITION BY rs10.report_date, rs10.Product_Name_Final, rs10.Country_Code
            ORDER BY rs10.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs10.clean_rebill_users < rs10.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code
            ORDER BY rs11.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs11.clean_rebill_users < rs11.minimum_rebill_users THEN NULL
          ELSE LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.report_date, rs11.Product_Name_Final, rs11.Country_Code
            ORDER BY rs11.billing_cycle
          ) * (1 - rs11.base_churn_rate)
        END
      ELSE rs11.step_11_retention
    END as final_retention_rate
  FROM retention_step_11 rs11
)

-- =====================================================
-- FINAL OUTPUT - 6 COLUMNS ONLY
-- =====================================================
SELECT 
  rs12.report_date,
  rs12.billing_cycle as Billing_Cycle,
  CASE 
    WHEN rs12.Country_Code IS NOT NULL AND rs12.Country_Code != '' 
    THEN CONCAT(rs12.App_Name, '-', rs12.Country_Code)
    ELSE rs12.App_Name
  END as App_Name,
  rs12.clean_subscription_users as Subscription_Users,
  rs12.clean_rebill_users as Rebill_User,
  rs12.final_retention_rate as Retention_rate

FROM retention_step_12 rs12
ORDER BY rs12.report_date DESC, rs12.App_Name, rs12.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - DAILY REPORT ALL REBILL
-- Table: variant-finance-data-project.Sticky_Reports.daily_report_all_Rebill
-- 
-- KEY FEATURES:
-- ✅ No Cohort Size limitation (takes ALL transactions)
-- ✅ No Limiting Days constraint (no 30D restriction)
-- ✅ Same retention rate logic with NULL cascade when rebill < 25
-- ✅ Simplified to 6 essential columns only
-- 
-- OUTPUT: 6 columns
-- - report_date
-- - Billing_Cycle
-- - App_Name (with Country_Code suffix if applicable)
-- - Subscription_Users
-- - Rebill_User
-- - Retention_rate
-- =====================================================
