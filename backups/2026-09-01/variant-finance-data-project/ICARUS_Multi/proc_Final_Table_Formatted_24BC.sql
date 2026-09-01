CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.proc_Final_Table_Formatted_24BC`()
BEGIN


-- =====================================================
-- ICARUS_Multi.Final_Table_Formatted_24BC - WITH CUSTOM FORMATTING
-- =====================================================
-- SOURCE: ICARUS_Multi.Final_Table_24BC
-- TARGET: ICARUS_Multi.Final_Table_Formatted_24BC (PIVOTED + FORMATTED)
--
-- FORMATTING RULES:
-- - Integers (no decimals): Single_Sale, Subscriptions, Rebills, T30D_New_Users
-- - Percentages: Churn_Rate, Gross_ARPU_Retention_Rate, Refund_Rate, Net_ARPU_Retention_Rate
-- - Currency ($XX.XX): Cohort_CAC, Recent_CAC, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling
--
-- CHANGED FOR 24BC: pivot now emits BC0 through BC24 (was BC0-BC12);
-- source pointed at Final_Table_24BC instead of Final_Table.
-- =====================================================

DROP TABLE IF EXISTS `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted_24BC`;

CREATE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted_24BC`
PARTITION BY Reporting_Date
CLUSTER BY Plan_Name, Metric_Name
AS

WITH 
-- =====================================================
-- LOAD SOURCE DATA
-- =====================================================
source_data AS (
  SELECT 
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    BC,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    Subscriptions,
    Rebills,
    Single_Sale,
    Churn_Rate,
    Refund_Rate,
    Gross_ARPU_Retention_Rate,
    Net_ARPU_Retention_Rate,
    Cohort_CAC,
    Recent_CAC,
    T30D_New_Users,
    Gross_ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    BC4_CAC_Ceiling,
    Cohort,
    Table as Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_24BC`
),

-- =====================================================
-- UNPIVOT METRICS TO ROWS (NO FORMATTING YET)
-- =====================================================
unpivoted_metrics AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    Cohort,
    Table_Type,
    BC,
    '02. Subscriptions' as Metric_Name,
    Subscriptions as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '03. Rebills' as Metric_Name,
    Rebills as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '01. Single Sale' as Metric_Name,
    CAST(Single_Sale AS FLOAT64) as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '04. Churn Rate' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Churn_Rate 
    END as Metric_Value,
    'percentage' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '06. Refund Rate' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Refund_Rate 
    END as Metric_Value,
    'percentage' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '05. Gross Retention Rate' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Gross_ARPU_Retention_Rate 
    END as Metric_Value,
    'percentage' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '07. Net Retention Rate' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Net_ARPU_Retention_Rate 
    END as Metric_Value,
    'percentage' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '08. Cohort CAC' as Metric_Name,
    Cohort_CAC as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '09. Recent CAC' as Metric_Name,
    Recent_CAC as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '14. T30D New Users' as Metric_Name,
    CAST(T30D_New_Users AS FLOAT64) as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '10. Gross ARPU' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Gross_ARPU_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '11. Net ARPU' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Net_ARPU_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '12. Net LTV' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Net_LTV_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, Cohort, Table_Type, BC,
    '13. BC4 CAC Ceiling' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE BC4_CAC_Ceiling 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
),

-- =====================================================
-- HELPER FUNCTION: FORMAT VALUES BASED ON TYPE
-- =====================================================
formatted_values AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    Cohort,
    Table_Type,
    BC,
    Metric_Name,
    
    -- Apply formatting based on Format_Type
    CASE 
      -- Integer format (no decimals)
      WHEN Format_Type = 'integer' THEN
        CASE 
          WHEN Metric_Value IS NULL THEN ''
          ELSE CAST(ROUND(Metric_Value, 0) AS STRING)
        END
      
      -- Percentage format (multiply by 100, add %)
      WHEN Format_Type = 'percentage' THEN
        CASE 
          WHEN Metric_Value IS NULL THEN ''
          ELSE CONCAT(CAST(ROUND(Metric_Value * 100, 2) AS STRING), '%')
        END
      
      -- Currency format ($XX.XX)
      WHEN Format_Type = 'currency' THEN
        CASE 
          WHEN Metric_Value IS NULL THEN ''
          ELSE CONCAT('$', FORMAT('%.2f', ROUND(Metric_Value, 2)))
        END
      
      ELSE CAST(Metric_Value AS STRING)
    END as Formatted_Value
    
  FROM unpivoted_metrics
)

-- =====================================================
-- PIVOT BC VALUES TO COLUMNS (WITH FORMATTING)
-- EXTENDED: BC0 through BC24 (was BC0-BC12)
-- =====================================================
SELECT
  Reporting_Date,
  Plan_Name,
  Active_Inactive,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  Cohort,
  Table_Type,
  Metric_Name,
  
  -- BC columns (formatted as strings)
  MAX(CASE WHEN BC = 0 THEN Formatted_Value END) as BC0,
  MAX(CASE WHEN BC = 1 THEN Formatted_Value END) as BC1,
  MAX(CASE WHEN BC = 2 THEN Formatted_Value END) as BC2,
  MAX(CASE WHEN BC = 3 THEN Formatted_Value END) as BC3,
  MAX(CASE WHEN BC = 4 THEN Formatted_Value END) as BC4,
  MAX(CASE WHEN BC = 5 THEN Formatted_Value END) as BC5,
  MAX(CASE WHEN BC = 6 THEN Formatted_Value END) as BC6,
  MAX(CASE WHEN BC = 7 THEN Formatted_Value END) as BC7,
  MAX(CASE WHEN BC = 8 THEN Formatted_Value END) as BC8,
  MAX(CASE WHEN BC = 9 THEN Formatted_Value END) as BC9,
  MAX(CASE WHEN BC = 10 THEN Formatted_Value END) as BC10,
  MAX(CASE WHEN BC = 11 THEN Formatted_Value END) as BC11,
  MAX(CASE WHEN BC = 12 THEN Formatted_Value END) as BC12,
  MAX(CASE WHEN BC = 13 THEN Formatted_Value END) as BC13,
  MAX(CASE WHEN BC = 14 THEN Formatted_Value END) as BC14,
  MAX(CASE WHEN BC = 15 THEN Formatted_Value END) as BC15,
  MAX(CASE WHEN BC = 16 THEN Formatted_Value END) as BC16,
  MAX(CASE WHEN BC = 17 THEN Formatted_Value END) as BC17,
  MAX(CASE WHEN BC = 18 THEN Formatted_Value END) as BC18,
  MAX(CASE WHEN BC = 19 THEN Formatted_Value END) as BC19,
  MAX(CASE WHEN BC = 20 THEN Formatted_Value END) as BC20,
  MAX(CASE WHEN BC = 21 THEN Formatted_Value END) as BC21,
  MAX(CASE WHEN BC = 22 THEN Formatted_Value END) as BC22,
  MAX(CASE WHEN BC = 23 THEN Formatted_Value END) as BC23,
  MAX(CASE WHEN BC = 24 THEN Formatted_Value END) as BC24

FROM formatted_values
GROUP BY 
  Reporting_Date,
  Plan_Name,
  Active_Inactive,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  Cohort,
  Table_Type,
  Metric_Name;

-- =====================================================
-- SCRIPT COMPLETE - WITH CUSTOM FORMATTING - EXTENDED TO BC24
-- =====================================================
-- OUTPUT TABLE: ICARUS_Multi.Final_Table_Formatted_24BC
-- 
-- FORMATTING APPLIED:
-- ✅ Integers (no decimals): Single_Sale, Subscriptions, Rebills, T30D_New_Users
--    Example: 3053 (not 3053.0000)
--
-- ✅ Percentages: Churn_Rate, Gross_ARPU_Retention_Rate, Refund_Rate, Net_ARPU_Retention_Rate
--    Example: 63.04% (not 0.6304)
--
-- ✅ Currency: Cohort_CAC, Recent_CAC, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling
--    Example: $23.65 (with 2 decimals)
--
-- NULL VALUES: Preserved as NULL (will show as blank in Superset)
--
-- ALL BC COLUMNS: Now STRING type to accommodate formatted values
-- BC RANGE: BC0 through BC24 (extended from BC0-BC12)
--
-- ✅ Added Active_Inactive column after Plan_Name
-- =====================================================

END;
