CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL_PD` AS
SELECT *
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
where Entity_Name = "PD"
