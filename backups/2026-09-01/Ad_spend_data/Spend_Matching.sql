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
        ELSE App_Name
    END AS App_Name,
    Channel_name AS Channel_Name,
    SUM(allocated_spend) AS Total_Amount
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
