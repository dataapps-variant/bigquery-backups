-- job_id: scheduled_query_6ab6da43-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T11:32:02.580000+00:00
-- started: 2026-08-03T11:32:02.974000+00:00
-- ended: 2026-08-03T11:32:04.390000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Verifications.Currency_Missing_PD1000AE` AS

SELECT 
    CURRENT_TIMESTAMP() AS validation_run_timestamp,
    'Sticky_Dim_Offer & Sticky_Dim_Product' AS missing_in_table,
    'Currency' AS field_name_in_missing_table,
    'Sticky_data_API_original_V_Merged_TBL' AS available_in_table,
    'Currency' AS field_name_in_available_table,
    CONCAT(b.Product_Name_Final_Merged, ' | ', b.Currency) AS missing_value
FROM (
    SELECT DISTINCT CAST(Product_Name_Final_Merged AS STRING) AS Product_Name_Final_Merged, 
                    CAST(Currency AS STRING) AS Currency
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Currency IS NOT NULL
      AND Product_Name_Final_Merged LIKE 'PD%'
      AND Currency != 'USD'
) b
LEFT JOIN (
    SELECT DISTINCT CAST(Currency AS STRING) AS Currency
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Offer`
) o ON b.Currency = o.Currency
LEFT JOIN (
    SELECT DISTINCT CAST(Currency AS STRING) AS Currency
    FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Product`
) p ON b.Currency = p.Currency
WHERE o.Currency IS NULL OR p.Currency IS NULL
ORDER BY b.Product_Name_Final_Merged, b.Currency;
