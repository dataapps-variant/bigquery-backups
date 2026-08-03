-- job_id: scheduled_query_6a6eb4c8-0000-2028-9f03-088bc876837d
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T10:09:04.480000+00:00
-- started: 2026-07-28T10:09:04.823000+00:00
-- ended: 2026-07-28T10:09:05.911000+00:00

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
      AND Date_of_Sale >= "2025-01-01"
    
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
      AND Refund_Date >= "2025-01-01"
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
