-- job_id: scheduled_query_6a8a0598-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T09:00:15.364000+00:00
-- started: 2026-07-31T09:00:15.676000+00:00
-- ended: 2026-07-31T09:00:31.389000+00:00

-- =====================================================
-- FINAL TABLE CREATION SCRIPT - ICARUS_COHORT (AFID_SUFFIX LEVEL)
-- Merge of 7K Crystal Ball and Main Tables (_AFID versions)
-- 
-- GRAIN: Product_Name_Final × Country_Code × AFID_Suffix × Report_date × Cohort × Table_Type × BC
-- OUTPUT: 24 columns (AFID_Suffix replaces AFID, Product_AFID removed)
-- FIXED: Country_Code now included in partition key (JP/Non-JP split correct)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.Final_Table_AFID` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- =====================================================
unioned_data AS (
  -- Table 1: IC_7K_30D_Crystal_Ball_AFID
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID_Suffix,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K_30D' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
  
  UNION ALL
  
  -- Table 2: IC_7K_Crystal_Ball_AFID
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID_Suffix,
    Subscription_users,
    CB_User as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K' as Cohort,
    'Crystal Ball' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
  
  UNION ALL
  
  -- Table 3: IC_7K_30D_Main_Table_AFID
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID_Suffix,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    NULL as T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K_30D' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
  
  UNION ALL
  
  -- Table 4: IC_7K_Main_Table_AFID
  SELECT 
    Report_date,
    Product_Name_Final,
    Billing_Cycle,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country_Code,
    AFID_Suffix,
    Subscription_users,
    Rebill_users as Rebills_raw,
    SS_Users,
    Churn_rate,
    Refund_ratio,
    Retention_rate,
    NET_Retention_rate,
    Recent_CAC,
    NULL as T30D_New_Users,
    ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    '7K' as Cohort,
    'Regular' as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
),

-- =====================================================
-- STEP 2: CALCULATE CUMULATIVE METRICS
-- Partitioned by: Product_Name_Final, Country_Code, AFID_Suffix, Report_date, Cohort, Table_Type
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted,
    
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_ARPU_Discounted_Cumulative,
    
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.Product_Name_Final, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_LTV_Discounted_Cumulative
    
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST RECENT_CAC AND T30D_NEW_USERS
-- =====================================================
recent_cac_broadcast AS (
  SELECT 
    cm.*,
    
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.Recent_CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.Recent_CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as Recent_CAC_Broadcasted,
    
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.T30D_New_Users
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_Name_Final, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as T30D_New_Users_Broadcasted
    
  FROM cumulative_metrics cm
),

-- =====================================================
-- STEP 4: CALCULATE BC4_CAC_CEILING
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    rcb.*,
    
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY rcb.Product_Name_Final, rcb.Country_Code, rcb.AFID_Suffix, rcb.Report_date, rcb.Cohort, rcb.Table_Type) - 1.2 
      as BC4_CAC_Ceiling
    
  FROM recent_cac_broadcast rcb
),

-- =====================================================
-- STEP 5: IDENTIFY FIRST NULL BC
-- =====================================================
first_null_detection AS (
  SELECT 
    bcc.*,
    
    MIN(CASE 
      WHEN bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 0 THEN NULL
      
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle = 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 1)
      THEN 
        CASE 
          WHEN (bcc.Subscription_users IS NULL OR bcc.Subscription_users = 0) 
            OR (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle > 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle > 1)
      THEN 
        CASE 
          WHEN bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25
          THEN bcc.Billing_Cycle
          ELSE NULL
        END
      
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.Product_Name_Final, bcc.Country_Code, bcc.AFID_Suffix, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as First_Null_BC
    
  FROM bc4_ceiling_calc bcc
),

-- =====================================================
-- STEP 6: ADD ACTIVE/INACTIVE STATUS
-- =====================================================
with_active_status AS (
  SELECT 
    fnd.*,
    
    CASE 
      WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active'
      ELSE 'Inactive'
    END as active_inactive_status
    
  FROM first_null_detection fnd
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON fnd.App_Name = ap.App_Name 
    AND fnd.Product_Name_Final = ap.Product_Name_Final
)

-- =====================================================
-- FINAL OUTPUT: 24 COLUMNS
-- =====================================================
SELECT 
  -- Primary Dimensions
  Report_date as Reporting_Date,
  Product_Name_Final as Plan_Name,
  active_inactive_status as Active_Inactive,
  Billing_Cycle as BC,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country_Code as Country,
  AFID_Suffix,
  
  -- User Metrics
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Subscription_users
  END as Subscriptions,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Rebills_raw
  END as Rebills,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1) OR (Trial_Type != 'NT' AND Billing_Cycle = 0)
    THEN SS_Users
    ELSE NULL
  END as Single_Sale,
  
  -- Performance Ratios (with cascade)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate
  END as Churn_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio
  END as Refund_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Retention_rate
  END as Gross_ARPU_Retention_Rate,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NET_Retention_rate
  END as Net_ARPU_Retention_Rate,
  
  -- CAC Metrics (broadcasted)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE Recent_CAC_Broadcasted
  END as Recent_CAC,
  
  -- New Users (broadcasted)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted
  END as T30D_New_Users,
  
  -- Cumulative ARPU/LTV Metrics (with cascade)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Gross_ARPU_Discounted
  END as Gross_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_ARPU_Discounted_Cumulative
  END as Net_ARPU_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Net_LTV_Discounted_Cumulative
  END as Net_LTV_Discounted,
  
  -- BC4_CAC_Ceiling (excluded from cascade)
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Subscription_users IS NULL OR Subscription_users = 0) 
     AND (Rebills_raw IS NULL OR Rebills_raw = 0)
    THEN NULL
    ELSE BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  
  Cohort,
  Table_Type as Table

FROM with_active_status

ORDER BY 
  Reporting_Date DESC, 
  Product_Name_Final,
  Country_Code,
  AFID_Suffix,
  Cohort,
  Table,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - Final_Table_AFID
-- Table: variant-finance-data-project.Icarus_Cohort.Final_Table_AFID
--
-- GRAIN: Product_Name_Final × Country_Code × AFID_Suffix × Report_date × Cohort × Table_Type × BC
--
-- CHANGES FROM ORIGINAL:
-- 1. Source tables: All 4 now use _AFID versions
-- 2. AFID → AFID_Suffix throughout
-- 3. Product_AFID removed entirely (no concatenated key)
-- 4. All PARTITION BY now use raw columns: Product_Name_Final, Country_Code, AFID_Suffix
-- 5. Country_Code included in partition key (fixes JP/Non-JP bug)
-- 6. Plan_Name = Product_Name_Final only (no Country_Code suffix)
-- 7. Output: 24 columns (was 25)
--
-- SOURCE TABLES:
-- 1. IC_7K_30D_Crystal_Ball_AFID (CB_User → Rebills_raw)
-- 2. IC_7K_Crystal_Ball_AFID (CB_User → Rebills_raw)
-- 3. IC_7K_30D_Main_Table_AFID (Rebill_users → Rebills_raw)
-- 4. IC_7K_Main_Table_AFID (Rebill_users → Rebills_raw)
--
-- OUTPUT COLUMNS (24):
-- 1.  Reporting_Date
-- 2.  Plan_Name (Product_Name_Final only, no country suffix)
-- 3.  Active_Inactive
-- 4.  BC
-- 5.  Entity_Name
-- 6.  App_Name
-- 7.  Trial_Type
-- 8.  Country
-- 9.  AFID_Suffix
-- 10. Subscriptions
-- 11. Rebills
-- 12. Single_Sale
-- 13. Churn_Rate
-- 14. Refund_Rate
-- 15. Gross_ARPU_Retention_Rate
-- 16. Net_ARPU_Retention_Rate
-- 17. Recent_CAC (broadcasted)
-- 18. T30D_New_Users (broadcasted)
-- 19. Gross_ARPU_Discounted (cumulative)
-- 20. Net_ARPU_Discounted (cumulative)
-- 21. Net_LTV_Discounted (cumulative)
-- 22. BC4_CAC_Ceiling (excluded from cascade)
-- 23. Cohort
-- 24. Table
-- =====================================================
