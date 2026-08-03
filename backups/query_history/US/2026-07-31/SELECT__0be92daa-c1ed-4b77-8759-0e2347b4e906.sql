-- job_id: 0be92daa-c1ed-4b77-8759-0e2347b4e906
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:24:48.508000+00:00
-- started: 2026-07-31T12:24:49.584000+00:00
-- ended: 2026-07-31T12:27:38.246000+00:00


    WITH users AS (
SELECT 'FS' AS app, c.report_date, a.afid_channel, a.Country_Code, sum(c.subs) AS subs FROM (
SELECT DATE(time_stamp) AS report_date, afid, count(*) AS subs FROM (
    SELECT time_stamp, afid, order_id AS subs FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_Incremental`
    WHERE DATE(time_stamp) >= DATE(datetime(current_timestamp, 'America/New_York'))-7 AND billing_cycle = '0' AND order_status <> '7'
    AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'FS')
    --FIX FOR STICKY/GOOGLE SYNC OFFSET!AND time_stamp < (SELECT max(_sdc_batched_at) - INTERVAL '4 hour' FROM googleadsv2.campaign_performance_report WHERE date = CAST((SELECT start_dttm FROM ods_stage.stk_api_extract_cdc_stg WHERE entity_name = 'PD') AS DATE))
) AS d
GROUP BY DATE(time_stamp), afid
) AS c
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON c.afid = a.AFID
WHERE a.Channel_Name = 'Google_Ads'
GROUP BY c.report_date, a.afid_channel, a.country_code
),
spend AS (
  SELECT Date AS report_date, App_name AS app_short_name, Channel_type AS traffic_channel, Channel_code, Country AS country, sum(Amount) AS spend FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_View_Updated`
WHERE Date >= current_date-7 AND App_name = 'FS' AND Channel_name = 'Google_Ads'
GROUP BY Date, App_name, Channel_type, Channel_code, Country
),
calc_cac AS (
(SELECT s.report_date, s.app_short_name, s.traffic_channel, s.country, s.spend, u.subs, CASE WHEN u.subs = 0 THEN NULL ELSE s.spend / u.subs END AS cac
FROM spend AS s
LEFT JOIN users AS u ON s.report_date = u.report_date AND s.Channel_code = u.afid_channel AND s.app_short_name = u.app AND s.country = u.country_code)
UNION ALL
(SELECT s.report_date, s.app_short_name, s.traffic_channel, s.country, s.spend, u.subs, CASE WHEN u.subs = 0 THEN NULL ELSE s.spend / u.subs END AS cac
FROM (SELECT report_date, app_short_name, 'ALL' AS traffic_channel, country, sum(s.spend) AS spend FROM spend AS s GROUP BY report_date, app_short_name, country) AS s
LEFT JOIN (SELECT app, report_date, 'ALL' AS traffic_channel, country_code, sum(subs) AS subs FROM users GROUP BY report_date, app, country_code) AS u ON s.report_date = u.report_date AND s.app_short_name = u.app AND s.country = u.country_code)
),
calc_squares AS (
SELECT ad.traffic_channel, ad.app_short_name, ad.country, td.trailing_value AS mean, power(ad.cac - td.trailing_value, 2) AS square FROM calc_cac AS ad
LEFT JOIN (SELECT traffic_channel, app_short_name, country, sum(cac) / count(*) AS trailing_value FROM calc_cac GROUP BY traffic_channel, app_short_name, country) AS td ON ad.traffic_channel = td.traffic_channel AND ad.app_short_name = td.app_short_name AND ad.country = td.country
WHERE ad.report_date < DATE(datetime(current_timestamp, 'America/New_York'))
),
calc_variance AS (
SELECT traffic_channel, app_short_name, country, sum(square) / count(*) AS variance, sqrt(sum(square) / count(*)) AS std_devi, max(mean) AS mean FROM calc_squares GROUP BY traffic_channel, app_short_name, country
),
control_chart AS (
SELECT ad.report_date, ad.app_short_name AS app, ad.traffic_channel, ad.country, ad.cac, ad.spend, ad.subs, cv.mean, 
cv.std_devi + cv.mean AS one_sigma, cv.std_devi * 2 + cv.mean AS two_sigma, cv.std_devi * 3 + cv.mean AS three_sigma
FROM calc_cac AS ad
LEFT JOIN calc_variance AS cv ON ad.traffic_channel = cv.traffic_channel AND ad.app_short_name = cv.app_short_name AND ad.country = cv.country
ORDER BY report_date ASC
),
chart_data AS (
SELECT app, traffic_channel, country, TO_JSON_STRING(ARRAY_AGG(STRUCT(report_date AS date, ROUND(count, 4) AS value) ORDER BY report_date DESC)) AS chart_data FROM (
    SELECT app, traffic_channel, country, report_date, cac AS count FROM control_chart
) AS d GROUP BY app, traffic_channel, country
),
subs_data AS (
SELECT 'FS' AS app, a.Channel_Type AS traffic_channel, a.Country_Code, sum(c.subs) AS subs_count_t30d FROM (
SELECT Date_of_Sale AS report_date, afid, count(*) AS subs FROM (
    SELECT Date_of_Sale, AFID AS afid, order_id AS subs FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Date_of_Sale >= DATE(datetime(current_timestamp, 'America/New_York'))-30 AND billing_cycle = '0' AND Final_Order_Status <> 7 AND Trial_Type <> 'SS' AND AFID <> '' AND App_Name = 'FS'
) AS d
GROUP BY Date_of_Sale, AFID
) AS c
LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON c.afid = a.AFID
WHERE a.Channel_Name = 'Google_Ads'
GROUP BY c.report_date, a.Channel_Type, a.country_code
),
t30d_subs AS (
    SELECT app, country_code, traffic_channel, sum(subs_count_t30d) AS subs_t30d FROM subs_data GROUP BY app, country_code, traffic_channel
    UNION ALL
    SELECT app, country_code, 'ALL' AS traffic_channel, sum(subs_count_t30d) AS subs FROM subs_data GROUP BY app, country_code
),
ranks AS (
SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC
)

SELECT d.app, d.traffic_channel, d.country, d.cac, d.spend, d.subs, d.mean, coalesce(r.alert_level, 0) AS app_priority, coalesce(s.subs_t30d, 0) AS subs_count_t30d, c.chart_data FROM control_chart AS d
LEFT JOIN chart_data AS c ON d.app = c.app AND d.traffic_channel = c.traffic_channel AND d.country = c.country
LEFT JOIN t30d_subs AS s ON d.app = s.app AND d.traffic_channel = s.traffic_channel AND d.country = s.country_code
LEFT JOIN ranks AS r ON d.app = r.app
WHERE report_date = DATE(datetime(current_timestamp, 'America/New_York')) AND cac >= three_sigma AND spend >= 1000 AND ((cac - mean >= 10) OR (spend >= 10000 AND cac - mean >= 5))
