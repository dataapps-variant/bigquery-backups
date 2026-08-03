-- job_id: scheduled_query_6aa34983-0000-2343-a295-24058876f4a8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T08:30:01.436000+00:00
-- started: 2026-08-03T08:30:01.667000+00:00
-- ended: 2026-08-03T08:30:40.491000+00:00


-- =====================================================
-- 15K SOT RATIO TABLE CREATION SCRIPT - MODIFIED
-- Simple Cohort Analysis for SOT (Start on Time) Metrics
-- 
-- MODIFICATIONS APPLIED:
-- 1. Plan_List aggregation with Country_Code grouping
-- 2. Column name updates for transaction tables
-- 
-- PURPOSE:
-- Calculate Subscription_users, SOT_Users, and SOT_Ratio
-- for each combination of date/product/country/billing_cycle
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.7k_SOT_Ratio` AS

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
-- PLAN_LIST AGGREGATION (MODIFICATION 1)
-- Handles multiple rows per Product_Name_Final + Country_Code
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
      PARTITION BY Product_Name_Final, Country_Code 
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
    AND fr.Country_Code = tp.Country_Code
),

-- =====================================================
-- PRODUCT LIST (UPDATED TO INCLUDE COUNTRY_CODE)
-- =====================================================
product_list AS (
  SELECT
    apl.Product_Name_Final,
    apl.Country_Code,
    pl.First_Date_of_Sale                                       -- EDIT: pulled in from Plan_List to filter pre-launch dates
  FROM aggregated_plan_list apl
  INNER JOIN (                                                  -- EDIT: new subquery to fetch First_Date_of_Sale per plan + country
    SELECT 
      Product_Name_Final,
      Country_Code,
      MIN(First_Date_of_Sale) AS First_Date_of_Sale             -- EDIT: MIN in case Plan_List has duplicate rows per plan/country
    FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
    GROUP BY Product_Name_Final, Country_Code
  ) pl
    ON apl.Product_Name_Final = pl.Product_Name_Final           -- EDIT: join on Product_Name_Final
    AND apl.Country_Code = pl.Country_Code                      -- EDIT: join on Country_Code (preserves JP / Non-JP split)
  WHERE apl.Product_Name_Final IS NOT NULL
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
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN product_list pl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
  WHERE rd.report_date >= pl.First_Date_of_Sale                 -- EDIT: drops report dates before the plan's first sale (the actual fix for MIN(Report_date))
),
-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT (UPDATED JOIN)
-- =====================================================
enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.Country_Code = apl.Country_Code
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION
-- Simple: Top Cohort_Size users by Date_of_Sale DESC
-- MODIFICATION 2: Updated column name from Product_Name_Final to Product_Name_Final_Merged
-- =====================================================
subscription_cohort AS (
  SELECT 
    em.report_date,
    em.Product_Name_Final,
    em.Country_Code,
    em.billing_cycle,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY em.report_date, em.Product_Name_Final, em.Country_Code, em.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) as user_rank
  FROM enriched_master em
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON em.Product_Name_Final = base.Product_Name_Final_Merged  -- CHANGED: Was Product_Name_Final
    AND base.Billing_Cycle_Updated = em.billing_cycle  -- Direct match to billing_cycle
    AND base.Date_of_Sale <= em.report_date  -- Only filter: date must be <= report_date
    AND (
      -- Country_Code filtering logic
      (em.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR (em.Country_Code = 'Non-JP' AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR (em.Country_Code IS NULL OR em.Country_Code = '')
    )
),

-- =====================================================
-- TOP COHORT (LIMITED TO COHORT_SIZE)
-- =====================================================
top_cohort AS (
  SELECT 
    report_date,
    Product_Name_Final,
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
    Product_Name_Final,
    Country_Code,
    billing_cycle,
    
    -- Subscription_users: Count all users in cohort
    COUNT(Updated_Cust_ID) as subscription_users,
    
    -- SOT_Users: Count users where Delay_days_SOT <= 0 or NULL
    COUNT(
      CASE 
        WHEN Delay_days_SOT <= 0 OR Delay_days_SOT IS NULL 
        THEN 1 
      END
    ) as sot_users
    
  FROM top_cohort
  GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT
-- =====================================================
SELECT 
  -- Primary Dimensions
  em.report_date as Report_date,
  em.Product_Name_Final,
  em.billing_cycle as Billing_Cycle,
  
  -- Configuration
  em.cohort_size as Cohort_Size,
  
  -- Product Details
  em.Entity_Name,
  em.App_Name,
  em.Trial_Type,
  em.Country_Code,
  
  -- Metrics
  COALESCE(m.subscription_users, 0) as Subscription_users,
  COALESCE(m.sot_users, 0) as SOT_Users,
  
  -- SOT_Ratio: SOT_Users / Subscription_users (0 if denominator is 0 or NULL)
  COALESCE(
    SAFE_DIVIDE(
      COALESCE(m.sot_users, 0), 
      NULLIF(COALESCE(m.subscription_users, 0), 0)
    ),
    0
  ) as SOT_Ratio
  
FROM enriched_master em
LEFT JOIN metrics m
  ON em.report_date = m.report_date
  AND em.Product_Name_Final = m.Product_Name_Final
  AND em.Country_Code = m.Country_Code
  AND em.billing_cycle = m.billing_cycle
ORDER BY em.report_date DESC, em.Product_Name_Final, em.Country_Code, em.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - MODIFICATIONS APPLIED
-- Table: variant-finance-data-project.ICARUS_Multi.7k_SOT_Ratio
-- 
-- MODIFICATION SUMMARY:
-- 1. Added Plan_List aggregation CTEs (5 new CTEs)
-- 2. Updated product_list to use aggregated_plan_list
-- 3. Updated enriched_master join to match on Product_Name_Final + Country_Code
-- 4. Changed Sticky Data join from Product_Name_Final to Product_Name_Final_Merged
-- 5. Maintained Country_Code dimension throughout
-- 
-- OUTPUT COLUMNS (11 total):
-- 1. Report_date
-- 2. Product_Name_Final
-- 3. Billing_Cycle
-- 4. Cohort_Size
-- 5. Entity_Name
-- 6. App_Name
-- 7. Trial_Type
-- 8. Country_Code
-- 9. Subscription_users
-- 10. SOT_Users
-- 11. SOT_Ratio
-- =====================================================
