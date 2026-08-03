-- job_id: 0c5df2e8-adc7-4bef-a9e3-0b6fbb17894e
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:03.828000+00:00
-- started: 2026-07-31T12:00:03.940000+00:00
-- ended: 2026-07-31T12:00:04.185000+00:00


SELECT Report_Date, Entity_Name, sum(Net_Revenue) AS Net_Revenue, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM (SELECT Report_Date, CASE WHEN Entity_Name = 'CT' THEN App_Name ELSE Entity_Name END AS Entity_Name, App_Name, Net_Revenue, Daily_Spend, Daily_New_Users
FROM `variant-finance-data-project.Sticky_Reports.Major_Metrics_Report` 
WHERE Report_Date = current_date-1)
WHERE Report_Date = current_date-1
GROUP BY Report_Date, Entity_Name
UNION ALL
SELECT Report_Date, 'ALL' AS Entity_Name, sum(Net_Revenue) AS Net_Revenue, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM `variant-finance-data-project.Sticky_Reports.Major_Metrics_Report` 
WHERE Report_Date = current_date-1
GROUP BY Report_Date
ORDER BY Entity_Name
