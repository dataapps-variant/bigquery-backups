-- job_id: 4b4f0c37-02f9-4b4d-be31-aff56b1156c5
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:06.042000+00:00
-- started: 2026-08-03T12:00:06.291000+00:00
-- ended: 2026-08-03T12:00:06.679000+00:00


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
