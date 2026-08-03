-- job_id: scheduled_query_6a7c69ce-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T09:15:02.607000+00:00
-- started: 2026-07-30T09:15:02.985000+00:00
-- ended: 2026-07-30T09:15:13.763000+00:00

CREATE OR REPLACE TABLE `ICARUS_Multi.Final_Table_Historical` AS

WITH source_data AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    BC,
    Cohort,
    Table,
    -- Cast INTEGER columns to FLOAT64 for UNPIVOT compatibility
    CAST(Subscriptions AS FLOAT64) AS Subscriptions,
    Rebills,
    CAST(Single_Sale AS FLOAT64) AS Single_Sale,
    Churn_Rate,
    Refund_Rate,
    Gross_ARPU_Retention_Rate,
    Net_ARPU_Retention_Rate,
    Cohort_CAC,
    Recent_CAC,
    CAST(T30D_New_Users AS FLOAT64) AS T30D_New_Users,
    Gross_ARPU_Discounted,
    Net_ARPU_Discounted,
    Net_LTV_Discounted,
    BC4_CAC_Ceiling
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table`
),

unpivoted_data AS (
  SELECT
    Reporting_Date,
    Plan_Name,
    Active_Inactive,
    Entity_Name,
    App_Name,
    Trial_Type,
    Country,
    BC,
    Cohort,
    Table,
    Particulars,
    Metrics AS Metrics_Raw
  FROM source_data
  UNPIVOT (
    Metrics FOR Particulars IN (
      Single_Sale,
      Subscriptions,
      Rebills,
      Churn_Rate,
      Gross_ARPU_Retention_Rate,
      Refund_Rate,
      Net_ARPU_Retention_Rate,
      Cohort_CAC,
      Recent_CAC,
      Gross_ARPU_Discounted,
      Net_ARPU_Discounted,
      Net_LTV_Discounted,
      BC4_CAC_Ceiling,
      T30D_New_Users
    )
  )
)

SELECT
  Reporting_Date,
  Plan_Name,
  Active_Inactive,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  BC,
  Cohort,
  Table,
  
  -- Rename Particulars with numbering
  CASE Particulars
    WHEN 'Single_Sale' THEN '01. Single Sale'
    WHEN 'Subscriptions' THEN '02. Subscriptions'
    WHEN 'Rebills' THEN '03. Rebills'
    WHEN 'Churn_Rate' THEN '04. Churn Rate'
    WHEN 'Gross_ARPU_Retention_Rate' THEN '05. Gross Retention Rate'
    WHEN 'Refund_Rate' THEN '06. Refund Rate'
    WHEN 'Net_ARPU_Retention_Rate' THEN '07. Net Retention Rate'
    WHEN 'Cohort_CAC' THEN '08. Cohort CAC'
    WHEN 'Recent_CAC' THEN '09. Recent CAC'
    WHEN 'Gross_ARPU_Discounted' THEN '10. Gross ARPU'
    WHEN 'Net_ARPU_Discounted' THEN '11. Net ARPU'
    WHEN 'Net_LTV_Discounted' THEN '12. Net LTV'
    WHEN 'BC4_CAC_Ceiling' THEN '13. BC4 CAC Ceiling'
    WHEN 'T30D_New_Users' THEN '14. T30D New Users'
  END AS Particulars,
  
  -- Add new column: App Name | Particulars
  CONCAT(
    Plan_Name, 
    ' | ', 
    CASE Particulars
      WHEN 'Single_Sale' THEN '01. Single Sale'
      WHEN 'Subscriptions' THEN '02. Subscriptions'
      WHEN 'Rebills' THEN '03. Rebills'
      WHEN 'Churn_Rate' THEN '04. Churn Rate'
      WHEN 'Gross_ARPU_Retention_Rate' THEN '05. Gross Retention Rate'
      WHEN 'Refund_Rate' THEN '06. Refund Rate'
      WHEN 'Net_ARPU_Retention_Rate' THEN '07. Net Retention Rate'
      WHEN 'Cohort_CAC' THEN '08. Cohort CAC'
      WHEN 'Recent_CAC' THEN '09. Recent CAC'
      WHEN 'Gross_ARPU_Discounted' THEN '10. Gross ARPU'
      WHEN 'Net_ARPU_Discounted' THEN '11. Net ARPU'
      WHEN 'Net_LTV_Discounted' THEN '12. Net LTV'
      WHEN 'BC4_CAC_Ceiling' THEN '13. BC4 CAC Ceiling'
      WHEN 'T30D_New_Users' THEN '14. T30D New Users'
    END
  ) AS `App Name | Particulars`,
  
  -- Format Metrics based on type
  CASE Particulars
    -- Integers (no decimals)
    WHEN 'Subscriptions' THEN CAST(Metrics_Raw AS STRING)
    WHEN 'Rebills' THEN CAST(CAST(ROUND(Metrics_Raw) AS INT64) AS STRING)
    WHEN 'Single_Sale' THEN CAST(Metrics_Raw AS STRING)
    WHEN 'T30D_New_Users' THEN CAST(Metrics_Raw AS STRING)
    
    -- Percentages (multiply by 100, format with 2 decimals, add %)
    WHEN 'Churn_Rate' THEN CONCAT(FORMAT('%.2f', Metrics_Raw * 100), '%')
    WHEN 'Refund_Rate' THEN CONCAT(FORMAT('%.2f', Metrics_Raw * 100), '%')
    WHEN 'Gross_ARPU_Retention_Rate' THEN CONCAT(FORMAT('%.2f', Metrics_Raw * 100), '%')
    WHEN 'Net_ARPU_Retention_Rate' THEN CONCAT(FORMAT('%.2f', Metrics_Raw * 100), '%')
    
    -- Currency (2 decimals with $ sign, handle negatives)
    WHEN 'Cohort_CAC' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
    WHEN 'Recent_CAC' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
    WHEN 'Gross_ARPU_Discounted' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
    WHEN 'Net_ARPU_Discounted' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
    WHEN 'Net_LTV_Discounted' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
    WHEN 'BC4_CAC_Ceiling' THEN 
      IF(Metrics_Raw >= 0, 
         CONCAT('$', FORMAT('%.2f', Metrics_Raw)),
         CONCAT('-$', FORMAT('%.2f', ABS(Metrics_Raw))))
  END AS Metrics

FROM unpivoted_data
ORDER BY 
  Reporting_Date,
  Plan_Name,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country,
  BC,
  Cohort,
  Table,
  CASE Particulars
    WHEN 'Single_Sale' THEN 1
    WHEN 'Subscriptions' THEN 2
    WHEN 'Rebills' THEN 3
    WHEN 'Churn_Rate' THEN 4
    WHEN 'Gross_ARPU_Retention_Rate' THEN 5
    WHEN 'Refund_Rate' THEN 6
    WHEN 'Net_ARPU_Retention_Rate' THEN 7
    WHEN 'Cohort_CAC' THEN 8
    WHEN 'Recent_CAC' THEN 9
    WHEN 'Gross_ARPU_Discounted' THEN 10
    WHEN 'Net_ARPU_Discounted' THEN 11
    WHEN 'Net_LTV_Discounted' THEN 12
    WHEN 'BC4_CAC_Ceiling' THEN 13
    WHEN 'T30D_New_Users' THEN 14
  END;
