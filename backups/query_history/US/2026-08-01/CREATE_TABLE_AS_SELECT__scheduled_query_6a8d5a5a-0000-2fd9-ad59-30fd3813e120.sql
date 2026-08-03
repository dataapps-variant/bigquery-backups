-- job_id: scheduled_query_6a8d5a5a-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T09:00:02.761000+00:00
-- started: 2026-08-01T09:00:03.089000+00:00
-- ended: 2026-08-01T09:00:53.665000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_7K_SOT_Ratio_App_AFID` AS

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
-- APP × AFID_SUFFIX LIST (from IC_Plan_List_AFID)
-- GRAIN: App_Name × Country_Code × AFID_Suffix
-- =====================================================
app_afid_list AS (
  SELECT DISTINCT
    CASE 
      WHEN Country_Code IS NOT NULL AND Country_Code != '' 
      THEN CONCAT(App_Name, '-', Country_Code)
      ELSE App_Name
    END AS App_Name,
    Country_Code,
    AFID_Suffix
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID`
  WHERE App_Name IS NOT NULL
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
    aal.App_Name,
    aal.Country_Code,
    aal.AFID_Suffix,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN app_afid_list aal
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION
-- Top 7,000 users per App_Name × Country_Code × AFID_Suffix × BC
-- Uses LEFT(App_Name, 2) prefix match (VPU pattern)
-- =====================================================
subscription_cohort AS (
  SELECT 
    mc.report_date,
    mc.App_Name,
    mc.Country_Code,
    mc.AFID_Suffix,
    mc.billing_cycle,
    mc.cohort_size,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY mc.report_date, mc.App_Name, mc.Country_Code, mc.AFID_Suffix, mc.billing_cycle
      ORDER BY base.Date_of_Sale DESC
    ) AS user_rank
  FROM master_combinations mc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(mc.App_Name, 2)
    AND (
      (mc.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR mc.AFID_Suffix = base.AFID
    )
    AND base.Billing_Cycle_Updated = mc.billing_cycle
    AND base.Date_of_Sale <= mc.report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
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
    AFID_Suffix,
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
    AFID_Suffix,
    billing_cycle,
    
    COUNT(Updated_Cust_ID) AS subscription_users,
    
    COUNT(
      CASE 
        WHEN Delay_days_SOT <= 0 OR Delay_days_SOT IS NULL 
        THEN 1 
      END
    ) AS sot_users
    
  FROM top_cohort
  GROUP BY report_date, App_Name, Country_Code, AFID_Suffix, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  mc.report_date AS Report_date,
  mc.App_Name,
  mc.Country_Code,
  mc.AFID_Suffix,
  mc.billing_cycle AS Billing_Cycle,
  mc.cohort_size AS Cohort_Size,
  
  COALESCE(m.subscription_users, 0) AS Subscription_users,
  COALESCE(m.sot_users, 0) AS SOT_Users,
  
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
  AND (
    (mc.Country_Code IS NULL AND m.Country_Code IS NULL)
    OR mc.Country_Code = m.Country_Code
  )
  AND (
    (mc.AFID_Suffix IS NULL AND m.AFID_Suffix IS NULL)
    OR mc.AFID_Suffix = m.AFID_Suffix
  )
  AND mc.billing_cycle = m.billing_cycle
ORDER BY mc.report_date DESC, mc.App_Name, mc.Country_Code, mc.AFID_Suffix, mc.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - IC_7K_SOT_Ratio_App_AFID
-- Table: variant-finance-data-project.Icarus_Cohort.IC_7K_SOT_Ratio_App_AFID
--
-- GRAIN: Report_date × App_Name × Country_Code × AFID_Suffix × Billing_Cycle
--
-- BUILT FROM BASE TABLES (not aggregated from product SOT)
-- Uses LEFT(App_Name, 2) prefix match for base table join
-- AFID_Suffix joined via NULL-safe logic
-- VPU CT country logic applied
--
-- SOURCE TABLES:
-- 1. IC_Plan_List_AFID (App × Country × AFID_Suffix combinations)
-- 2. Sticky_data_API_original_V_Merged_TBL (user data + Delay_days_SOT)
--
-- OUTPUT COLUMNS (9):
-- Report_date, App_Name, Country_Code, AFID_Suffix,
-- Billing_Cycle, Cohort_Size, Subscription_users, SOT_Users, SOT_Ratio
-- =====================================================
