-- job_id: scheduled_query_6ade33b1-0000-21ab-89ea-d4f547f40c40
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:00:04.098000+00:00
-- started: 2026-08-02T09:00:04.381000+00:00
-- ended: 2026-08-02T09:01:09.276000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7k_SOT_Ratio_App` AS

WITH
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    12 AS max_billing_cycles
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
-- APP LIST (from Plan_List)
-- Derive distinct App_Name x Country_Code combinations
-- Compute App_Name with country suffix to match
-- Crystal Ball output format
-- =====================================================
app_list AS (
  SELECT DISTINCT
    CASE 
      WHEN Country_Code IS NOT NULL AND Country_Code != '' 
      THEN CONCAT(App_Name, '-', Country_Code)
      ELSE App_Name
    END AS App_Name,
    Country_Code
  FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
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
    al.App_Name,
    al.Country_Code,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN app_list al
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION
-- Top 7,000 users per App_Name x Country_Code x BC
-- Join via LEFT(App_Name, 2) prefix match
-- VPU CT-JP / CT-Non-JP / non-CT country logic
-- =====================================================
subscription_cohort AS (
  SELECT 
    mc.report_date,
    mc.App_Name,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY mc.report_date, mc.App_Name, mc.Country_Code, mc.billing_cycle
      ORDER BY base.Date_of_Sale DESC
    ) AS user_rank
  FROM master_combinations mc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(mc.App_Name, 2)
    AND base.Billing_Cycle_Updated = mc.billing_cycle
    AND base.Date_of_Sale <= mc.report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    -- Country logic (VPU CT-pattern)
    AND (
      -- CT-JP: Only JP country codes
      (LEFT(mc.App_Name, 2) = 'CT' AND mc.App_Name NOT LIKE '%Non-JP%'
        AND mc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      -- CT-Non-JP: Only non-JP country codes
      (LEFT(mc.App_Name, 2) = 'CT' AND mc.App_Name LIKE '%Non-JP%'
        AND mc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      -- Non-CT apps with JP
      (LEFT(mc.App_Name, 2) != 'CT' AND mc.Country_Code = 'JP'
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      -- Non-CT apps with Non-JP
      (LEFT(mc.App_Name, 2) != 'CT' AND mc.Country_Code = 'Non-JP'
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      -- No country split
      (mc.Country_Code IS NULL OR mc.Country_Code = '')
    )
),

-- =====================================================
-- TOP COHORT (LIMITED TO COHORT_SIZE)
-- =====================================================
top_cohort AS (
  SELECT 
    report_date,
    App_Name,
    Country_Code,
    billing_cycle,
    Updated_Cust_ID,
    Delay_days_SOT
  FROM subscription_cohort
  WHERE user_rank <= (SELECT cohort_size FROM config)
),

-- =====================================================
-- METRICS CALCULATION
-- =====================================================
metrics AS (
  SELECT 
    report_date,
    App_Name,
    Country_Code,
    billing_cycle,
    
    -- Subscription_users: Count all users in cohort
    COUNT(Updated_Cust_ID) AS subscription_users,
    
    -- SOT_Users: Count users where Delay_days_SOT <= 0 or NULL (on-time)
    COUNT(
      CASE 
        WHEN Delay_days_SOT <= 0 OR Delay_days_SOT IS NULL 
        THEN 1 
      END
    ) AS sot_users
    
  FROM top_cohort
  GROUP BY report_date, App_Name, Country_Code, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT (8 COLUMNS)
-- =====================================================
SELECT 
  mc.report_date AS Report_date,
  mc.App_Name,
  mc.Country_Code,
  mc.billing_cycle AS Billing_Cycle,
  mc.cohort_size AS Cohort_Size,
  
  COALESCE(m.subscription_users, 0) AS Subscription_users,
  COALESCE(m.sot_users, 0) AS SOT_Users,
  
  -- SOT_Ratio: SOT_Users / Subscription_users
  COALESCE(
    SAFE_DIVIDE(
      COALESCE(m.sot_users, 0),
      NULLIF(COALESCE(m.subscription_users, 0), 0)
    ),
    0
  ) AS SOT_Ratio

FROM master_combinations mc
LEFT JOIN metrics m
  ON mc.report_date = m.report_date
  AND mc.App_Name = m.App_Name
  AND mc.Country_Code = m.Country_Code
  AND mc.billing_cycle = m.billing_cycle
ORDER BY mc.report_date DESC, mc.App_Name, mc.Country_Code, mc.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - 7K SOT RATIO APP LEVEL
-- Table: variant-finance-data-project.ICARUS_Multi.7k_SOT_Ratio_App
--
-- METHODOLOGY:
-- Same as plan-level SOT (7k cohort, count on-time vs total)
-- but at App_Name + Country_Code grain
--
-- KEY DESIGN DECISIONS:
-- Join: LEFT(base.App_Name, 2) prefix match (VPU pattern)
-- Country: VPU CT-JP / CT-Non-JP / non-CT logic
-- Cohort: 7,000 per App_Name + Country_Code + BC
-- Trial_Type: Blended (NT + non-NT together)
-- App_Name format: CONCAT(App_Name, '-', Country_Code) to match Crystal Ball
--
-- SOURCE TABLES:
-- 1. ICARUS_Multi.Plan_List (App list + Country_Code)
-- 2. Sticky_Data.Sticky_data_API_original_V_Merged_TBL (user data)
--
-- OUTPUT COLUMNS (8):
-- Report_date, App_Name, Country_Code, Billing_Cycle,
-- Cohort_Size, Subscription_users, SOT_Users, SOT_Ratio
-- =====================================================

-- Add these 2 lines at bottom
