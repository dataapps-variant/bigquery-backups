-- job_id: 0425c4d0-8718-48ec-99b6-42eeeed6a02b
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:07.536000+00:00
-- started: 2026-07-31T12:00:07.679000+00:00
-- ended: 2026-07-31T12:00:08.127000+00:00

SELECT ud.report_date, ud.app_short_name, plans.plan, ud.users, sd.spend, CASE WHEN users = 0 THEN NULL ELSE sd.spend/ud.users END AS cac,
avg(ud.users) OVER(PARTITION BY ud.app_short_name ORDER BY ud.report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS t7d_users,
avg(sd.spend) OVER(PARTITION BY ud.app_short_name ORDER BY ud.report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS t7d_spend
FROM (SELECT report_date, app_short_name, count(1) AS users FROM(SELECT Date_of_Sale AS report_date, CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE Date_of_Sale BETWEEN current_date-120 AND current_date-1 AND App_Name NOT IN ('CN', 'AT', 'IQ') AND Final_Order_Status <> 7 AND Billing_Cycle = '0') AS d
GROUP BY report_date, app_short_name
ORDER BY report_date DESC) AS ud
LEFT JOIN (SELECT Report_Date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app_short_name, sum(Daily_Spend) AS spend FROM `variant-finance-data-project.Sticky_Reports.Marketing_Reports`
WHERE Report_Date BETWEEN current_date-120 AND current_date-1 AND App_Name NOT IN ('CN', 'AT', 'IQ')
GROUP BY Report_Date, App_Name
ORDER BY Report_Date DESC) AS sd ON ud.report_date = sd.report_date AND ud.app_short_name = sd.app_short_name
LEFT JOIN (
SELECT App_Name AS app, string_agg(Plan_Name, '/') AS plan FROM(
SELECT App_Name, Plan_Name, sum(Daily_Users) AS users FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
WHERE Date_of_Sale >= current_date-30
GROUP BY App_Name, Plan_Name) AS d
WHERE Plan_Name NOT LIKE '%SS' AND users > 50
GROUP BY App_Name
) AS plans ON LEFT(ud.app_short_name, 2) = LEFT(plans.app, 2)
WHERE sd.spend > 5
ORDER BY ud.report_date DESC
