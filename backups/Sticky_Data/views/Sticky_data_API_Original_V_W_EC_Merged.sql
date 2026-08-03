CREATE VIEW `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged`
AS SELECT * 
FROM `Sticky_Data.Sticky_data_API_original_AT_W_EC`
UNION ALL
SELECT *  
FROM `Sticky_Data.Sticky_data_API_original_PD_V_W_EC`
UNION ALL
SELECT *  
FROM `Sticky_Data.Sticky_data_API_original_DT_V_W_EC`
UNION ALL
SELECT * 
FROM `Sticky_Data.Sticky_data_API_original_CN_W_EC`
UNION ALL
SELECT * 
FROM `Sticky_Data.Sticky_data_API_original_FS_W_EC`
UNION ALL
SELECT * 
FROM `Sticky_Data.Sticky_data_API_original_CT_W_EC`
UNION ALL
SELECT * EXCEPT(custom_fields)
FROM `Sticky_Data.Sticky_data_API_original_JF_W_EC`;
