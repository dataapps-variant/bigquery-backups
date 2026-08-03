-- job_id: 0a186c2c-f55e-4eb1-ab2b-c89395da3f6b
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:09.010000+00:00
-- started: 2026-08-01T12:00:09.134000+00:00
-- ended: 2026-08-01T12:00:09.315000+00:00


WITH mtd_data AS (
  SELECT Report_Date, CASE WHEN Entity_Name = 'CT' THEN App_Name ELSE Entity_Name END AS Entity_Name, App_Name, Channel_Name, Daily_New_Users, Daily_Regular_Users, Daily_SS_Users, Daily_Spend FROM `variant-finance-data-project.Sticky_Reports.Marketing_Reports` WHERE Report_Date BETWEEN date(date_trunc(current_date - 1, MONTH)) and current_date - 1
)

SELECT min(Report_Date) AS month_start_date, max(Report_Date) AS report_date, Entity_Name, 'ALL' AS App_Name, 'ALL' AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM mtd_data
GROUP BY Entity_Name
UNION ALL
SELECT min(Report_Date) AS month_start_date, max(Report_Date) AS report_date, 'ALL' AS Entity_Name, 'ALL' AS App_Name, 'ALL' AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM mtd_data
UNION ALL
SELECT min(Report_Date) AS month_start_date, max(Report_Date) AS report_date, Entity_Name, coalesce(App_Name, 'null') AS App_Name, coalesce(Channel_Name, 'null') AS Channel_Name, sum(Daily_New_Users) AS Daily_New_Users, sum(Daily_Regular_Users) AS Daily_Regular_Users, sum(Daily_SS_Users) AS Daily_SS_Users, sum(Daily_Spend) AS Daily_Spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS CPA
FROM mtd_data
GROUP BY Entity_Name, App_Name, Channel_Name
ORDER BY Entity_Name, App_Name, Channel_Name
