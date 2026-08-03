-- job_id: script_job_c231d030c9598a3d7fea4d5c1bc10343_3
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:03:01.055000+00:00
-- started: 2026-07-29T09:03:01.734000+00:00
-- ended: 2026-07-29T09:03:08.750000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball` AS

WITH calculated_ratios AS  (
  SELECT 
    cm.*,
    
    -- Base churn rate calculation (USES CB_User)
    CASE 
      WHEN cm.billing_cycle = 0 THEN 0.00
      WHEN cm.Trial_Type = 'NT' AND cm.billing_cycle = 1 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(cm.clean_cb_user, NULLIF(cm.clean_subscription_users, 0)), 0)
    END as base_churn_rate,
    
    -- Base refund ratio
    COALESCE(rt.Refund_Ratio, 0.00) as base_refund_ratio,
    
    -- Base CAC calculation
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_spend_amount, NULLIF(cm.clean_subscription_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_cac,
    
    -- Base Recent_CAC calculation
    COALESCE(
      CASE 
        WHEN (cm.Trial_Type = 'NT' AND cm.billing_cycle = 1) OR cm.billing_cycle = 0 
        THEN SAFE_DIVIDE(cm.clean_recent_spend, NULLIF(cm.clean_recent_users, 0))
        ELSE 0.0
      END,
      0.0
    ) as base_recent_cac
    
FROM temp_core cm
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.Refund_Table` rt
    ON cm.report_date = rt.Report_date 
    AND cm.Product_Name_Final = rt.Product_Name_Final 
    AND cm.Country_Code = rt.Country_Code
    AND cm.billing_cycle = rt.Billing_Cycle
),

-- =====================================================
-- RETENTION RATE CALCULATION (STEP-BY-STEP)
-- NULL cascade when Subscription_users = 0 OR CB_User < minimum_rebill_users at trigger BCs
-- CB_User < minimum_rebill_users sets retention to NULL at non-trigger BCs
-- NT BC0: Always NULL (not meaningful for NT plans)
-- =====================================================
retention_step_0 AS (
  SELECT 
    cr.*,
    CASE 
      -- NT BC0: Always NULL (NEW - BC0 not meaningful for NT plans)
      WHEN cr.billing_cycle = 0 AND cr.Trial_Type = 'NT' THEN NULL
      
      -- Non-NT BC0: NULL if Subscription_users = 0 OR CB_User < minimum_rebill_users
      WHEN cr.billing_cycle = 0 AND cr.Trial_Type != 'NT' AND (cr.clean_subscription_users = 0 OR cr.clean_cb_user < cr.minimum_rebill_users) THEN NULL
      WHEN cr.billing_cycle = 0 THEN 1.0
      
      -- NT BC1: NULL if Subscription_users = 0 OR CB_User < minimum_rebill_users
      WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 AND (cr.clean_subscription_users = 0 OR cr.clean_cb_user < cr.minimum_rebill_users) THEN NULL
      WHEN cr.Trial_Type = 'NT' AND cr.billing_cycle = 1 THEN 1.0
      
      ELSE NULL
    END as step_0_retention
  FROM calculated_ratios cr
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
          -- Check if current BC has CB_User < minimum_rebill_users → set to NULL
          WHEN rs0.clean_cb_user < rs0.minimum_rebill_users THEN NULL
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
          -- Check if current BC has CB_User < minimum_rebill_users → set to NULL
          WHEN rs1.clean_cb_user < rs1.minimum_rebill_users THEN NULL
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
          WHEN LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.report_date, rs2.Product_Name_Final, rs2.Country_Code
            ORDER BY rs2.billing_cycle
          ) IS NULL THEN NULL
          WHEN rs2.clean_cb_user < rs2.minimum_rebill_users THEN NULL
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
          WHEN rs3.clean_cb_user < rs3.minimum_rebill_users THEN NULL
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
          WHEN rs4.clean_cb_user < rs4.minimum_rebill_users THEN NULL
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
          WHEN rs5.clean_cb_user < rs5.minimum_rebill_users THEN NULL
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
          WHEN rs6.clean_cb_user < rs6.minimum_rebill_users THEN NULL
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
          WHEN rs7.clean_cb_user < rs7.minimum_rebill_users THEN NULL
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
          WHEN rs8.clean_cb_user < rs8.minimum_rebill_users THEN NULL
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
          WHEN rs9.clean_cb_user < rs9.minimum_rebill_users THEN NULL
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
          WHEN rs10.clean_cb_user < rs10.minimum_rebill_users THEN NULL
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
          WHEN rs11.clean_cb_user < rs11.minimum_rebill_users THEN NULL
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
-- Create adjusted metrics that become NULL when Retention_rate IS NULL
-- REMOVED all "WHEN retention = 0" special cases
-- =====================================================
final_calculations AS (
  SELECT 
    rs12.*,
    
    -- Adjusted ratios (NULL when Retention_rate IS NULL)
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE rs12.base_churn_rate
    END as final_churn_rate,
    
    -- Refund_ratio: NULL when Retention IS NULL
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
    
    -- ARPU_Discounted (USES CB_Value / CB_User)
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.clean_cb_value, NULLIF(rs12.clean_cb_user, 0)) * rs12.final_retention_rate,
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
    
    -- Net_ARPU_Discounted (USES CB_Value / CB_User)
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.clean_cb_value, NULLIF(rs12.clean_cb_user, 0)) * (rs12.final_retention_rate - rs12.base_refund_ratio),
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0)
    END as final_net_arpu_discounted,
    
    -- Compute App_Name with Country_Code
    CASE 
      WHEN rs12.Country_Code IS NOT NULL AND rs12.Country_Code != '' 
      THEN CONCAT(rs12.App_Name, '-', rs12.Country_Code)
      ELSE rs12.App_Name
    END as computed_app_name,
    
    -- Net_LTV
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      WHEN rs12.billing_cycle = 0 THEN 
        (rs12.final_retention_rate - rs12.base_refund_ratio) * rs12.Trial_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0) - rs12.base_recent_cac
      ELSE 
        (rs12.final_retention_rate - rs12.base_refund_ratio) * rs12.Regular_Price * rs12.final_exchange_rate + 
        COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0) - rs12.base_recent_cac
    END as final_net_ltv,
    
    -- Net_LTV_Discounted (USES CB_Value / CB_User)
    CASE 
      WHEN rs12.final_retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.clean_cb_value, NULLIF(rs12.clean_cb_user, 0)) * (rs12.final_retention_rate - rs12.base_refund_ratio),
        0.0
      ) + COALESCE(SAFE_DIVIDE(rs12.clean_single_sale_value, NULLIF(rs12.clean_subscription_users, 0)), 0) - rs12.base_recent_cac
    END as final_net_ltv_discounted,
    
    -- Active/Inactive Status
    CASE 
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
    
  FROM retention_step_12 rs12
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON CASE 
         WHEN rs12.Country_Code IS NOT NULL AND rs12.Country_Code != '' 
         THEN CONCAT(rs12.App_Name, '-', rs12.Country_Code)
         ELSE rs12.App_Name
       END = ap.App_Name 
    AND rs12.Product_Name_Final = ap.Product_Name_Final
)
-- =====================================================
-- FINAL OUTPUT (47 COLUMNS)
-- REMOVED: Key, BASE, WA_RATIO, and all WA columns
-- REPOSITIONED: SS_Users after CB_Value, T30D_New_Users as LAST column
-- =====================================================
SELECT 
  -- Primary Dimensions
  fc.report_date as Report_date,
  fc.Product_Name_Final,
  fc.active_inactive_status as Active_Inactive,
  fc.billing_cycle as Billing_Cycle,
  
  -- Configuration Variables
  fc.cohort_size as Cohort_Size,
  fc.limiting_days as Limiting_days,
  fc.minimum_rebill_users as Minimum_Rebill_Count,
  fc.retry_engine_period as Retry_engine_Period,
  
  -- Product Details
  fc.Entity_Name,
  fc.computed_app_name as App_Name,
  fc.Trial_Type,
  fc.Trial_Period,
  fc.Currency,
  fc.Trial_Price,
  fc.Regular_Price,
  fc.calculated_regular_bc_period as Regular_BC_period,
  fc.final_exchange_rate as Exchange_rate,
  fc.Country_Code,
  
  -- Calculated Dates
  fc.calculated_bc_start_date as BC_start_date,
  fc.calculated_bc_end_date as BC_end_date,
  fc.calculated_denominator_bc as Denominator_BC,
  
  -- Cohort Diagnostics
  fc.clean_cohort_source as cohort_source,
  
  -- User & Revenue Metrics (REPOSITIONED: SS_Users after CB_Value)
  fc.clean_subscription_users as Subscription_users,
  fc.clean_subscription_value as Subscription_value,
  fc.clean_day_0_user as Day_0_user,
  fc.clean_day_0_values as Day_0_values,
  fc.clean_sot_ratio as SOT_Ratio,
  fc.clean_cb_user as CB_User,
  fc.clean_cb_value as CB_Value,
  fc.clean_ss_users as SS_Users,  -- REPOSITIONED: After CB_Value
  fc.clean_single_sale_value as Single_Sale_Value,
  fc.clean_spend_amount as Spend_amount,
  fc.clean_recent_spend as Recent_Spend,
  fc.clean_recent_users as Recent_Users,
  
  -- Performance Ratios
  fc.final_churn_rate as Churn_rate,
  fc.final_refund_ratio as Refund_ratio,
  fc.final_cac as CAC,
  fc.final_recent_cac as Recent_CAC,
  fc.final_retention_rate as Retention_rate,
  fc.final_net_retention_rate as NET_Retention_rate,
  
  -- ARPU Metrics
  fc.final_arpu as ARPU,
  fc.final_arpu_discounted as ARPU_Discounted,
  fc.final_net_arpu as Net_ARPU,
  fc.final_net_arpu_discounted as Net_ARPU_Discounted,
  
  -- LTV Calculations
  fc.final_net_ltv as Net_LTV,
  fc.final_net_ltv_discounted as Net_LTV_Discounted,
  
  -- T30D New Users (REPOSITIONED: LAST COLUMN)
  fc.clean_t30d_new_users as T30D_New_Users

FROM final_calculations fc
ORDER BY fc.report_date DESC, fc.Product_Name_Final, fc.Country_Code, fc.billing_cycle
