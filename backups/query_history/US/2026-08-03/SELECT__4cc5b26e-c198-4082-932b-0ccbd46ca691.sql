-- job_id: 4cc5b26e-c198-4082-932b-0ccbd46ca691
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:07.616000+00:00
-- started: 2026-08-03T12:00:07.711000+00:00
-- ended: 2026-08-03T12:00:07.919000+00:00


WITH mtd_data AS (
  SELECT Report_Date, CASE WHEN Entity_Name = 'CT' THEN App_Name ELSE Entity_Name END AS Entity_Name, Net_Revenue, Daily_Spend, Daily_New_Users FROM `variant-finance-data-project.Sticky_Reports.Major_Metrics_Report` WHERE Report_Date BETWEEN date(date_trunc(current_date - 1, MONTH)) and current_date - 1
)

SELECT min(Report_Date) AS month_start_date, max(Report_Date) AS report_date, Entity_Name AS entity, sum(Net_Revenue) AS net_revenue, sum(Daily_Spend) AS spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS cpa
FROM mtd_data 
GROUP BY Entity_Name
UNION ALL
SELECT min(Report_Date) AS month_start_date, max(Report_Date) AS report_date, 'ALL' AS entity, sum(Net_Revenue) AS net_revenue, sum(Daily_Spend) AS spend, CASE WHEN sum(Daily_New_Users) > 0 THEN sum(Daily_Spend) / sum(Daily_New_Users) ELSE 0 END AS cpa
FROM mtd_data
ORDER BY entity
