-- =====================================================
-- 15K SOT RATIO TABLE CREATION SCRIPT
-- Simple Cohort Analysis for SOT (Start on Time) Metrics
-- 
-- PURPOSE:
-- Calculate Subscription_users, SOT_Users, and SOT_Ratio
-- for each combination of date/product/country/billing_cycle
-- 
-- KEY DIFFERENCES FROM 15K MAIN TABLE:
-- 1. No BC_start_date/BC_end_date calculation
-- 2. No limiting_days constraint
-- 3. No Denominator_BC - uses Billing_Cycle directly
-- 4. Simple "top Cohort_Size" selection only
-- 5. Focus on SOT metrics only
--
-- INCREMENTAL LOAD FEATURES:
-- 1. Deletes last N days before processing (configurable)
-- 2. Only processes new dates after last processed date
-- 3. Skips processing when no new data exists
-- 4. Logs status for monitoring
-- =====================================================

-- =====================================================
-- VARIABLE DECLARATIONS (ALL AT TOP)
-- =====================================================
DECLARE days_to_reprocess INT64 DEFAULT 2;
DECLARE last_date_before_deletion DATE;
DECLARE deletion_threshold_date DATE;
DECLARE rows_deleted INT64;
DECLARE last_processed_date DATE;
DECLARE report_start_date DATE;
DECLARE report_end_date DATE;
DECLARE days_to_process INT64;

-- =====================================================
-- STEP 1: DELETE LAST N DAYS FOR REPROCESSING
-- =====================================================
-- Get the last date before deletion
SET last_date_before_deletion = (
  SELECT MAX(Report_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
);

-- Calculate deletion threshold
SET deletion_threshold_date = DATE_SUB(IFNULL(last_date_before_deletion, DATE('2025-01-01')), INTERVAL days_to_reprocess DAY);

-- Delete last N days if table exists and has data
IF last_date_before_deletion IS NOT NULL THEN
  DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
  WHERE Report_date > deletion_threshold_date;
  
  SET rows_deleted = @@row_count;
  SELECT FORMAT('Deleted %d rows for dates after %t', rows_deleted, deletion_threshold_date) as deletion_status;
ELSE
  SELECT 'Table is empty or does not exist - no deletion needed (first run)' as deletion_status;
END IF;

-- =====================================================
-- STEP 2: CALCULATE INCREMENTAL DATE RANGE
-- =====================================================
-- Get last processed date after deletion
SET last_processed_date = (
  SELECT MAX(Report_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
);

-- Set default if table is empty (first run)
SET last_processed_date = IFNULL(last_processed_date, DATE('2025-01-01'));

-- Calculate date range for processing
SET report_start_date = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
SET report_end_date = DATE_ADD(last_processed_date, INTERVAL 1 DAY);

-- Calculate how many days will be processed
SET days_to_process = DATE_DIFF(report_start_date, report_end_date, DAY) + 1;

-- =====================================================
-- STEP 3: LOG PROCESSING STATUS
-- =====================================================
SELECT 
  last_processed_date as Last_Processed_Date,
  report_start_date as Target_Date,
  report_end_date as Processing_Start_Date,
  days_to_process as Days_To_Process,
  CASE 
    WHEN report_end_date <= report_start_date THEN 'WILL PROCESS'
    ELSE 'NO NEW DATA - SKIPPING'
  END as Status;

-- =====================================================
-- STEP 4: INSERT NEW DATA (ONLY IF NEW DATES EXIST)
-- =====================================================
IF report_end_date <= report_start_date THEN

INSERT INTO  `variant-finance-data-project.VPU.15K_SOT_Ratio`

WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    report_start_date AS report_start_date,
    report_end_date AS report_end_date,
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

product_list AS (
  SELECT DISTINCT 
    Product_Name_Final,
    Country_Code
  FROM `variant-finance-data-project.VPU.Plan_List`
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
    cfg.cohort_size
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
    mc.cohort_size,
    plan.Entity_Name,
    plan.App_Name,
    plan.Trial_Type
  FROM master_combinations mc
  LEFT JOIN `variant-finance-data-project.VPU.Plan_List` plan
    ON mc.Product_Name_Final = plan.Product_Name_Final
    AND mc.Country_Code = plan.Country_Code
),

-- =====================================================
-- SUBSCRIPTION COHORT SELECTION
-- Simple: Top Cohort_Size users by Date_of_Sale DESC
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
    ON em.Product_Name_Final = base.Product_Name_Final
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
-- SCRIPT COMPLETE
-- Table: variant-finance-data-project.VPU.15K_SOT_Ratio
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
-- 
-- KEY LOGIC:
-- - Billing_Cycle_Updated = Billing_Cycle (direct match)
-- - Date_of_Sale <= report_date (no date range)
-- - Top Cohort_Size users by Date_of_Sale DESC
-- - SOT_Users = users where Delay_days_SOT <= 0 or NULL
-- - SOT_Ratio = SOT_Users / Subscription_users
-- =====================================================
SELECT FORMAT('Successfully inserted data for %d days (%t to %t)', 
    days_to_process, 
    report_end_date, 
    report_start_date
  ) as completion_status;

ELSE
  SELECT 'No new data to process - script skipped INSERT' as completion_status;
END IF;
