-- job_id: 703a6e8f-12d0-49ba-8647-3dce03a15d45
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:06.472000+00:00
-- started: 2026-07-29T12:00:06.557000+00:00
-- ended: 2026-07-29T12:00:06.795000+00:00


WITH d_data AS (
  SELECT Report_Date, CASE WHEN Entity_Name = 'CT' THEN App_Name ELSE Entity_Name END AS Entity_Name, App_Name, Channel_Name, Daily_New_Users, Daily_Regular_Users, Daily_SS_Users, Daily_Spend FROM `variant-finance-data-project.Sticky_Reports.Marketing_Reports`
  WHERE Report_Date = current_date-1
)

SELECT Report_Date, Entity_Name, 'ALL' AS App_Name, 'ALL' AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM d_data
GROUP BY Report_Date, Entity_Name
UNION ALL
SELECT Report_Date, 'ALL' AS Entity_Name, 'ALL' AS App_Name, 'ALL' AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM d_data
GROUP BY Report_Date
UNION ALL
SELECT Report_Date, Entity_Name, App_Name AS App_Name, Channel_Name AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM d_data
GROUP BY Report_Date, Entity_Name, App_Name, Channel_Name
ORDER BY Entity_Name, App_Name, Channel_Name
