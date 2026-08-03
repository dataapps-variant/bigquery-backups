-- job_id: script_job_dca310b1882ec22a011a6d01320654ce_3
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-29T08:30:11.968000+00:00
-- started: 2026-07-29T08:30:12.186000+00:00
-- ended: 2026-07-29T08:30:18.131000+00:00

INSERT INTO `variant-finance-data-project.VPU.15K_SOT_Ratio`

  -- =====================================================
  -- ▼▼▼ PASTE YOUR QUERY BELOW (from WITH to final SELECT) ▼▼▼
  -- =====================================================
  
WITH 
-- =====================================================
-- CONFIGURATION VARIABLES
-- =====================================================
config AS (
  SELECT 
    new_end_date AS report_start_date,
    new_start_date AS report_end_date,
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
ORDER BY em.report_date DESC, em.Product_Name_Final, em.Country_Code, em.billing_cycle
