-- job_id: scheduled_query_6a6c1d9d-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T10:15:06.769000+00:00
-- started: 2026-07-28T10:15:07.136000+00:00
-- ended: 2026-07-28T10:16:51.459000+00:00


-- =====================================================
-- ENTITY LEVEL MAIN TABLE - APP LEVEL AGGREGATION
-- MODIFIED VERSION
-- 
-- MODIFICATIONS APPLIED:
-- 1. Dataset migration: VPU → VPU_Merged (2 references)
-- 2. Column name updates:
--    - Product_Name_Final → Product_Name_Final_Merged (1 change)
--    - App_name → App_Name in Ad Spend table (2 changes)
-- 3. NEW: Rebill < 25 at BC1+ → Retention_rate = NULL → All metrics = NULL
--    BC0 always 1.0 (anchor point, no threshold check)
-- Total: 5 + NULL cascade changes
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.VPU_Merged.Entity_Level_Main_MP` AS

WITH
-- =====================================================
-- CONFIG
-- =====================================================
config AS (
  SELECT 
    7 AS recent_cac_days,
    25 AS minimum_rebill_users
),

-- =====================================================
-- STEP 1: AGGREGATE BASE TABLE DATA
-- MODIFICATION 1: Dataset migration
-- =====================================================
base_aggregated AS (
  SELECT 
    Report_date,
    Billing_Cycle,
    App_Name,
    
    SUM(Subscription_users) AS Subscription_users,
    SUM(Subscription_value) AS Subscription_value,
    SUM(Rebill_users) AS Rebill_users,
    SUM(Rebill_value) AS Rebill_value,
    SUM(Single_Sale_Value) AS Single_Sale_Value,
    SUM(Spend_amount) AS Spend_amount,
    SUM(Recent_Spend) AS Recent_Spend,
    SUM(Recent_Users) AS Recent_Users,
    
    -- For weighted average refund ratio
    SUM(Refund_ratio * Rebill_value) AS weighted_refund_numerator,
    SUM(Rebill_value) AS weighted_refund_denominator,
    AVG(Refund_ratio) AS Avg_Refund_ratio
    
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
  GROUP BY Report_date, Billing_Cycle, App_Name
),

-- =====================================================
-- STEP 2: FIND LAST SPEND DATE FOR EACH APP (BC=0 ONLY)
-- MODIFICATION 2: Column name update (App_name → App_Name)
-- =====================================================
last_spend_dates AS (
  SELECT 
    ba.Report_date,
    ba.App_Name,
    MAX(ads.Date) AS last_spend_date
  FROM base_aggregated ba
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ba.App_Name = ads.App_Name
    AND ads.Date <= ba.Report_date
    AND ads.allocated_spend > 0
  WHERE ba.Billing_Cycle = 0
  GROUP BY ba.Report_date, ba.App_Name
),

-- Calculate 7-day window from last spend date
spend_date_windows AS (
  SELECT 
    Report_date,
    App_Name,
    last_spend_date,
    CASE 
      WHEN last_spend_date IS NOT NULL 
      THEN DATE_SUB(last_spend_date, INTERVAL (SELECT recent_cac_days FROM config) - 1 DAY)
      ELSE NULL
    END AS window_start_date,
    last_spend_date AS window_end_date
  FROM last_spend_dates
),

-- =====================================================
-- STEP 3: RECENT_SPEND_MP - Direct from ad spend table
-- MODIFICATION 3: Column name update (App_name → App_Name)
-- =====================================================
recent_spend_mp AS (
  SELECT 
    sdw.Report_date,
    sdw.App_Name,
    COALESCE(SUM(ads.allocated_spend), 0) AS Recent_Spend_MP
  FROM spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON sdw.App_Name = ads.App_Name
    AND ads.Date BETWEEN sdw.window_start_date AND sdw.window_end_date
  WHERE sdw.window_start_date IS NOT NULL
  GROUP BY sdw.Report_date, sdw.App_Name
  
  UNION ALL
  
  -- Add rows with 0 spend where window is NULL
  SELECT 
    Report_date,
    App_Name,
    0 AS Recent_Spend_MP
  FROM spend_date_windows
  WHERE window_start_date IS NULL
),

-- =====================================================
-- STEP 4: RECENT_USERS_MP - Count distinct (User, Product) pairs
-- FIXED: CT-JP and CT-Non-JP logic now mutually exclusive
-- MODIFICATION 4: Column name update (Product_Name_Final → Product_Name_Final_Merged)
-- =====================================================
recent_users_mp AS (
  SELECT 
    sdw.Report_date,
    sdw.App_Name,
    COUNT(DISTINCT CONCAT(base.Updated_Cust_ID, '|', base.Product_Name_Final_Merged)) AS Recent_Users_MP
  FROM spend_date_windows sdw
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(sdw.App_Name, 2)  -- Match on first 2 chars
    AND base.Date_of_Sale BETWEEN sdw.window_start_date AND sdw.window_end_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'  -- Exclude SS products
    -- Billing Cycle filter based on Trial_Type
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    -- FIXED: Country logic - now mutually exclusive
    AND (
      -- CT-JP: Only JP country codes (exclude Non-JP entity name)
      (LEFT(sdw.App_Name, 2) = 'CT' AND sdw.App_Name NOT LIKE '%Non-JP%' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      -- CT-Non-JP: Only non-JP country codes (must have Non-JP in entity name)
      (LEFT(sdw.App_Name, 2) = 'CT' AND sdw.App_Name LIKE '%Non-JP%' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      -- Non-CT apps: All countries
      (LEFT(sdw.App_Name, 2) != 'CT')
    )
  WHERE sdw.window_start_date IS NOT NULL
  GROUP BY sdw.Report_date, sdw.App_Name
  
  UNION ALL
  
  -- Add rows with 0 users where window is NULL
  SELECT 
    Report_date,
    App_Name,
    0 AS Recent_Users_MP
  FROM spend_date_windows
  WHERE window_start_date IS NULL
),

-- =====================================================
-- STEP 5: JOIN RECENT METRICS BACK TO BASE (BC=0 ONLY)
-- =====================================================
with_recent_metrics AS (
  SELECT 
    ba.*,
    CASE 
      WHEN ba.Billing_Cycle = 0 THEN COALESCE(rsmp.Recent_Spend_MP, 0)
      ELSE 0
    END AS Recent_Spend_MP,
    CASE 
      WHEN ba.Billing_Cycle = 0 THEN COALESCE(rump.Recent_Users_MP, 0)
      ELSE 0
    END AS Recent_Users_MP
  FROM base_aggregated ba
  LEFT JOIN recent_spend_mp rsmp
    ON ba.Report_date = rsmp.Report_date
    AND ba.App_Name = rsmp.App_Name
    AND ba.Billing_Cycle = 0
  LEFT JOIN recent_users_mp rump
    ON ba.Report_date = rump.Report_date
    AND ba.App_Name = rump.App_Name
    AND ba.Billing_Cycle = 0
),

-- =====================================================
-- STEP 6: CALCULATE CHURN RATE
-- =====================================================
with_churn AS (
  SELECT 
    wrm.*,
    CASE 
      WHEN wrm.Billing_Cycle = 0 THEN 0.00
      ELSE 1 - COALESCE(SAFE_DIVIDE(wrm.Rebill_users, NULLIF(wrm.Subscription_users, 0)), 0)
    END AS Churn_rate,
    
    -- Weighted average refund ratio
    COALESCE(SAFE_DIVIDE(wrm.weighted_refund_numerator, NULLIF(wrm.weighted_refund_denominator, 0)), 0) AS Wt_Avg_Refund_ratio
    
  FROM with_recent_metrics wrm
),

-- =====================================================
-- STEP 7: RETENTION RATE CASCADING WITH NULL CASCADE
-- BC0 always 1.0 (anchor point)
-- BC1+ : Rebill_users < minimum_rebill_users → NULL (cascades forward)
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
          -- Check if BC0 was NULL (cascade)
          WHEN LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.Report_date, rs0.App_Name 
            ORDER BY rs0.Billing_Cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs0.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs0.step_0_retention) OVER (
            PARTITION BY rs0.Report_date, rs0.App_Name 
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
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.Report_date, rs1.App_Name 
            ORDER BY rs1.Billing_Cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs1.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs1.step_1_retention) OVER (
            PARTITION BY rs1.Report_date, rs1.App_Name 
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
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.Report_date, rs2.App_Name 
            ORDER BY rs2.Billing_Cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs2.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs2.step_2_retention) OVER (
            PARTITION BY rs2.Report_date, rs2.App_Name 
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
          -- Check if previous BC was NULL (cascade)
          WHEN LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.Report_date, rs3.App_Name 
            ORDER BY rs3.Billing_Cycle
          ) IS NULL THEN NULL
          -- Check if Rebill_users < minimum_rebill_users → set to NULL
          WHEN rs3.Rebill_users < (SELECT minimum_rebill_users FROM config) THEN NULL
          -- Otherwise calculate normally
          ELSE LAG(rs3.step_3_retention) OVER (
            PARTITION BY rs3.Report_date, rs3.App_Name 
            ORDER BY rs3.Billing_Cycle
          ) * (1 - rs3.Churn_rate)
        END
      ELSE rs3.step_3_retention
    END AS Retention_rate
  FROM retention_step_3 rs3
),

-- =====================================================
-- STEP 8: FINAL CALCULATIONS
-- ALL metrics become NULL when Retention_rate IS NULL
-- =====================================================
final_calculations AS (
  SELECT 
    rs4.Report_date,
    rs4.Billing_Cycle,
    rs4.App_Name,
    
    -- Base metrics (always populated)
    rs4.Subscription_users,
    rs4.Subscription_value,
    rs4.Rebill_users,
    rs4.Rebill_value,
    rs4.Single_Sale_Value,
    rs4.Spend_amount,
    rs4.Recent_Spend,
    rs4.Recent_Users,
    rs4.Recent_Spend_MP,
    rs4.Recent_Users_MP,
    
    -- Rates (NULL when Retention_rate IS NULL)
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE rs4.Churn_rate END AS Churn_rate,
    
    rs4.Retention_rate,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE rs4.Wt_Avg_Refund_ratio END AS Wt_Avg_Refund_ratio,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE rs4.Avg_Refund_ratio END AS Avg_Refund_ratio,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE rs4.Retention_rate - rs4.Wt_Avg_Refund_ratio END AS NET_Retention_rate,
    
    -- CAC metrics (NULL when Retention_rate IS NULL)
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(SAFE_DIVIDE(rs4.Spend_amount, NULLIF(rs4.Subscription_users, 0)), 0) END AS Cohort_CAC,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(SAFE_DIVIDE(rs4.Recent_Spend, NULLIF(rs4.Recent_Users, 0)), 0) END AS Recent_CAC,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(SAFE_DIVIDE(rs4.Recent_Spend_MP, NULLIF(rs4.Recent_Users_MP, 0)), 0) END AS Recent_CAC_MP,
    
    -- ARPU metrics (NULL when Retention_rate IS NULL)
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(SAFE_DIVIDE(rs4.Single_Sale_Value + rs4.Rebill_value, NULLIF(rs4.Rebill_users, 0)), 0) * rs4.Retention_rate END AS ARPU_Discounted,
    
    CASE WHEN rs4.Retention_rate IS NULL THEN NULL
      ELSE COALESCE(SAFE_DIVIDE(rs4.Single_Sale_Value + rs4.Rebill_value, NULLIF(rs4.Rebill_users, 0)), 0) * (rs4.Retention_rate - rs4.Wt_Avg_Refund_ratio) END AS Net_ARPU_Discounted
    
  FROM retention_step_4 rs4
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  fc.Report_date,
  fc.Billing_Cycle,
  fc.App_Name,
  fc.Subscription_users,
  fc.Subscription_value,
  fc.Rebill_users,
  fc.Rebill_value,
  fc.Single_Sale_Value,
  fc.Spend_amount,
  fc.Recent_Spend,
  fc.Recent_Users,
  fc.Recent_Spend_MP,
  fc.Recent_Users_MP,
  fc.Churn_rate,
  fc.Retention_rate,
  fc.Wt_Avg_Refund_ratio,
  fc.Avg_Refund_ratio,
  fc.NET_Retention_rate,
  fc.Cohort_CAC,
  fc.Recent_CAC,
  fc.Recent_CAC_MP,
  fc.ARPU_Discounted,
  fc.Net_ARPU_Discounted,
  CASE WHEN fc.Retention_rate IS NULL THEN NULL
    ELSE fc.Net_ARPU_Discounted - fc.Recent_CAC_MP END AS Net_LTV_Discounted

FROM final_calculations fc
ORDER BY fc.Report_date DESC, fc.App_Name, fc.Billing_Cycle;

-- =====================================================
-- SCRIPT COMPLETE - MODIFIED VERSION
-- Table: variant-finance-data-project.VPU_Merged.Entity_Level_Main_MP
-- 
-- MODIFICATIONS SUMMARY:
-- =====================================================
-- 
-- MODIFICATION 1: DATASET MIGRATION (2 changes)
-- 1. Output table: VPU → VPU_Merged
-- 2. Source table (15K_Main_Table_MP): VPU → VPU_Merged
--
-- MODIFICATION 2: COLUMN NAME UPDATES (3 changes)
-- 3. Sticky Data: Product_Name_Final → Product_Name_Final_Merged
-- 4. Ad Spend: App_name → App_Name
-- 5. Ad Spend: App_name → App_Name
--
-- MODIFICATION 3: NULL CASCADE
-- 6. Added minimum_rebill_users = 25 to config
-- 7. BC0 always 1.0 (anchor point, NO threshold check)
-- 8. BC1-BC4: Rebill_users < 25 → NULL, cascades forward
-- 9. All derived metrics NULL when Retention_rate IS NULL
-- 10. Net_LTV_Discounted NULL when Retention_rate IS NULL
--
-- OUTPUT COLUMNS: 24 (unchanged)
-- =====================================================
