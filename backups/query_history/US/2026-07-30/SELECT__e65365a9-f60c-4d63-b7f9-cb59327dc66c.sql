-- job_id: e65365a9-f60c-4d63-b7f9-cb59327dc66c
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:13.568000+00:00
-- started: 2026-07-30T12:00:13.661000+00:00
-- ended: 2026-07-30T12:00:14.064000+00:00

SELECT ud.report_date, ud.app_short_name, ts.display_name AS traffic_source, plans.plan, ud.users, sd.spend, CASE WHEN users = 0 THEN NULL ELSE sd.spend/ud.users END AS cac
FROM (SELECT report_date, app_short_name, Channel_Code, count(1) AS users FROM(SELECT Date_of_Sale AS report_date, CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, AFID_CHANNEL AS Channel_Code FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE Date_of_Sale BETWEEN current_date-120 AND current_date-1 AND App_Name NOT IN ('CN', 'AT', 'IQ') AND Final_Order_Status <> 7 AND Billing_Cycle = '0' AND AFID_CHANNEL <> 99) AS d
GROUP BY report_date, app_short_name, Channel_Code
ORDER BY report_date DESC) AS ud
LEFT JOIN (SELECT Report_Date AS report_date, CASE WHEN App_Name = 'CT-JP' THEN 'CT - JP' WHEN App_Name = 'CT-Non-JP' THEN 'CT - US' ELSE App_Name END AS app_short_name, Channel_Code, sum(Daily_Spend) AS spend FROM `variant-finance-data-project.Sticky_Reports.Marketing_Reports`
WHERE Report_Date BETWEEN current_date-120 AND current_date-1 AND App_Name NOT IN ('CN', 'AT', 'IQ') AND Channel_Code <> '99'
GROUP BY Report_Date, App_Name, Channel_Code
ORDER BY Report_Date DESC) AS sd ON ud.report_date = sd.report_date AND ud.app_short_name = sd.app_short_name AND CAST(ud.Channel_Code AS STRING) = sd.Channel_Code
LEFT JOIN (
SELECT App_Name AS app, string_agg(Plan_Name, '/') AS plan FROM(
SELECT App_Name, Plan_Name, sum(Daily_Users) AS users FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day`
WHERE Date_of_Sale >= current_date-30
GROUP BY App_Name, Plan_Name) AS d
WHERE Plan_Name NOT LIKE '%SS' AND users > 50
GROUP BY App_Name
) AS plans ON LEFT(ud.app_short_name, 2) = LEFT(plans.app, 2)
LEFT JOIN (
  SELECT a.afid_channel, a.Channel_Name, min(a.Channel_Type) AS Channel_Type, CASE WHEN c.num_types = 1 THEN REPLACE(a.Channel_Name, '_', ' ') ELSE REPLACE(a.Channel_Name, '_', ' ') || ' (' || min(a.Channel_Type) || ')' END AS display_name
FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a
LEFT JOIN (SELECT Channel_Name, count(DISTINCT Channel_Type) AS num_types FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` GROUP BY Channel_Name) AS c ON a.Channel_Name = c.Channel_Name
WHERE a.afid_channel <> 99
GROUP BY a.afid_channel, a.Channel_Name, c.num_types
ORDER BY a.afid_channel ASC
) AS ts ON ud.Channel_Code = ts.afid_channel
WHERE sd.spend > 5
ORDER BY ud.report_date DESC
