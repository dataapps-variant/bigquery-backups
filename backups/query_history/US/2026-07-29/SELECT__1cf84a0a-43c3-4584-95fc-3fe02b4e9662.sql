-- job_id: 1cf84a0a-43c3-4584-95fc-3fe02b4e9662
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:40.139000+00:00
-- started: 2026-07-29T12:00:40.267000+00:00
-- ended: 2026-07-29T12:00:42.447000+00:00

WITH sub_data AS (
  SELECT * FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
)
--APP DATA
SELECT d.*, coalesce(rd.rank, 0) AS rank, coalesce(rd.alert_level, 0) AS alert_level FROM(
SELECT App_Name AS app_short_name, null AS feature_plan_name, null AS traffic_source, null AS afid, sum(Daily_Users) AS subs_count_t30d FROM sub_data
GROUP BY App_Name
UNION ALL
--CT APP DATA SPLIT
SELECT app_short_name, null AS feature_plan_name, null AS traffic_source,null AS afid, sum(subs_count_t30d) AS subs_count_t30d FROM (
SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN Spend_Country_Code_AFID = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, Spend_Country_Code_AFID AS country_code, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS' AND App_Name = 'CT'
GROUP BY App_Name, Spend_Country_Code_AFID)
GROUP BY app_short_name
UNION ALL
--PLAN DATA
SELECT App_Name AS app_short_name, Plan_Name AS feature_plan_name, null AS traffic_source, null AS afid, sum(Daily_Users) AS subs_count_t30d FROM sub_data
GROUP BY App_Name, Plan_Name
UNION ALL
--MERGED PLAN DATA
SELECT App_Name AS app_short_name, Product_Name_Final AS feature_plan_name, null AS traffic_source, null AS afid, T30D_New_Users AS subs_count_t30d FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` WHERE Report_date = current_date-1 AND Billing_Cycle = 0 AND T30D_New_Users > 50 AND length(Product_Name_Final) > 8
UNION ALL
--CT PLAN DATA SPLIT
SELECT App_Name || ' - ' || Spend_Country_Code_AFID AS app_short_name, Plan_Name AS feature_plan_name, null AS traffic_source, null AS afid, sum(Daily_Users) AS subs_count_t30d FROM sub_data
WHERE App_Name = 'CT' AND Spend_Country_Code_AFID IN ('US', "JP")
GROUP BY App_Name, Spend_Country_Code_AFID, Plan_Name
UNION ALL
--TRAFFIC CHANNEL DATA
SELECT App_Name AS app_short_name, null AS feature_plan_name, ts.display_name AS traffic_source, null AS afid, sum(Daily_Users) AS subs_count_t30d FROM sub_data AS ud
LEFT JOIN (
  SELECT a.afid_channel, a.Channel_Name, min(a.Channel_Type) AS Channel_Type, CASE WHEN c.num_types = 1 THEN REPLACE(a.Channel_Name, '_', ' ') ELSE REPLACE(a.Channel_Name, '_', ' ') || ' (' || min(a.Channel_Type) || ')' END AS display_name
FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a
LEFT JOIN (SELECT Channel_Name, count(DISTINCT Channel_Type) AS num_types FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` GROUP BY Channel_Name) AS c ON a.Channel_Name = c.Channel_Name
WHERE a.afid_channel <> 99
GROUP BY a.afid_channel, a.Channel_Name, c.num_types
ORDER BY a.afid_channel ASC
) AS ts ON ud.AFID_CHANNEL = ts.afid_channel
WHERE ud.AFID_CHANNEL <> 99
GROUP BY App_Name, ts.display_name
UNION ALL
--CT TRAFFIC CHANNEL DATA SPLIT
SELECT App_Name || ' - ' || Spend_Country_Code_AFID AS app_short_name, null AS feature_plan_name, ts.display_name AS traffic_source, null AS afid, sum(Daily_Users) AS subs_count_t30d FROM sub_data AS ud
LEFT JOIN (
  SELECT a.afid_channel, a.Channel_Name, min(a.Channel_Type) AS Channel_Type, CASE WHEN c.num_types = 1 THEN REPLACE(a.Channel_Name, '_', ' ') ELSE REPLACE(a.Channel_Name, '_', ' ') || ' (' || min(a.Channel_Type) || ')' END AS display_name
FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a
LEFT JOIN (SELECT Channel_Name, count(DISTINCT Channel_Type) AS num_types FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` GROUP BY Channel_Name) AS c ON a.Channel_Name = c.Channel_Name
WHERE a.afid_channel <> 99
GROUP BY a.afid_channel, a.Channel_Name, c.num_types
ORDER BY a.afid_channel ASC
) AS ts ON ud.AFID_CHANNEL = ts.afid_channel
WHERE ud.AFID_CHANNEL <> 99 AND App_Name = 'CT' AND Spend_Country_Code_AFID IN ('US', "JP")
GROUP BY App_Name, Spend_Country_Code_AFID, ts.display_name
UNION ALL
--AFID DATA
SELECT App_Name AS app_short_name, null AS feature_plan_name, null AS traffic_source, AFID AS afid, count(1) AS subs_count_t30d FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE App_Name NOT IN ('CT') AND Billing_Cycle = '0' AND Final_Order_Status <> 7 AND AFID <> "" AND Trial_Type <> 'SS' AND Date_of_Sale BETWEEN current_date-30 AND current_date-1
GROUP BY App_Name, AFID
UNION ALL
--CT AFID DATA
SELECT App_Name || ' - ' || App_Country AS app_short_name, null AS feature_plan_name, null AS traffic_source, AFID AS afid, count(1) AS subs_count_t30d FROM (SELECT *, CASE WHEN Country_Code = 'JP' THEN 'JP' ELSE 'US' END AS App_Country FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE App_Name = 'CT' AND Billing_Cycle = '0' AND Final_Order_Status <> 7 AND AFID <> "" AND Trial_Type <> 'SS' AND Date_of_Sale BETWEEN current_date-30 AND current_date-1) AS ct
GROUP BY App_Name, AFID, App_Country) AS d
--RANKS
LEFT JOIN (
SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d FROM sub_data
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS rd ON LEFT(d.app_short_name, 2) = rd.app
ORDER BY d.app_short_name, d.feature_plan_name, d.traffic_source, d.afid
