-- =====================================================
-- 15K SOT RATIO TABLE CREATION SCRIPT - CHANNEL MODIFIED
-- Simple Cohort Analysis for SOT (Start on Time) Metrics
-- 
-- MODIFICATIONS APPLIED:
-- 1. Plan_List aggregation with Product + AFID + Country_Code grouping
-- 2. Channel dimension added (from Plan_List.AFID)
-- 3. Table reference changed to CWC.Plan_List
-- 4. Output table: CWC.CWC_15K_SOT_Ratio
-- 5. NULL AFID/AFID_CHANNEL excluded
-- 
-- PURPOSE:
-- Calculate Subscription_users, SOT_Users, and SOT_Ratio
-- for each combination of date/product/channel/country/billing_cycle
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.CWC.CWC_15K_SOT_Ratio` AS

WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    15000 AS cohort_size,
    4 AS max_billing_cycles
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
-- PLAN_LIST AGGREGATION (MODIFIED - NOW INCLUDES AFID)
-- Handles multiple rows per Product_Name_Final + AFID + Country_Code
-- =====================================================
plan_list_ranked AS (
  SELECT 
    Product_Name_Final,
    AFID,
    Country_Code,
    Entity_Name,
    App_Name,
    Trial_Type,
    Trial_Period,
    Currency,
    Trial_Price,
    Regular_Price,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, AFID, Country_Code 
      ORDER BY Trial_Price ASC
    ) AS rn
  FROM `variant-finance-data-project.CWC.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL  -- Exclude NULL AFID
    AND Country_Code IS NOT NULL
),

plan_list_first_record AS (
  SELECT 
    Product_Name_Final,
    AFID,
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
    AFID,
    Country_Code,
    AVG(Trial_Price) AS Trial_Price
  FROM `variant-finance-data-project.CWC.Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL  -- Exclude NULL AFID
    AND Country_Code IS NOT NULL
  GROUP BY Product_Name_Final, AFID, Country_Code
),

aggregated_plan_list AS (
  SELECT 
    fr.Product_Name_Final,
    fr.AFID,
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
    AND fr.AFID = tp.AFID
    AND fr.Country_Code = tp.Country_Code
),

-- =====================================================
-- PRODUCT + CHANNEL + COUNTRY LIST (UPDATED)
-- =====================================================
product_channel_list AS (
  SELECT DISTINCT 
    Product_Name_Final,
    AFID,
    Country_Code
  FROM aggregated_plan_list
  WHERE Product_Name_Final IS NOT NULL
    AND AFID IS NOT NULL
    AND Country_Code IS NOT NULL
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

-- =====================================================
-- MASTER COMBINATIONS TABLE (NOW INCLUDES CHANNEL)
-- =====================================================
master_combinations AS (
  SELECT 
    rd.report_date,
    pcl.Product_Name_Final,
    pcl.AFID,
    pcl.Country_Code,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN product_channel_list pcl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
),

-- =====================================================
-- PRODUCT ATTRIBUTES ENRICHMENT (UPDATED JOIN WITH CHANNEL)
-- =====================================================
enriched_master AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.AFID,
    mc.Country_Code,
    mc.billing_cycle,
    mc.cohort_size,
    apl.Entity_Name,
    apl.App_Name,
    apl.Trial_Type
  FROM master_combinations mc
  LEFT JOIN aggregated_plan_list apl
    ON mc.Product_Name_Final = apl.Product_Name_Final
    AND mc.AFID = apl.AFID
    AND mc.Country_Code = apl.Country_Code
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION (NOW INCLUDES CHANNEL)
-- Top Cohort_Size users by Date_of_Sale DESC per combination
-- =====================================================
subscription_cohort AS (
  SELECT 
    em.report_date,
    em.Product_Name_Final,
    em.AFID,
    em.Country_Code,
    em.billing_cycle,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY em.report_date, em.Product_Name_Final, em.AFID, em.Country_Code, em.billing_cycle 
      ORDER BY base.Date_of_Sale DESC
    ) as user_rank
  FROM enriched_master em
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON em.Product_Name_Final = base.Product_Name_Final_Merged
    AND em.AFID = base.AFID_CHANNEL  -- CHANNEL MATCH
    AND base.Billing_Cycle_Updated = em.billing_cycle
    AND base.Date_of_Sale <= em.report_date
    AND base.AFID_CHANNEL IS NOT NULL  -- Exclude NULL AFID_CHANNEL
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
    AFID,
    Country_Code,
    billing_cycle,
    Updated_Cust_ID,
    Delay_days_SOT
  FROM subscription_cohort
  WHERE user_rank <= (SELECT cohort_size FROM config)
),

-- =====================================================
-- METRICS CALCULATION (NOW INCLUDES CHANNEL)
-- =====================================================
metrics AS (
  SELECT 
    report_date,
    Product_Name_Final,
    AFID,
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
  GROUP BY report_date, Product_Name_Final, AFID, Country_Code, billing_cycle
)

-- =====================================================
-- FINAL OUTPUT (12 COLUMNS)
-- =====================================================
SELECT 
  -- Primary Dimensions (Column Order: Product → Channel → Country → Billing_Cycle)
  em.report_date as Report_date,
  em.Product_Name_Final,
  em.AFID as Channel,  -- RENAMED OUTPUT COLUMN
  em.Country_Code,
  em.billing_cycle as Billing_Cycle,
  
  -- Configuration
  em.cohort_size as Cohort_Size,
  
  -- Product Details
  em.Entity_Name,
  em.App_Name,
  em.Trial_Type,
  
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
  AND em.AFID = m.AFID
  AND em.Country_Code = m.Country_Code
  AND em.billing_cycle = m.billing_cycle
ORDER BY em.report_date DESC, em.Product_Name_Final, em.AFID, em.Country_Code, em.billing_cycle;

-- =====================================================
-- SCRIPT COMPLETE - CHANNEL MODIFICATIONS APPLIED
-- Table: variant-finance-data-project.CWC.CWC_15K_SOT_Ratio
-- 
-- MODIFICATION SUMMARY:
-- 1. Changed Plan_List reference to CWC.Plan_List
-- 2. Added AFID dimension to Plan_List aggregation (3-dimension: Product + AFID + Country)
-- 3. Added Channel to master combinations (5-dimension granularity)
-- 4. Updated all CTEs to include AFID/Channel dimension
-- 5. Added AFID_CHANNEL matching in transaction join
-- 6. Excluded NULL AFID and AFID_CHANNEL values
-- 7. Renamed output column AFID to "Channel"
-- 8. Column order: Product → Channel → Country → Billing_Cycle
-- 
-- OUTPUT COLUMNS (12 total):
-- 1. Report_date
-- 2. Product_Name_Final
-- 3. Channel (from AFID)
-- 4. Country_Code
-- 5. Billing_Cycle
-- 6. Cohort_Size
-- 7. Entity_Name
-- 8. App_Name
-- 9. Trial_Type
-- 10. Subscription_users
-- 11. SOT_Users
-- 12. SOT_Ratio
--
-- GRANULARITY: Report_date x Product_Name_Final x Channel x Country_Code x Billing_Cycle
-- COHORT SIZE: 15,000 users per unique combination
-- =====================================================
