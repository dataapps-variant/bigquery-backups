-- job_id: script_job_2d05c7a9e4e791905da9c42c54f2f5f5_0
-- user: dataapps@variant.net
-- statement_type: CREATE_PROCEDURE
-- created: 2026-08-02T14:30:03.353000+00:00
-- started: 2026-08-02T14:30:03.579000+00:00
-- ended: 2026-08-02T14:30:03.709000+00:00

CREATE OR REPLACE PROCEDURE `variant-finance-data-project.Icarus_Cohort.proc_IC_7K_SOT_Ratio`()
BEGIN


CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_7K_SOT_Ratio` AS

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
-- PLAN × AFID LIST (from IC_Plan_List)
-- Derive distinct Product_Name_Final × Country_Code × AFID combinations
-- Also carry App_Name (with country suffix) for VPU country logic
-- =====================================================
plan_afid_list AS (
  SELECT DISTINCT
    Product_Name_Final,
    CASE 
      WHEN Country_Code IS NOT NULL AND Country_Code != '' 
      THEN CONCAT(App_Name, '-', Country_Code)
      ELSE App_Name
    END AS App_Name,
    Country_Code,
    AFID
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
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
    pal.Product_Name_Final,
    pal.App_Name,
    pal.Country_Code,
    pal.AFID,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN plan_afid_list pal
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION
-- Top 7,000 users per Product_Name_Final × Country_Code × AFID × BC
-- Join via Product_Name_Final_Merged (plan-level direct match)
-- AFID matched via COALESCE(AFID_CHANNEL, 80)
-- VPU CT-JP / CT-Non-JP / non-CT country logic (same as App-level SOT)
-- =====================================================
subscription_cohort AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.App_Name,
    mc.Country_Code,
    mc.AFID,
    mc.billing_cycle,
    mc.cohort_size,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY mc.report_date, mc.Product_Name_Final, mc.Country_Code, mc.AFID, mc.billing_cycle
      ORDER BY base.Date_of_Sale DESC
    ) AS user_rank
  FROM master_combinations mc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Product_Name_Final_Merged = mc.Product_Name_Final
    AND COALESCE(base.AFID_CHANNEL, 80) = mc.AFID
    AND base.Billing_Cycle_Updated = mc.billing_cycle
    AND base.Date_of_Sale <= mc.report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    -- Country logic (VPU CT-pattern — same as App-level SOT)
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
    Product_Name_Final,
    App_Name,
    Country_Code,
    AFID,
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
    Product_Name_Final,
    Country_Code,
    AFID,
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
  GROUP BY report_date, Product_Name_Final, Country_Code, AFID, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT (9 COLUMNS)
-- =====================================================
SELECT 
  mc.report_date AS Report_date,
  mc.Product_Name_Final,
  mc.Country_Code,
  mc.AFID AS Channel,
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
  AND mc.Product_Name_Final = m.Product_Name_Final
  AND mc.Country_Code = m.Country_Code
  AND mc.AFID = m.AFID
  AND mc.billing_cycle = m.billing_cycle
ORDER BY mc.report_date DESC, mc.Product_Name_Final, mc.Country_Code, mc.AFID, mc.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - 7K SOT RATIO PLAN × AFID LEVEL
-- Table: variant-finance-data-project.Icarus_Cohort.IC_7K_SOT_Ratio
--
-- GRAIN: Report_date × Product_Name_Final × Country_Code × AFID × Billing_Cycle
--
-- METHODOLOGY:
-- Same as App-level SOT (7k cohort, count on-time vs total)
-- but at Product_Name_Final + Country_Code + AFID grain
--
-- KEY DESIGN DECISIONS:
-- Join: base.Product_Name_Final_Merged = mc.Product_Name_Final (direct match)
-- AFID: COALESCE(base.AFID_CHANNEL, 80) = mc.AFID
-- Country: VPU CT-JP / CT-Non-JP / non-CT logic (same as App-level SOT)
--   - Uses App_Name (from IC_Plan_List) for CT prefix detection
-- Cohort: 7,000 per Product_Name_Final + Country_Code + AFID + BC
-- Trial_Type: Blended (NT + non-NT together)
--
-- SOURCE TABLES:
-- 1. Icarus_Cohort.IC_Plan_List (Plan list + App_Name + Country_Code + AFID)
-- 2. Sticky_Data.Sticky_data_API_original_V_Merged_TBL (user data)
--
-- OUTPUT COLUMNS (9):
-- Report_date, Product_Name_Final, Country_Code, Channel, Billing_Cycle,
-- Cohort_Size, Subscription_users, SOT_Users, SOT_Ratio
-- =====================================================

end
