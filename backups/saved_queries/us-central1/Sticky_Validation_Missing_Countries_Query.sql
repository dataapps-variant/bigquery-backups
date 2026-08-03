CREATE OR REPLACE TABLE Sticky_Data.Sticky_Validation_Missing_Countries AS

WITH Transaction_Countries AS (
  SELECT DISTINCT
    Tax_Country_Code
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Tax_Country_Code NOT IN ('US', 'OR')
    AND Tax_Country_Code IS NOT NULL
    AND Test = '0'
),

Dim_Tax_Countries AS (
  SELECT DISTINCT Country
  FROM `Sticky_Data.Sticky_Dim_Sales_Tax`
  WHERE Country IS NOT NULL
)

SELECT
  CURRENT_TIMESTAMP() AS validation_run_timestamp,
  'Sticky_Dim_Sales_Tax' AS missing_in_table,
  'Country' AS field_name_in_missing_table,
  'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
  'Tax_Country_Code' AS field_name_in_available_table,
  tc.Tax_Country_Code AS missing_value

FROM Transaction_Countries tc
LEFT JOIN Dim_Tax_Countries dtc
  ON tc.Tax_Country_Code = dtc.Country
WHERE dtc.Country IS NULL
ORDER BY tc.Tax_Country_Code
