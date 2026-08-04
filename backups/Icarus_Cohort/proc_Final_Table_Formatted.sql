CREATE PROCEDURE `variant-finance-data-project`.Icarus_Cohort.proc_Final_Table_Formatted()
BEGIN


-- =====================================================
-- Icarus_Cohort.Final_Table_Formatted - CREATE OR REPLACE TABLE
-- =====================================================
-- SOURCE: Icarus_Cohort.Final_Table
-- TARGET: Icarus_Cohort.Final_Table_Formatted (PIVOTED + FORMATTED)
--
-- FORMATTING RULES:
-- - Integers (no decimals): Single_Sale, Subscriptions, Rebills, T30D_New_Users
-- - Percentages: Churn_Rate, Gross_ARPU_Retention_Rate, Refund_Rate, Net_ARPU_Retention_Rate
-- - Currency ($XX.XX): Recent_CAC, Gross_ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, BC4_CAC_Ceiling
--
-- NOTE: No Cohort_CAC in Icarus_Cohort (unlike ICARUS_Multi)
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.Final_Table_Formatted`
PARTITION BY Reporting_Date
CLUSTER BY Product_AFID, Plan_Name
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
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    AFID,
    Product_AFID,
    BC,
    Subscriptions,
    Rebills,
    Single_Sale,
    Churn_Rate,
    Refund_Rate,
    Gross_ARPU_Retention_Rate,
    Net_ARPU_Retention_Rate,
    Recent_CAC,
    T30D_New_Users,
    Gross_ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    BC4_CAC_Ceiling,
    Cohort,
    Table as Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.Final_Table`
),

-- =====================================================
-- UNPIVOT METRICS TO ROWS (NO FORMATTING YET)
-- 13 Metrics (No Cohort_CAC)
-- =====================================================
unpivoted_metrics AS (
  -- 01. Single Sale
  SELECT
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    AFID,
    Product_AFID,
    Cohort,
    Table_Type,
    BC,
    '01. Single Sale' as Metric_Name,
    CAST(Single_Sale AS FLOAT64) as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 02. Subscriptions
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '02. Subscriptions' as Metric_Name,
    Subscriptions as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 03. Rebills
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '03. Rebills' as Metric_Name,
    Rebills as Metric_Value,
    'integer' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 04. Churn Rate
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
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
  
  -- 05. Gross Retention Rate
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
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
  
  -- 06. Refund Rate
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
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
  
  -- 07. Net Retention Rate
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
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
  
  -- 08. Recent CAC (No Cohort_CAC in Icarus_Cohort)
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '08. Recent CAC' as Metric_Name,
    Recent_CAC as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 09. Gross ARPU
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '09. Gross ARPU' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Gross_ARPU_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 10. Net ARPU
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '10. Net ARPU' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Net_ARPU_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 11. Net LTV
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '11. Net LTV' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE Net_LTV_Discounted 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 12. BC4 CAC Ceiling
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '12. BC4 CAC Ceiling' as Metric_Name,
    CASE 
      WHEN (Subscriptions IS NULL OR Subscriptions = 0) 
       AND (Rebills IS NULL OR Rebills = 0)
      THEN NULL 
      ELSE BC4_CAC_Ceiling 
    END as Metric_Value,
    'currency' as Format_Type
  FROM source_data
  
  UNION ALL
  
  -- 13. T30D New Users
  SELECT
    Reporting_Date, Plan_Name, Active_Inactive, Entity_Name, App_Name, Trial_Type, Country, AFID, Product_AFID, Cohort, Table_Type, BC,
    '13. T30D New Users' as Metric_Name,
    CAST(T30D_New_Users AS FLOAT64) as Metric_Value,
    'integer' as Format_Type
  FROM source_data
),

-- =====================================================
-- APPLY FORMATTING BASED ON FORMAT_TYPE
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
    AFID,
    Product_AFID,
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
-- =====================================================
SELECT
  Reporting_Date,
  Plan_Name,
  Active_Inactive,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  AFID,
  Product_AFID,
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
  MAX(CASE WHEN BC = 12 THEN Formatted_Value END) as BC12

FROM formatted_values
GROUP BY 
  Reporting_Date,
  Plan_Name,
  Active_Inactive,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  AFID,
  Product_AFID,
  Cohort,
  Table_Type,
  Metric_Name;

-- =====================================================
-- SCRIPT COMPLETE - Icarus_Cohort.Final_Table_Formatted
-- =====================================================
-- OUTPUT TABLE: Icarus_Cohort.Final_Table_Formatted
-- 
-- TABLE SETTINGS:
-- ✅ Partitioned by: Reporting_Date
-- ✅ Clustered by: Product_AFID, Plan_Name
--
-- DIMENSIONS (12 columns):
-- 1.  Reporting_Date
-- 2.  Plan_Name
-- 3.  Active_Inactive
-- 4.  Entity_Name
-- 5.  App_Name
-- 6.  Trial_Type
-- 7.  Country
-- 8.  AFID
-- 9.  Product_AFID
-- 10. Cohort
-- 11. Table_Type
-- 12. Metric_Name
--
-- METRICS (13 metrics - No Cohort_CAC):
-- 01. Single Sale (Integer)
-- 02. Subscriptions (Integer)
-- 03. Rebills (Integer)
-- 04. Churn Rate (Percentage)
-- 05. Gross Retention Rate (Percentage)
-- 06. Refund Rate (Percentage)
-- 07. Net Retention Rate (Percentage)
-- 08. Recent CAC (Currency)
-- 09. Gross ARPU (Currency)
-- 10. Net ARPU (Currency)
-- 11. Net LTV (Currency)
-- 12. BC4 CAC Ceiling (Currency)
-- 13. T30D New Users (Integer)
--
-- PIVOTED COLUMNS (13 columns):
-- BC0, BC1, BC2, BC3, BC4, BC5, BC6, BC7, BC8, BC9, BC10, BC11, BC12
-- =====================================================

end;
