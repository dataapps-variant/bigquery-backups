-- job_id: scheduled_query_6aa7a6fb-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-03T09:00:06.236000+00:00
-- started: 2026-08-03T09:00:06.531000+00:00
-- ended: 2026-08-03T09:00:12.115000+00:00

-- Spend Summary Table
-- Aggregates spend data by App_Name and Channel_Name
-- Starting from January 1, 2025 up to the day before the script runs
-- Scheduled to run every Monday at 8:30 UTC
-- Notes: 
--   1. CT-JP and CT-Non-JP are combined into a single 'CT' entity
--   2. For Facebook_Ads channel, EN spend is combined into CT

CREATE OR REPLACE TABLE `variant-finance-data-project.Ad_spend_data.Monthly_Spend_Summary` AS
SELECT 
    CASE 
        WHEN App_Name IN ('CT-JP', 'CT-Non-JP') THEN 'CT'
        WHEN Channel_name = 'Facebook_Ads' AND App_Name = 'EN' THEN 'CT'
        ELSE App_Name
    END AS App_Name,
    Channel_name AS Channel_Name,
    SUM(Amount) AS Total_Amount
FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
WHERE 
    Date >= '2025-01-01'
    AND Date <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)  -- Up to yesterday
GROUP BY 
    App_Name,
    Channel_Name
ORDER BY 
    App_Name,
    Channel_Name;
