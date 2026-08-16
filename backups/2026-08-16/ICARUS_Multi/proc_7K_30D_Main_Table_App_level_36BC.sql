CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.proc_7K_30D_Main_Table_App_level_36BC()
BEGIN

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table_App_level_36BC` AS

WITH
config AS (
  SELECT 
    7 AS recent_cac_days,
    25 AS minimum_rebill_users
),

active_vg_apps AS (
  SELECT App_Name
  FROM `variant-finance-data-project.ICARUS_Multi.Dim_Active_VG_Apps`
),

active_vg_prefixes AS (
  SELECT DISTINCT LEFT(App_Name, 2) AS App_Prefix
  FROM `variant-finance-data-project.ICARUS_Multi.Dim_Active_VG_Apps`
),

-- =====================================================
-- CTE 1: AGGREGATE BASE METRICS FROM PRODUCT-LEVEL TABLE
-- VG CHANGE: Filtered to 7 active apps only
-- =====================================================
app_base_aggregated AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
    Billing_Cycle,
    
    SUM(Subscription_users) AS Subscription_users,
    SUM(Subscription_value) AS Subscription_value,
    SUM(Rebill_users) AS Rebill_users,
    SUM(Rebill_value) AS Rebill_value,
    SUM(SS_Users) AS SS_Users,
    SUM(Single_Sale_Value) AS Single_Sale_Value
    
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
  GROUP BY Report_date, App_Name, Country_Code, Billing_Cycle

  UNION ALL

  -- VG: Now filtered to only active apps
  SELECT 
    Report_date,
    'VG' AS App_Name,
    '' AS Country_Code,
    Billing_Cycle,
    
    SUM(Subscription_users) AS Subscription_users,
    SUM(Subscription_value) AS Subscription_value,
    SUM(Rebill_users) AS Rebill_users,
    SUM(Rebill_value) AS Rebill_value,
    SUM(SS_Users) AS SS_Users,
    SUM(Single_Sale_Value) AS Single_Sale_Value
    
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
  WHERE App_Name IN (SELECT App_Name FROM active_vg_apps)
  GROUP BY Report_date, Billing_Cycle
),

last_spend_dates AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    MAX(ads.Date) AS last_spend_date
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM app_base_aggregated
    WHERE Billing_Cycle = 0
      AND App_Name != 'VG'
  ) aba
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON aba.App_Name = ads.App_Name
    AND ads.Date <= aba.Report_date
    AND ads.allocated_spend > 0
    AND (
      (aba.Country_Code = 'JP' AND ads.Country = 'JP')
      OR (aba.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL))
      OR (aba.Country_Code IS NULL OR aba.Country_Code = '')
    )
  GROUP BY aba.Report_date, aba.App_Name, aba.Country_Code
),

spend_date_windows AS (
  SELECT 
    Report_date,
    App_Name,
    Country_Code,
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
    AND ads.Date BETWEEN sdw.window_start_date AND sdw.window_end_date
  GROUP BY sdw.Report_date, sdw.App_Name, sdw.Country_Code, sdw.window_start_date
),

recent_users_calc AS (
  SELECT 
    sdw.Report_date,
    sdw.App_Name,
    sdw.Country_Code,
    CASE 
      WHEN sdw.window_start_date IS NOT NULL THEN
        COUNT(DISTINCT base.Updated_Cust_ID)
      ELSE 0
    END AS Recent_Users
  FROM spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(sdw.App_Name, 2)
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
  GROUP BY sdw.Report_date, sdw.App_Name, sdw.Country_Code, sdw.window_start_date
),

t30d_new_users_calc AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    COUNT(DISTINCT base.Updated_Cust_ID) AS T30D_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code
    FROM app_base_aggregated
    WHERE App_Name != 'VG'
  ) aba
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(aba.App_Name, 2)
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
  GROUP BY aba.Report_date, aba.App_Name, aba.Country_Code
),

-- VG CHANGE: Filtered to 7 active apps only
vg_last_spend_dates AS (
  SELECT 
    aba.Report_date,
    MAX(ads.Date) AS last_spend_date
  FROM (
    SELECT DISTINCT Report_date
    FROM app_base_aggregated
    WHERE App_Name = 'VG' AND Billing_Cycle = 0
  ) aba
LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date <= aba.Report_date
    AND ads.allocated_spend > 0
  INNER JOIN active_vg_apps ava
    ON ads.App_Name = ava.App_Name
  GROUP BY aba.Report_date
),

vg_spend_date_windows AS (
  SELECT 
    Report_date,
    last_spend_date,
    CASE 
      WHEN last_spend_date IS NOT NULL 
      THEN DATE_SUB(last_spend_date, INTERVAL (SELECT recent_cac_days FROM config) - 1 DAY)
      ELSE NULL
    END AS window_start_date,
    last_spend_date AS window_end_date
  FROM vg_last_spend_dates
),

-- VG CHANGE: Filtered to 7 active apps only
vg_recent_spend_calc AS (
  SELECT 
    sdw.Report_date,
    CASE 
      WHEN sdw.window_start_date IS NOT NULL THEN
        COALESCE(SUM(ads.allocated_spend), 0)
      ELSE 0
    END AS Recent_Spend
  FROM vg_spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date BETWEEN sdw.window_start_date AND sdw.window_end_date
    AND ads.allocated_spend > 0
  INNER JOIN active_vg_apps ava
    ON ads.App_Name = ava.App_Name
  GROUP BY sdw.Report_date, sdw.window_start_date
),

-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
vg_recent_users_calc AS (
  SELECT 
    sdw.Report_date,
    CASE 
      WHEN sdw.window_start_date IS NOT NULL THEN
        COUNT(DISTINCT base.Updated_Cust_ID)
      ELSE 0
    END AS Recent_Users
  FROM vg_spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale BETWEEN sdw.window_start_date AND sdw.window_end_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
  AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  INNER JOIN active_vg_prefixes avp
    ON LEFT(base.App_Name, 2) = avp.App_Prefix
  GROUP BY sdw.Report_date, sdw.window_start_date
),

-- VG CHANGE: Filtered to 7 active apps (2-letter prefix)
vg_t30d_new_users_calc AS (
  SELECT 
    aba.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS T30D_New_Users
  FROM (
    SELECT DISTINCT Report_date
    FROM app_base_aggregated
    WHERE App_Name = 'VG'
  ) aba
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale BETWEEN DATE_SUB(aba.Report_date, INTERVAL 29 DAY) AND aba.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
  AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  INNER JOIN active_vg_prefixes avp
    ON LEFT(base.App_Name, 2) = avp.App_Prefix
  GROUP BY aba.Report_date
),

-- =====================================================
-- VG REFUND RATIO FROM LOOKUP
-- VG CHANGE: Filtered to 7 active apps only
-- =====================================================
vg_refund_from_lookup AS (
  SELECT
    aba.Report_date,
    aba.Billing_Cycle,
    COALESCE(
      SAFE_DIVIDE(
        SUM(COALESCE(rfl.Refund_Ratio, 0) * aba.Rebill_value),
        SUM(aba.Rebill_value)
      ),
      0
    ) AS Refund_ratio
  FROM app_base_aggregated aba
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.Refund_Table_App_Level` rfl
    ON aba.Report_date = rfl.Report_date
    AND aba.App_Name = rfl.App_Name
      AND aba.Billing_Cycle = rfl.Billing_Cycle
  WHERE aba.App_Name IN (SELECT App_Name FROM active_vg_apps)
  GROUP BY aba.Report_date, aba.Billing_Cycle
),

-- =====================================================
-- CTE 7: ASSEMBLE ALL BASE DATA + CHURN RATE
-- =====================================================
with_churn AS (
  SELECT 
    aba.Report_date,
    aba.App_Name,
    aba.Country_Code,
    aba.Billing_Cycle,
    
    aba.Subscription_users,
    aba.Subscription_value,
    aba.Rebill_users,
    aba.Rebill_value,
    aba.SS_Users,
    aba.Single_Sale_Value,
    
    -- Recent metrics
    CASE 
      WHEN aba.Billing_Cycle = 0 AND aba.App_Name = 'VG' THEN COALESCE(vg_rsc.Recent_Spend, 0)
      WHEN aba.Billing_Cycle = 0 THEN COALESCE(rsc.Recent_Spend, 0)
      ELSE 0
    END AS Recent_Spend,
    CASE 
      WHEN aba.Billing_Cycle = 0 AND aba.App_Name = 'VG' THEN COALESCE(vg_ruc.Recent_Users, 0)
      WHEN aba.Billing_Cycle = 0 THEN COALESCE(ruc.Recent_Users, 0)
      ELSE 0
    END AS Recent_Users,
    
    CASE 
      WHEN aba.App_Name = 'VG' THEN COALESCE(vg_t30d.T30D_New_Users, 0)
      ELSE COALESCE(t30d.T30D_New_Users, 0)
    END AS T30D_New_Users,
    
    CASE 
      WHEN aba.App_Name = 'VG' THEN COALESCE(vg_rfl.Refund_ratio, 0)
      ELSE COALESCE(rfl.Refund_Ratio, 0)
    END AS Refund_ratio,
    
    -- Churn rate
    CASE 
      WHEN aba.Billing_Cycle = 0 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(aba.Rebill_users, NULLIF(aba.Subscription_users, 0)), 0)
    END AS Churn_rate
    
  FROM app_base_aggregated aba
  LEFT JOIN recent_spend_calc rsc
    ON aba.Report_date = rsc.Report_date
    AND aba.App_Name = rsc.App_Name
    AND aba.Country_Code = rsc.Country_Code
    AND aba.Billing_Cycle = 0
    AND aba.App_Name != 'VG'
  LEFT JOIN recent_users_calc ruc
    ON aba.Report_date = ruc.Report_date
    AND aba.App_Name = ruc.App_Name
    AND aba.Country_Code = ruc.Country_Code
    AND aba.Billing_Cycle = 0
    AND aba.App_Name != 'VG'
  LEFT JOIN t30d_new_users_calc t30d
    ON aba.Report_date = t30d.Report_date
    AND aba.App_Name = t30d.App_Name
    AND aba.Country_Code = t30d.Country_Code
    AND aba.App_Name != 'VG'
  LEFT JOIN vg_recent_spend_calc vg_rsc
    ON aba.Report_date = vg_rsc.Report_date
    AND aba.App_Name = 'VG'
    AND aba.Billing_Cycle = 0
  LEFT JOIN vg_recent_users_calc vg_ruc
    ON aba.Report_date = vg_ruc.Report_date
    AND aba.App_Name = 'VG'
    AND aba.Billing_Cycle = 0
  LEFT JOIN vg_t30d_new_users_calc vg_t30d
    ON aba.Report_date = vg_t30d.Report_date
    AND aba.App_Name = 'VG'
  LEFT JOIN `variant-finance-data-project.ICARUS_Multi.Refund_Table_App_Level` rfl
    ON aba.Report_date = rfl.Report_date
    AND aba.App_Name = rfl.App_Name
    AND aba.Billing_Cycle = rfl.Billing_Cycle
    AND aba.App_Name != 'VG'
  LEFT JOIN vg_refund_from_lookup vg_rfl
    ON aba.Report_date = vg_rfl.Report_date
    AND aba.Billing_Cycle = vg_rfl.Billing_Cycle
    AND aba.App_Name = 'VG'
),

-- =====================================================
-- RETENTION CASCADE (unchanged)
-- =====================================================
retention_step_0 AS (
  SELECT 
    wc.*,
    CASE 
      WHEN wc.Billing_Cycle = 0 THEN 1.0
      ELSE NULL
    END AS step_0_retention
  FROM with_churn wc
),

retention_step_1 AS (
  SELECT 
    rs0.*,
    CASE 
      WHEN rs0.step_0_retention IS NOT NULL THEN rs0.step_0_retention
      WHEN rs0.Billing_Cycle = 1 THEN 
        CASE
          WHEN LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.Report_date, rs0.App_Name, rs0.Country_Code
            ORDER BY rs0.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs0.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.Report_date, rs0.App_Name, rs0.Country_Code
            ORDER BY rs0.Billing_Cycle
          ) * (1 - rs0.Churn_rate)
        END
      ELSE NULL
    END AS step_1_retention
  FROM retention_step_0 rs0
),

retention_step_2 AS (
  SELECT 
    rs1.*,
    CASE 
      WHEN rs1.step_1_retention IS NOT NULL THEN rs1.step_1_retention
      WHEN rs1.Billing_Cycle = 2 THEN 
        CASE
          WHEN LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.Report_date, rs1.App_Name, rs1.Country_Code
            ORDER BY rs1.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs1.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.Report_date, rs1.App_Name, rs1.Country_Code
            ORDER BY rs1.Billing_Cycle
          ) * (1 - rs1.Churn_rate)
        END
      ELSE NULL
    END AS step_2_retention
  FROM retention_step_1 rs1
),

retention_step_3 AS (
  SELECT 
    rs2.*,
    CASE 
      WHEN rs2.step_2_retention IS NOT NULL THEN rs2.step_2_retention
      WHEN rs2.Billing_Cycle = 3 THEN 
        CASE
          WHEN LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.Report_date, rs2.App_Name, rs2.Country_Code
            ORDER BY rs2.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs2.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.Report_date, rs2.App_Name, rs2.Country_Code
            ORDER BY rs2.Billing_Cycle
          ) * (1 - rs2.Churn_rate)
        END
      ELSE NULL
    END AS step_3_retention
  FROM retention_step_2 rs2
),

retention_step_4 AS (
  SELECT 
    rs3.*,
    CASE 
      WHEN rs3.step_3_retention IS NOT NULL THEN rs3.step_3_retention
      WHEN rs3.Billing_Cycle = 4 THEN 
        CASE
          WHEN LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.Report_date, rs3.App_Name, rs3.Country_Code
            ORDER BY rs3.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs3.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.Report_date, rs3.App_Name, rs3.Country_Code
            ORDER BY rs3.Billing_Cycle
          ) * (1 - rs3.Churn_rate)
        END
      ELSE NULL
    END AS step_4_retention
  FROM retention_step_3 rs3
),

retention_step_5 AS (
  SELECT 
    rs4.*,
    CASE 
      WHEN rs4.step_4_retention IS NOT NULL THEN rs4.step_4_retention
      WHEN rs4.Billing_Cycle = 5 THEN 
        CASE
          WHEN LAG(rs4.step_4_retention) OVER (
            PARTITION BY rs4.Report_date, rs4.App_Name, rs4.Country_Code
            ORDER BY rs4.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs4.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs4.step_4_retention) OVER (
            PARTITION BY rs4.Report_date, rs4.App_Name, rs4.Country_Code
            ORDER BY rs4.Billing_Cycle
          ) * (1 - rs4.Churn_rate)
        END
      ELSE NULL
    END AS step_5_retention
  FROM retention_step_4 rs4
),

retention_step_6 AS (
  SELECT 
    rs5.*,
    CASE 
      WHEN rs5.step_5_retention IS NOT NULL THEN rs5.step_5_retention
      WHEN rs5.Billing_Cycle = 6 THEN 
        CASE
          WHEN LAG(rs5.step_5_retention) OVER (
            PARTITION BY rs5.Report_date, rs5.App_Name, rs5.Country_Code
            ORDER BY rs5.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs5.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs5.step_5_retention) OVER (
            PARTITION BY rs5.Report_date, rs5.App_Name, rs5.Country_Code
            ORDER BY rs5.Billing_Cycle
          ) * (1 - rs5.Churn_rate)
        END
      ELSE NULL
    END AS step_6_retention
  FROM retention_step_5 rs5
),

retention_step_7 AS (
  SELECT 
    rs6.*,
    CASE 
      WHEN rs6.step_6_retention IS NOT NULL THEN rs6.step_6_retention
      WHEN rs6.Billing_Cycle = 7 THEN 
        CASE
          WHEN LAG(rs6.step_6_retention) OVER (
            PARTITION BY rs6.Report_date, rs6.App_Name, rs6.Country_Code
            ORDER BY rs6.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs6.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs6.step_6_retention) OVER (
            PARTITION BY rs6.Report_date, rs6.App_Name, rs6.Country_Code
            ORDER BY rs6.Billing_Cycle
          ) * (1 - rs6.Churn_rate)
        END
      ELSE NULL
    END AS step_7_retention
  FROM retention_step_6 rs6
),

retention_step_8 AS (
  SELECT 
    rs7.*,
    CASE 
      WHEN rs7.step_7_retention IS NOT NULL THEN rs7.step_7_retention
      WHEN rs7.Billing_Cycle = 8 THEN 
        CASE
          WHEN LAG(rs7.step_7_retention) OVER (
            PARTITION BY rs7.Report_date, rs7.App_Name, rs7.Country_Code
            ORDER BY rs7.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs7.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs7.step_7_retention) OVER (
            PARTITION BY rs7.Report_date, rs7.App_Name, rs7.Country_Code
            ORDER BY rs7.Billing_Cycle
          ) * (1 - rs7.Churn_rate)
        END
      ELSE NULL
    END AS step_8_retention
  FROM retention_step_7 rs7
),

retention_step_9 AS (
  SELECT 
    rs8.*,
    CASE 
      WHEN rs8.step_8_retention IS NOT NULL THEN rs8.step_8_retention
      WHEN rs8.Billing_Cycle = 9 THEN 
        CASE
          WHEN LAG(rs8.step_8_retention) OVER (
            PARTITION BY rs8.Report_date, rs8.App_Name, rs8.Country_Code
            ORDER BY rs8.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs8.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs8.step_8_retention) OVER (
            PARTITION BY rs8.Report_date, rs8.App_Name, rs8.Country_Code
            ORDER BY rs8.Billing_Cycle
          ) * (1 - rs8.Churn_rate)
        END
      ELSE NULL
    END AS step_9_retention
  FROM retention_step_8 rs8
),

retention_step_10 AS (
  SELECT 
    rs9.*,
    CASE 
      WHEN rs9.step_9_retention IS NOT NULL THEN rs9.step_9_retention
      WHEN rs9.Billing_Cycle = 10 THEN 
        CASE
          WHEN LAG(rs9.step_9_retention) OVER (
            PARTITION BY rs9.Report_date, rs9.App_Name, rs9.Country_Code
            ORDER BY rs9.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs9.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs9.step_9_retention) OVER (
            PARTITION BY rs9.Report_date, rs9.App_Name, rs9.Country_Code
            ORDER BY rs9.Billing_Cycle
          ) * (1 - rs9.Churn_rate)
        END
      ELSE NULL
    END AS step_10_retention
  FROM retention_step_9 rs9
),

retention_step_11 AS (
  SELECT 
    rs10.*,
    CASE 
      WHEN rs10.step_10_retention IS NOT NULL THEN rs10.step_10_retention
      WHEN rs10.Billing_Cycle = 11 THEN 
        CASE
          WHEN LAG(rs10.step_10_retention) OVER (
            PARTITION BY rs10.Report_date, rs10.App_Name, rs10.Country_Code
            ORDER BY rs10.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs10.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs10.step_10_retention) OVER (
            PARTITION BY rs10.Report_date, rs10.App_Name, rs10.Country_Code
            ORDER BY rs10.Billing_Cycle
          ) * (1 - rs10.Churn_rate)
        END
      ELSE NULL
    END AS step_11_retention
  FROM retention_step_10 rs10
),

retention_step_12 AS (
  SELECT 
    rs11.*,
    CASE 
      WHEN rs11.step_11_retention IS NOT NULL THEN rs11.step_11_retention
      WHEN rs11.Billing_Cycle = 12 THEN 
        CASE
          WHEN LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.Report_date, rs11.App_Name, rs11.Country_Code
            ORDER BY rs11.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs11.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs11.step_11_retention) OVER (
            PARTITION BY rs11.Report_date, rs11.App_Name, rs11.Country_Code
            ORDER BY rs11.Billing_Cycle
          ) * (1 - rs11.Churn_rate)
        END
      ELSE NULL
    END AS step_12_retention
  FROM retention_step_11 rs11
),

retention_step_13 AS (
  SELECT 
    rs12.*,
    CASE 
      WHEN rs12.step_12_retention IS NOT NULL THEN rs12.step_12_retention
      WHEN rs12.Billing_Cycle = 13 THEN 
        CASE
          WHEN LAG(rs12.step_12_retention) OVER (
            PARTITION BY rs12.Report_date, rs12.App_Name, rs12.Country_Code
            ORDER BY rs12.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs12.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs12.step_12_retention) OVER (
            PARTITION BY rs12.Report_date, rs12.App_Name, rs12.Country_Code
            ORDER BY rs12.Billing_Cycle
          ) * (1 - rs12.Churn_rate)
        END
      ELSE NULL
    END AS step_13_retention
  FROM retention_step_12 rs12
),

retention_step_14 AS (
  SELECT 
    rs13.*,
    CASE 
      WHEN rs13.step_13_retention IS NOT NULL THEN rs13.step_13_retention
      WHEN rs13.Billing_Cycle = 14 THEN 
        CASE
          WHEN LAG(rs13.step_13_retention) OVER (
            PARTITION BY rs13.Report_date, rs13.App_Name, rs13.Country_Code
            ORDER BY rs13.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs13.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs13.step_13_retention) OVER (
            PARTITION BY rs13.Report_date, rs13.App_Name, rs13.Country_Code
            ORDER BY rs13.Billing_Cycle
          ) * (1 - rs13.Churn_rate)
        END
      ELSE NULL
    END AS step_14_retention
  FROM retention_step_13 rs13
),

retention_step_15 AS (
  SELECT 
    rs14.*,
    CASE 
      WHEN rs14.step_14_retention IS NOT NULL THEN rs14.step_14_retention
      WHEN rs14.Billing_Cycle = 15 THEN 
        CASE
          WHEN LAG(rs14.step_14_retention) OVER (
            PARTITION BY rs14.Report_date, rs14.App_Name, rs14.Country_Code
            ORDER BY rs14.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs14.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs14.step_14_retention) OVER (
            PARTITION BY rs14.Report_date, rs14.App_Name, rs14.Country_Code
            ORDER BY rs14.Billing_Cycle
          ) * (1 - rs14.Churn_rate)
        END
      ELSE NULL
    END AS step_15_retention
  FROM retention_step_14 rs14
),

retention_step_16 AS (
  SELECT 
    rs15.*,
    CASE 
      WHEN rs15.step_15_retention IS NOT NULL THEN rs15.step_15_retention
      WHEN rs15.Billing_Cycle = 16 THEN 
        CASE
          WHEN LAG(rs15.step_15_retention) OVER (
            PARTITION BY rs15.Report_date, rs15.App_Name, rs15.Country_Code
            ORDER BY rs15.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs15.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs15.step_15_retention) OVER (
            PARTITION BY rs15.Report_date, rs15.App_Name, rs15.Country_Code
            ORDER BY rs15.Billing_Cycle
          ) * (1 - rs15.Churn_rate)
        END
      ELSE NULL
    END AS step_16_retention
  FROM retention_step_15 rs15
),

retention_step_17 AS (
  SELECT 
    rs16.*,
    CASE 
      WHEN rs16.step_16_retention IS NOT NULL THEN rs16.step_16_retention
      WHEN rs16.Billing_Cycle = 17 THEN 
        CASE
          WHEN LAG(rs16.step_16_retention) OVER (
            PARTITION BY rs16.Report_date, rs16.App_Name, rs16.Country_Code
            ORDER BY rs16.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs16.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs16.step_16_retention) OVER (
            PARTITION BY rs16.Report_date, rs16.App_Name, rs16.Country_Code
            ORDER BY rs16.Billing_Cycle
          ) * (1 - rs16.Churn_rate)
        END
      ELSE NULL
    END AS step_17_retention
  FROM retention_step_16 rs16
),

retention_step_18 AS (
  SELECT 
    rs17.*,
    CASE 
      WHEN rs17.step_17_retention IS NOT NULL THEN rs17.step_17_retention
      WHEN rs17.Billing_Cycle = 18 THEN 
        CASE
          WHEN LAG(rs17.step_17_retention) OVER (
            PARTITION BY rs17.Report_date, rs17.App_Name, rs17.Country_Code
            ORDER BY rs17.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs17.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs17.step_17_retention) OVER (
            PARTITION BY rs17.Report_date, rs17.App_Name, rs17.Country_Code
            ORDER BY rs17.Billing_Cycle
          ) * (1 - rs17.Churn_rate)
        END
      ELSE NULL
    END AS step_18_retention
  FROM retention_step_17 rs17
),

retention_step_19 AS (
  SELECT 
    rs18.*,
    CASE 
      WHEN rs18.step_18_retention IS NOT NULL THEN rs18.step_18_retention
      WHEN rs18.Billing_Cycle = 19 THEN 
        CASE
          WHEN LAG(rs18.step_18_retention) OVER (
            PARTITION BY rs18.Report_date, rs18.App_Name, rs18.Country_Code
            ORDER BY rs18.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs18.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs18.step_18_retention) OVER (
            PARTITION BY rs18.Report_date, rs18.App_Name, rs18.Country_Code
            ORDER BY rs18.Billing_Cycle
          ) * (1 - rs18.Churn_rate)
        END
      ELSE NULL
    END AS step_19_retention
  FROM retention_step_18 rs18
),

retention_step_20 AS (
  SELECT 
    rs19.*,
    CASE 
      WHEN rs19.step_19_retention IS NOT NULL THEN rs19.step_19_retention
      WHEN rs19.Billing_Cycle = 20 THEN 
        CASE
          WHEN LAG(rs19.step_19_retention) OVER (
            PARTITION BY rs19.Report_date, rs19.App_Name, rs19.Country_Code
            ORDER BY rs19.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs19.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs19.step_19_retention) OVER (
            PARTITION BY rs19.Report_date, rs19.App_Name, rs19.Country_Code
            ORDER BY rs19.Billing_Cycle
          ) * (1 - rs19.Churn_rate)
        END
      ELSE NULL
    END AS step_20_retention
  FROM retention_step_19 rs19
),

retention_step_21 AS (
  SELECT 
    rs20.*,
    CASE 
      WHEN rs20.step_20_retention IS NOT NULL THEN rs20.step_20_retention
      WHEN rs20.Billing_Cycle = 21 THEN 
        CASE
          WHEN LAG(rs20.step_20_retention) OVER (
            PARTITION BY rs20.Report_date, rs20.App_Name, rs20.Country_Code
            ORDER BY rs20.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs20.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs20.step_20_retention) OVER (
            PARTITION BY rs20.Report_date, rs20.App_Name, rs20.Country_Code
            ORDER BY rs20.Billing_Cycle
          ) * (1 - rs20.Churn_rate)
        END
      ELSE NULL
    END AS step_21_retention
  FROM retention_step_20 rs20
),

retention_step_22 AS (
  SELECT 
    rs21.*,
    CASE 
      WHEN rs21.step_21_retention IS NOT NULL THEN rs21.step_21_retention
      WHEN rs21.Billing_Cycle = 22 THEN 
        CASE
          WHEN LAG(rs21.step_21_retention) OVER (
            PARTITION BY rs21.Report_date, rs21.App_Name, rs21.Country_Code
            ORDER BY rs21.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs21.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs21.step_21_retention) OVER (
            PARTITION BY rs21.Report_date, rs21.App_Name, rs21.Country_Code
            ORDER BY rs21.Billing_Cycle
          ) * (1 - rs21.Churn_rate)
        END
      ELSE NULL
    END AS step_22_retention
  FROM retention_step_21 rs21
),

retention_step_23 AS (
  SELECT 
    rs22.*,
    CASE 
      WHEN rs22.step_22_retention IS NOT NULL THEN rs22.step_22_retention
      WHEN rs22.Billing_Cycle = 23 THEN 
        CASE
          WHEN LAG(rs22.step_22_retention) OVER (
            PARTITION BY rs22.Report_date, rs22.App_Name, rs22.Country_Code
            ORDER BY rs22.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs22.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs22.step_22_retention) OVER (
            PARTITION BY rs22.Report_date, rs22.App_Name, rs22.Country_Code
            ORDER BY rs22.Billing_Cycle
          ) * (1 - rs22.Churn_rate)
        END
      ELSE NULL
    END AS step_23_retention
  FROM retention_step_22 rs22
),

retention_step_24 AS (
  SELECT 
    rs23.*,
    CASE 
      WHEN rs23.step_23_retention IS NOT NULL THEN rs23.step_23_retention
      WHEN rs23.Billing_Cycle = 24 THEN 
        CASE
          WHEN LAG(rs23.step_23_retention) OVER (
            PARTITION BY rs23.Report_date, rs23.App_Name, rs23.Country_Code
            ORDER BY rs23.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs23.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs23.step_23_retention) OVER (
            PARTITION BY rs23.Report_date, rs23.App_Name, rs23.Country_Code
            ORDER BY rs23.Billing_Cycle
          ) * (1 - rs23.Churn_rate)
        END
      ELSE NULL
    END AS step_24_retention
  FROM retention_step_23 rs23
),

retention_step_25 AS (
  SELECT 
    rs24.*,
    CASE 
      WHEN rs24.step_24_retention IS NOT NULL THEN rs24.step_24_retention
      WHEN rs24.Billing_Cycle = 25 THEN 
        CASE
          WHEN LAG(rs24.step_24_retention) OVER (
            PARTITION BY rs24.Report_date, rs24.App_Name, rs24.Country_Code
            ORDER BY rs24.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs24.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs24.step_24_retention) OVER (
            PARTITION BY rs24.Report_date, rs24.App_Name, rs24.Country_Code
            ORDER BY rs24.Billing_Cycle
          ) * (1 - rs24.Churn_rate)
        END
      ELSE NULL
    END AS step_25_retention
  FROM retention_step_24 rs24
),

retention_step_26 AS (
  SELECT 
    rs25.*,
    CASE 
      WHEN rs25.step_25_retention IS NOT NULL THEN rs25.step_25_retention
      WHEN rs25.Billing_Cycle = 26 THEN 
        CASE
          WHEN LAG(rs25.step_25_retention) OVER (
            PARTITION BY rs25.Report_date, rs25.App_Name, rs25.Country_Code
            ORDER BY rs25.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs25.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs25.step_25_retention) OVER (
            PARTITION BY rs25.Report_date, rs25.App_Name, rs25.Country_Code
            ORDER BY rs25.Billing_Cycle
          ) * (1 - rs25.Churn_rate)
        END
      ELSE NULL
    END AS step_26_retention
  FROM retention_step_25 rs25
),

retention_step_27 AS (
  SELECT 
    rs26.*,
    CASE 
      WHEN rs26.step_26_retention IS NOT NULL THEN rs26.step_26_retention
      WHEN rs26.Billing_Cycle = 27 THEN 
        CASE
          WHEN LAG(rs26.step_26_retention) OVER (
            PARTITION BY rs26.Report_date, rs26.App_Name, rs26.Country_Code
            ORDER BY rs26.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs26.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs26.step_26_retention) OVER (
            PARTITION BY rs26.Report_date, rs26.App_Name, rs26.Country_Code
            ORDER BY rs26.Billing_Cycle
          ) * (1 - rs26.Churn_rate)
        END
      ELSE NULL
    END AS step_27_retention
  FROM retention_step_26 rs26
),

retention_step_28 AS (
  SELECT 
    rs27.*,
    CASE 
      WHEN rs27.step_27_retention IS NOT NULL THEN rs27.step_27_retention
      WHEN rs27.Billing_Cycle = 28 THEN 
        CASE
          WHEN LAG(rs27.step_27_retention) OVER (
            PARTITION BY rs27.Report_date, rs27.App_Name, rs27.Country_Code
            ORDER BY rs27.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs27.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs27.step_27_retention) OVER (
            PARTITION BY rs27.Report_date, rs27.App_Name, rs27.Country_Code
            ORDER BY rs27.Billing_Cycle
          ) * (1 - rs27.Churn_rate)
        END
      ELSE NULL
    END AS step_28_retention
  FROM retention_step_27 rs27
),

retention_step_29 AS (
  SELECT 
    rs28.*,
    CASE 
      WHEN rs28.step_28_retention IS NOT NULL THEN rs28.step_28_retention
      WHEN rs28.Billing_Cycle = 29 THEN 
        CASE
          WHEN LAG(rs28.step_28_retention) OVER (
            PARTITION BY rs28.Report_date, rs28.App_Name, rs28.Country_Code
            ORDER BY rs28.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs28.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs28.step_28_retention) OVER (
            PARTITION BY rs28.Report_date, rs28.App_Name, rs28.Country_Code
            ORDER BY rs28.Billing_Cycle
          ) * (1 - rs28.Churn_rate)
        END
      ELSE NULL
    END AS step_29_retention
  FROM retention_step_28 rs28
),

retention_step_30 AS (
  SELECT 
    rs29.*,
    CASE 
      WHEN rs29.step_29_retention IS NOT NULL THEN rs29.step_29_retention
      WHEN rs29.Billing_Cycle = 30 THEN 
        CASE
          WHEN LAG(rs29.step_29_retention) OVER (
            PARTITION BY rs29.Report_date, rs29.App_Name, rs29.Country_Code
            ORDER BY rs29.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs29.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs29.step_29_retention) OVER (
            PARTITION BY rs29.Report_date, rs29.App_Name, rs29.Country_Code
            ORDER BY rs29.Billing_Cycle
          ) * (1 - rs29.Churn_rate)
        END
      ELSE NULL
    END AS step_30_retention
  FROM retention_step_29 rs29
),

retention_step_31 AS (
  SELECT 
    rs30.*,
    CASE 
      WHEN rs30.step_30_retention IS NOT NULL THEN rs30.step_30_retention
      WHEN rs30.Billing_Cycle = 31 THEN 
        CASE
          WHEN LAG(rs30.step_30_retention) OVER (
            PARTITION BY rs30.Report_date, rs30.App_Name, rs30.Country_Code
            ORDER BY rs30.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs30.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs30.step_30_retention) OVER (
            PARTITION BY rs30.Report_date, rs30.App_Name, rs30.Country_Code
            ORDER BY rs30.Billing_Cycle
          ) * (1 - rs30.Churn_rate)
        END
      ELSE NULL
    END AS step_31_retention
  FROM retention_step_30 rs30
),

retention_step_32 AS (
  SELECT 
    rs31.*,
    CASE 
      WHEN rs31.step_31_retention IS NOT NULL THEN rs31.step_31_retention
      WHEN rs31.Billing_Cycle = 32 THEN 
        CASE
          WHEN LAG(rs31.step_31_retention) OVER (
            PARTITION BY rs31.Report_date, rs31.App_Name, rs31.Country_Code
            ORDER BY rs31.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs31.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs31.step_31_retention) OVER (
            PARTITION BY rs31.Report_date, rs31.App_Name, rs31.Country_Code
            ORDER BY rs31.Billing_Cycle
          ) * (1 - rs31.Churn_rate)
        END
      ELSE NULL
    END AS step_32_retention
  FROM retention_step_31 rs31
),

retention_step_33 AS (
  SELECT 
    rs32.*,
    CASE 
      WHEN rs32.step_32_retention IS NOT NULL THEN rs32.step_32_retention
      WHEN rs32.Billing_Cycle = 33 THEN 
        CASE
          WHEN LAG(rs32.step_32_retention) OVER (
            PARTITION BY rs32.Report_date, rs32.App_Name, rs32.Country_Code
            ORDER BY rs32.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs32.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs32.step_32_retention) OVER (
            PARTITION BY rs32.Report_date, rs32.App_Name, rs32.Country_Code
            ORDER BY rs32.Billing_Cycle
          ) * (1 - rs32.Churn_rate)
        END
      ELSE NULL
    END AS step_33_retention
  FROM retention_step_32 rs32
),

retention_step_34 AS (
  SELECT 
    rs33.*,
    CASE 
      WHEN rs33.step_33_retention IS NOT NULL THEN rs33.step_33_retention
      WHEN rs33.Billing_Cycle = 34 THEN 
        CASE
          WHEN LAG(rs33.step_33_retention) OVER (
            PARTITION BY rs33.Report_date, rs33.App_Name, rs33.Country_Code
            ORDER BY rs33.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs33.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs33.step_33_retention) OVER (
            PARTITION BY rs33.Report_date, rs33.App_Name, rs33.Country_Code
            ORDER BY rs33.Billing_Cycle
          ) * (1 - rs33.Churn_rate)
        END
      ELSE NULL
    END AS step_34_retention
  FROM retention_step_33 rs33
),

retention_step_35 AS (
  SELECT 
    rs34.*,
    CASE 
      WHEN rs34.step_34_retention IS NOT NULL THEN rs34.step_34_retention
      WHEN rs34.Billing_Cycle = 35 THEN 
        CASE
          WHEN LAG(rs34.step_34_retention) OVER (
            PARTITION BY rs34.Report_date, rs34.App_Name, rs34.Country_Code
            ORDER BY rs34.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs34.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs34.step_34_retention) OVER (
            PARTITION BY rs34.Report_date, rs34.App_Name, rs34.Country_Code
            ORDER BY rs34.Billing_Cycle
          ) * (1 - rs34.Churn_rate)
        END
      ELSE NULL
    END AS step_35_retention
  FROM retention_step_34 rs34
),

retention_step_36 AS (
  SELECT 
    rs35.*,
    CASE 
      WHEN rs35.step_35_retention IS NOT NULL THEN rs35.step_35_retention
      WHEN rs35.Billing_Cycle = 36 THEN 
        CASE
          WHEN LAG(rs35.step_35_retention) OVER (
            PARTITION BY rs35.Report_date, rs35.App_Name, rs35.Country_Code
            ORDER BY rs35.Billing_Cycle
          ) IS NULL THEN NULL
          WHEN rs35.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          ELSE LAG(rs35.step_35_retention) OVER (
            PARTITION BY rs35.Report_date, rs35.App_Name, rs35.Country_Code
            ORDER BY rs35.Billing_Cycle
          ) * (1 - rs35.Churn_rate)
        END
      ELSE rs35.step_35_retention
    END AS Retention_rate
  FROM retention_step_35 rs35
),
active_apps AS (
  SELECT DISTINCT App_Name
  FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
),

final_calculations AS (
  SELECT 
    rs36.*,
    
    CASE 
      WHEN rs36.App_Name = 'VG' THEN 'Active'
      WHEN aa.App_Name IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END AS Active_Inactive,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE rs36.Churn_rate
    END AS final_Churn_rate,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE rs36.Refund_ratio
    END AS final_Refund_ratio,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE rs36.Retention_rate - rs36.Refund_ratio
    END AS NET_Retention_rate,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        CASE 
          WHEN rs36.Billing_Cycle = 0 
          THEN SAFE_DIVIDE(rs36.Recent_Spend, NULLIF(rs36.Recent_Users, 0))
          ELSE 0.0
        END,
        0.0
      )
    END AS Recent_CAC,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs36.Rebill_value, NULLIF(rs36.Rebill_users, 0)) * rs36.Retention_rate,
        0.0
      ) + COALESCE(
        SAFE_DIVIDE(rs36.Single_Sale_Value, NULLIF(rs36.Subscription_users, 0)),
        0.0
      )
    END AS ARPU_Discounted,
    
    CASE 
      WHEN rs36.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(
        SAFE_DIVIDE(rs36.Rebill_value, NULLIF(rs36.Rebill_users, 0)) * (rs36.Retention_rate - rs36.Refund_ratio),
        0.0
      ) + COALESCE(
        SAFE_DIVIDE(rs36.Single_Sale_Value, NULLIF(rs36.Subscription_users, 0)),
        0.0
      )
    END AS Net_ARPU_Discounted
    
  FROM retention_step_36 rs36
  LEFT JOIN active_apps aa
    ON rs36.App_Name = aa.App_Name
)

SELECT 
  fc.Report_date,
  fc.App_Name,
  fc.Country_Code,
  fc.Billing_Cycle,
  
  fc.Active_Inactive,
  
  fc.Subscription_users,
  fc.Subscription_value,
  fc.Rebill_users,
  fc.Rebill_value,
  fc.SS_Users,
  fc.Single_Sale_Value,
  
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
ORDER BY fc.Report_date DESC, fc.App_Name, fc.Country_Code, fc.Billing_Cycle;

end;
