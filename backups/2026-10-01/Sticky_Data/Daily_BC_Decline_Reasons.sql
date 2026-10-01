CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Daily_BC_Decline_Reasons` AS

SELECT
    date_of_sale,
    billing_cycle_updated,
    app_name AS Brand_Name,
    product_name_final_merged AS Plan_Name,
    Decline_Reason AS decline_reason_category,
    COUNT(*) AS Declined_Order_Count
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_Original_V_W_EC_Merged_TBL`
WHERE Final_Order_Status = 7

GROUP BY
    date_of_sale,
    billing_cycle_updated,
    Brand_Name,
    Plan_Name,
    decline_reason_category

ORDER BY
    date_of_sale DESC,
    billing_cycle_updated,
    Brand_Name,
    decline_reason_category;
