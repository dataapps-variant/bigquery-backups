CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Revenue` AS

WITH revenue_events AS (
    -- Sales: positive revenue on Date_of_Sale
    SELECT 
        Entity_Name,
        Date_of_Sale AS report_date,
        Order_Price_Net_of_Tax_USD AS revenue,
        0 AS refund
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Date_of_Sale IS NOT NULL
    
    UNION ALL
    
    -- Refunds: negative impact on Refund_Date
    SELECT 
        Entity_Name,
        Refund_Date AS report_date,
        0 AS revenue,
        Refund_Amount_USD AS refund
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Refund_Date IS NOT NULL 
      AND Refund_Amount_USD > 0
)

SELECT 
    Entity_Name,
    report_date,
    SUM(revenue) AS gross_revenue,
    SUM(refund) AS total_refunds,
    SUM(revenue) - SUM(refund) AS net_revenue
FROM revenue_events
GROUP BY Entity_Name, report_date
ORDER BY report_date, Entity_Name
