-- job_id: script_job_59693a145a9c57a5dc0d33fdfcd44720_1
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:15:06.024000+00:00
-- started: 2026-08-02T09:15:06.625000+00:00
-- ended: 2026-08-02T09:15:17.283000+00:00

CREATE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
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
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
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
  Cohort,
  Table_Type,
  Metric_Name
