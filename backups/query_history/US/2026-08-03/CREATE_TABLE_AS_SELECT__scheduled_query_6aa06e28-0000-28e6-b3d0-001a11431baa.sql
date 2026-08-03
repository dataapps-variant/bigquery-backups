-- job_id: scheduled_query_6aa06e28-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T09:15:06.130000+00:00
-- started: 2026-08-03T09:15:06.446000+00:00
-- ended: 2026-08-03T09:17:21.153000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table_App_AFID_level` AS

WITH
config AS (
  SELECT 7 AS recent_cac_days
),

-- =====================================================
-- CTE 1: AGGREGATE BASE METRICS FROM PLAN-LEVEL TABLE
-- CHANGE: Removed weighted_refund_numerator/denominator
-- =====================================================
app_afid_base_aggregated AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    Billing_Cycle,
    
    SUM(Subscription_users) AS Subscription_users,
    SUM(Subscription_value) AS Subscription_value,
    SUM(Rebill_users) AS Rebill_users,
    SUM(Rebill_value) AS Rebill_value,
    SUM(SS_Users) AS SS_Users,
    SUM(SS_Value) AS SS_Value
    
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
  GROUP BY Report_date, App_Name, Country_Code, AFID, Billing_Cycle
),

last_spend_dates AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    aba.AFID,
    MAX(ads.Date) AS last_spend_date
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM app_afid_base_aggregated
    WHERE Billing_Cycle = 0
  ) aba
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON aba.App_Name = ads.App_Name
    AND COALESCE(ads.Channel_code, 80) = aba.AFID
    AND ads.Date <= aba.Report_date
    AND ads.allocated_spend > 0
    AND (
      (aba.Country_Code = 'JP' AND ads.Country = 'JP')
      OR (aba.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL))
      OR (aba.Country_Code IS NULL OR aba.Country_Code = '')
    )
  GROUP BY aba.Report_date, aba.App_Name, aba.Country_Code, aba.AFID
),

spend_date_windows AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    AFID,
    last_spend_date,
    CASE 
      WHEN last_spend_date IS NOT NULL 
      THEN DATE_SUB(last_spend_date, INTERVAL (SELECT recent_cac_days FROM config) - 1 DAY)
      ELSE NULL
    END AS window_start_date,
    last_spend_date AS window_end_date
  FROM last_spend_dates
),

recent_spend_calc AS (
  SELECT 
    sdw.Report_date,
    sdw.App_Name,
    sdw.Country_Code,
    sdw.AFID,
    CASE 
      WHEN sdw.window_start_date IS NOT NULL THEN
        COALESCE(SUM(
          CASE 
            WHEN sdw.Country_Code = 'JP' AND ads.Country = 'JP' 
              THEN ads.allocated_spend
            WHEN sdw.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) 
              THEN ads.allocated_spend
            WHEN sdw.Country_Code IS NULL OR sdw.Country_Code = '' 
              THEN ads.allocated_spend
            ELSE 0
          END
        ), 0)
      ELSE 0
    END AS Recent_Spend
  FROM spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON sdw.App_Name = ads.App_Name
    AND COALESCE(ads.Channel_code, 80) = sdw.AFID
    AND ads.Date BETWEEN sdw.window_start_date AND sdw.window_end_date
  GROUP BY sdw.Report_date, sdw.App_Name, sdw.Country_Code, sdw.AFID, sdw.window_start_date
),

recent_users_calc AS (
  SELECT 
    sdw.Report_date,
    sdw.App_Name,
    sdw.Country_Code,
    sdw.AFID,
    CASE 
      WHEN sdw.window_start_date IS NOT NULL THEN
        COUNT(DISTINCT base.Updated_Cust_ID)
      ELSE 0
    END AS Recent_Users
  FROM spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(sdw.App_Name, 2)
    AND COALESCE(base.AFID_CHANNEL, 80) = sdw.AFID
    AND base.Date_of_Sale BETWEEN sdw.window_start_date AND sdw.window_end_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    AND (
      (LEFT(sdw.App_Name, 2) = 'CT' AND sdw.App_Name NOT LIKE '%Non-JP%' 
        AND sdw.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(sdw.App_Name, 2) = 'CT' AND sdw.App_Name LIKE '%Non-JP%' 
        AND sdw.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(sdw.App_Name, 2) != 'CT' AND sdw.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(sdw.App_Name, 2) != 'CT' AND sdw.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (sdw.Country_Code IS NULL OR sdw.Country_Code = '')
    )
  GROUP BY sdw.Report_date, sdw.App_Name, sdw.Country_Code, sdw.AFID, sdw.window_start_date
),

t30d_new_users_calc AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    aba.AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS T30D_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID
    FROM app_afid_base_aggregated
  ) aba
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(aba.App_Name, 2)
    AND COALESCE(base.AFID_CHANNEL, 80) = aba.AFID
    AND base.Date_of_Sale BETWEEN DATE_SUB(aba.Report_date, INTERVAL 29 DAY) AND aba.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    AND (
      (LEFT(aba.App_Name, 2) = 'CT' AND aba.App_Name NOT LIKE '%Non-JP%' 
        AND aba.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(aba.App_Name, 2) = 'CT' AND aba.App_Name LIKE '%Non-JP%' 
        AND aba.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(aba.App_Name, 2) != 'CT' AND aba.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(aba.App_Name, 2) != 'CT' AND aba.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (aba.Country_Code IS NULL OR aba.Country_Code = '')
    )
  GROUP BY aba.Report_date, aba.App_Name, aba.Country_Code, aba.AFID
),

-- =====================================================
-- CTE 7: ASSEMBLE ALL BASE DATA + CHURN RATE
-- CHANGE: Refund_ratio now from lookup table
-- =====================================================
with_churn AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    aba.AFID,
    aba.Billing_Cycle,
    
    aba.Subscription_users,
    aba.Subscription_value,
    aba.Rebill_users,
    aba.Rebill_value,
    aba.SS_Users,
    aba.SS_Value,
    
    CASE 
      WHEN aba.Billing_Cycle = 0 THEN COALESCE(rsc.Recent_Spend, 0)
      ELSE 0
    END AS Recent_Spend,
    CASE 
      WHEN aba.Billing_Cycle = 0 THEN COALESCE(ruc.Recent_Users, 0)
      ELSE 0
    END AS Recent_Users,
    
    COALESCE(t30d.T30D_New_Users, 0) AS T30D_New_Users,
    
    -- CHANGE: Refund_ratio from lookup table
    COALESCE(rfl.Refund_Ratio, 0) AS Refund_ratio,
    
    CASE 
      WHEN aba.Billing_Cycle = 0 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(aba.Rebill_users, NULLIF(aba.Subscription_users, 0)), 0)
    END AS Churn_rate
    
  FROM app_afid_base_aggregated aba
  LEFT JOIN recent_spend_calc rsc
    ON aba.Report_date = rsc.Report_date
    AND aba.App_Name = rsc.App_Name
    AND aba.Country_Code = rsc.Country_Code
    AND aba.AFID = rsc.AFID
    AND aba.Billing_Cycle = 0
  LEFT JOIN recent_users_calc ruc
    ON aba.Report_date = ruc.Report_date
    AND aba.App_Name = ruc.App_Name
    AND aba.Country_Code = ruc.Country_Code
    AND aba.AFID = ruc.AFID
    AND aba.Billing_Cycle = 0
  LEFT JOIN t30d_new_users_calc t30d
    ON aba.Report_date = t30d.Report_date
    AND aba.App_Name = t30d.App_Name
    AND aba.Country_Code = t30d.Country_Code
    AND aba.AFID = t30d.AFID
  -- CHANGE: Refund ratio lookup
  LEFT JOIN `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_App` rfl
    ON aba.Report_date = rfl.Report_date
    AND aba.App_Name = rfl.App_Name
    AND aba.AFID = rfl.AFID
    AND aba.Billing_Cycle = rfl.Billing_Cycle
),

retention_step_0 AS (
  SELECT wc.*,
    CASE WHEN wc.Billing_Cycle = 0 THEN 1.0 ELSE NULL END AS step_0_retention
  FROM with_churn wc
),

retention_step_1 AS (
  SELECT rs0.*,
    CASE WHEN rs0.step_0_retention IS NOT NULL THEN rs0.step_0_retention
      WHEN rs0.Billing_Cycle = 1 THEN 
        CASE WHEN LAG(rs0.step_0_retention) OVER (PARTITION BY rs0.Report_date, rs0.App_Name, rs0.Country_Code, rs0.AFID ORDER BY rs0.Billing_Cycle) IS NULL THEN NULL
          WHEN rs0.Rebill_users < 25 THEN NULL
          ELSE LAG(rs0.step_0_retention) OVER (PARTITION BY rs0.Report_date, rs0.App_Name, rs0.Country_Code, rs0.AFID ORDER BY rs0.Billing_Cycle) * (1 - rs0.Churn_rate) END
      ELSE NULL END AS step_1_retention
  FROM retention_step_0 rs0
),

retention_step_2 AS (
  SELECT rs1.*,
    CASE WHEN rs1.step_1_retention IS NOT NULL THEN rs1.step_1_retention
      WHEN rs1.Billing_Cycle = 2 THEN 
        CASE WHEN LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.Report_date, rs1.App_Name, rs1.Country_Code, rs1.AFID ORDER BY rs1.Billing_Cycle) IS NULL THEN NULL
          WHEN rs1.Rebill_users < 25 THEN NULL
          ELSE LAG(rs1.step_1_retention) OVER (PARTITION BY rs1.Report_date, rs1.App_Name, rs1.Country_Code, rs1.AFID ORDER BY rs1.Billing_Cycle) * (1 - rs1.Churn_rate) END
      ELSE NULL END AS step_2_retention
  FROM retention_step_1 rs1
),

retention_step_3 AS (
  SELECT rs2.*,
    CASE WHEN rs2.step_2_retention IS NOT NULL THEN rs2.step_2_retention
      WHEN rs2.Billing_Cycle = 3 THEN 
        CASE WHEN LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.Report_date, rs2.App_Name, rs2.Country_Code, rs2.AFID ORDER BY rs2.Billing_Cycle) IS NULL THEN NULL
          WHEN rs2.Rebill_users < 25 THEN NULL
          ELSE LAG(rs2.step_2_retention) OVER (PARTITION BY rs2.Report_date, rs2.App_Name, rs2.Country_Code, rs2.AFID ORDER BY rs2.Billing_Cycle) * (1 - rs2.Churn_rate) END
      ELSE NULL END AS step_3_retention
  FROM retention_step_2 rs2
),

retention_step_4 AS (
  SELECT rs3.*,
    CASE WHEN rs3.step_3_retention IS NOT NULL THEN rs3.step_3_retention
      WHEN rs3.Billing_Cycle = 4 THEN 
        CASE WHEN LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.Report_date, rs3.App_Name, rs3.Country_Code, rs3.AFID ORDER BY rs3.Billing_Cycle) IS NULL THEN NULL
          WHEN rs3.Rebill_users < 25 THEN NULL
          ELSE LAG(rs3.step_3_retention) OVER (PARTITION BY rs3.Report_date, rs3.App_Name, rs3.Country_Code, rs3.AFID ORDER BY rs3.Billing_Cycle) * (1 - rs3.Churn_rate) END
      ELSE NULL END AS step_4_retention
  FROM retention_step_3 rs3
),

retention_step_5 AS (
  SELECT rs4.*,
    CASE WHEN rs4.step_4_retention IS NOT NULL THEN rs4.step_4_retention
      WHEN rs4.Billing_Cycle = 5 THEN 
        CASE WHEN LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.Report_date, rs4.App_Name, rs4.Country_Code, rs4.AFID ORDER BY rs4.Billing_Cycle) IS NULL THEN NULL
          WHEN rs4.Rebill_users < 25 THEN NULL
          ELSE LAG(rs4.step_4_retention) OVER (PARTITION BY rs4.Report_date, rs4.App_Name, rs4.Country_Code, rs4.AFID ORDER BY rs4.Billing_Cycle) * (1 - rs4.Churn_rate) END
      ELSE NULL END AS step_5_retention
  FROM retention_step_4 rs4
),

retention_step_6 AS (
  SELECT rs5.*,
    CASE WHEN rs5.step_5_retention IS NOT NULL THEN rs5.step_5_retention
      WHEN rs5.Billing_Cycle = 6 THEN 
        CASE WHEN LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.Report_date, rs5.App_Name, rs5.Country_Code, rs5.AFID ORDER BY rs5.Billing_Cycle) IS NULL THEN NULL
          WHEN rs5.Rebill_users < 25 THEN NULL
          ELSE LAG(rs5.step_5_retention) OVER (PARTITION BY rs5.Report_date, rs5.App_Name, rs5.Country_Code, rs5.AFID ORDER BY rs5.Billing_Cycle) * (1 - rs5.Churn_rate) END
      ELSE NULL END AS step_6_retention
  FROM retention_step_5 rs5
),

retention_step_7 AS (
  SELECT rs6.*,
    CASE WHEN rs6.step_6_retention IS NOT NULL THEN rs6.step_6_retention
      WHEN rs6.Billing_Cycle = 7 THEN 
        CASE WHEN LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.Report_date, rs6.App_Name, rs6.Country_Code, rs6.AFID ORDER BY rs6.Billing_Cycle) IS NULL THEN NULL
          WHEN rs6.Rebill_users < 25 THEN NULL
          ELSE LAG(rs6.step_6_retention) OVER (PARTITION BY rs6.Report_date, rs6.App_Name, rs6.Country_Code, rs6.AFID ORDER BY rs6.Billing_Cycle) * (1 - rs6.Churn_rate) END
      ELSE NULL END AS step_7_retention
  FROM retention_step_6 rs6
),

retention_step_8 AS (
  SELECT rs7.*,
    CASE WHEN rs7.step_7_retention IS NOT NULL THEN rs7.step_7_retention
      WHEN rs7.Billing_Cycle = 8 THEN 
        CASE WHEN LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.Report_date, rs7.App_Name, rs7.Country_Code, rs7.AFID ORDER BY rs7.Billing_Cycle) IS NULL THEN NULL
          WHEN rs7.Rebill_users < 25 THEN NULL
          ELSE LAG(rs7.step_7_retention) OVER (PARTITION BY rs7.Report_date, rs7.App_Name, rs7.Country_Code, rs7.AFID ORDER BY rs7.Billing_Cycle) * (1 - rs7.Churn_rate) END
      ELSE NULL END AS step_8_retention
  FROM retention_step_7 rs7
),

retention_step_9 AS (
  SELECT rs8.*,
    CASE WHEN rs8.step_8_retention IS NOT NULL THEN rs8.step_8_retention
      WHEN rs8.Billing_Cycle = 9 THEN 
        CASE WHEN LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.Report_date, rs8.App_Name, rs8.Country_Code, rs8.AFID ORDER BY rs8.Billing_Cycle) IS NULL THEN NULL
          WHEN rs8.Rebill_users < 25 THEN NULL
          ELSE LAG(rs8.step_8_retention) OVER (PARTITION BY rs8.Report_date, rs8.App_Name, rs8.Country_Code, rs8.AFID ORDER BY rs8.Billing_Cycle) * (1 - rs8.Churn_rate) END
      ELSE NULL END AS step_9_retention
  FROM retention_step_8 rs8
),

retention_step_10 AS (
  SELECT rs9.*,
    CASE WHEN rs9.step_9_retention IS NOT NULL THEN rs9.step_9_retention
      WHEN rs9.Billing_Cycle = 10 THEN 
        CASE WHEN LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.Report_date, rs9.App_Name, rs9.Country_Code, rs9.AFID ORDER BY rs9.Billing_Cycle) IS NULL THEN NULL
          WHEN rs9.Rebill_users < 25 THEN NULL
          ELSE LAG(rs9.step_9_retention) OVER (PARTITION BY rs9.Report_date, rs9.App_Name, rs9.Country_Code, rs9.AFID ORDER BY rs9.Billing_Cycle) * (1 - rs9.Churn_rate) END
      ELSE NULL END AS step_10_retention
  FROM retention_step_9 rs9
),

retention_step_11 AS (
  SELECT rs10.*,
    CASE WHEN rs10.step_10_retention IS NOT NULL THEN rs10.step_10_retention
      WHEN rs10.Billing_Cycle = 11 THEN 
        CASE WHEN LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.Report_date, rs10.App_Name, rs10.Country_Code, rs10.AFID ORDER BY rs10.Billing_Cycle) IS NULL THEN NULL
          WHEN rs10.Rebill_users < 25 THEN NULL
          ELSE LAG(rs10.step_10_retention) OVER (PARTITION BY rs10.Report_date, rs10.App_Name, rs10.Country_Code, rs10.AFID ORDER BY rs10.Billing_Cycle) * (1 - rs10.Churn_rate) END
      ELSE NULL END AS step_11_retention
  FROM retention_step_10 rs10
),

retention_step_12 AS (
  SELECT rs11.*,
    CASE WHEN rs11.step_11_retention IS NOT NULL THEN rs11.step_11_retention
      WHEN rs11.Billing_Cycle = 12 THEN 
        CASE WHEN LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.Report_date, rs11.App_Name, rs11.Country_Code, rs11.AFID ORDER BY rs11.Billing_Cycle) IS NULL THEN NULL
          WHEN rs11.Rebill_users < 25 THEN NULL
          ELSE LAG(rs11.step_11_retention) OVER (PARTITION BY rs11.Report_date, rs11.App_Name, rs11.Country_Code, rs11.AFID ORDER BY rs11.Billing_Cycle) * (1 - rs11.Churn_rate) END
      ELSE rs11.step_11_retention END AS Retention_rate
  FROM retention_step_11 rs11
),

active_apps AS (
  SELECT DISTINCT App_Name
  FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
),

final_calculations AS (
  SELECT 
    rs12.*,
    
    CASE 
      WHEN aa.App_Name IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END AS Active_Inactive,

    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE rs12.Churn_rate
    END AS final_Churn_rate,

    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE rs12.Refund_ratio
    END AS final_Refund_ratio,
    
    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE rs12.Retention_rate - rs12.Refund_ratio
    END AS NET_Retention_rate,
    
    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        CASE 
          WHEN rs12.Billing_Cycle = 0 
          THEN SAFE_DIVIDE(rs12.Recent_Spend, NULLIF(rs12.Recent_Users, 0))
          ELSE 0.0
        END,
        0.0
      )
    END AS Recent_CAC,
    
    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.Rebill_value, NULLIF(rs12.Rebill_users, 0)) * rs12.Retention_rate,
        0.0
      ) + COALESCE(
        SAFE_DIVIDE(rs12.SS_Value, NULLIF(rs12.Subscription_users, 0)),
        0.0
      )
    END AS ARPU_Discounted,
    
    CASE 
      WHEN rs12.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs12.Rebill_value, NULLIF(rs12.Rebill_users, 0)) * (rs12.Retention_rate - rs12.Refund_ratio),
        0.0
      ) + COALESCE(
        SAFE_DIVIDE(rs12.SS_Value, NULLIF(rs12.Subscription_users, 0)),
        0.0
      )
    END AS Net_ARPU_Discounted
    
  FROM retention_step_12 rs12
  LEFT JOIN active_apps aa
    ON rs12.App_Name = aa.App_Name
)

SELECT 
  fc.Report_date,
  fc.App_Name,
  fc.Country_Code,
  fc.AFID,
  fc.Billing_Cycle,
  
  fc.Active_Inactive,
  
  fc.Subscription_users,
  fc.Subscription_value,
  fc.Rebill_users,
  fc.Rebill_value,
  fc.SS_Users,
  fc.SS_Value,
  
  fc.Recent_Spend,
  fc.Recent_Users,
  fc.T30D_New_Users,
  
  fc.final_Churn_rate AS Churn_rate,
  fc.final_Refund_ratio AS Refund_ratio,
  fc.Retention_rate,
  fc.NET_Retention_rate,
  
  fc.Recent_CAC,
  
  fc.ARPU_Discounted,
  fc.Net_ARPU_Discounted,
  CASE 
    WHEN fc.Net_ARPU_Discounted IS NULL THEN NULL
    ELSE fc.Net_ARPU_Discounted - fc.Recent_CAC
  END AS Net_LTV_Discounted

FROM final_calculations fc
ORDER BY fc.Report_date DESC, fc.App_Name, fc.Country_Code, fc.AFID, fc.Billing_Cycle;
