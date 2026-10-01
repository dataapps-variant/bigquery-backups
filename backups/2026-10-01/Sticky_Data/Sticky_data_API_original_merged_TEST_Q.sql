CREATE VIEW `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_merged_TEST_Q`
AS SELECT 
    *,
    'AT' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`

UNION ALL

SELECT 
    *,
    'CN' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN`

UNION ALL

SELECT 
    *,
    'PD_V' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`

UNION ALL

SELECT 
    *,
    'CT' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`

UNION ALL

SELECT 
    *,
    'JF' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`

UNION ALL

SELECT 
    *,
    'FS' as source_table
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`;
