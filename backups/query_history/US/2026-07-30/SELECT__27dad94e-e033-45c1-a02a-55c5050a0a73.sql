-- job_id: 27dad94e-e033-45c1-a02a-55c5050a0a73
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:19:16.470000+00:00
-- started: 2026-07-30T12:19:16.565000+00:00
-- ended: 2026-07-30T12:19:18.137000+00:00


    WITH past_orders AS (
  SELECT app, date_trunc, date_value, num_hour, sum(users) AS users FROM (
  SELECT 'CT - US' AS app, DATE_TRUNC(DATETIME(time_stamp), HOUR) AS date_trunc, DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS date_value, EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS num_hour, COUNT(1) AS users FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental` AS d
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON d.AFID = a.AFID
  WHERE DATETIME(time_stamp) >= DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 850 HOUR), HOUR) AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))AND billing_cycle = '0' AND order_status <> '7' AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND COALESCE(a.Country_Code, d.billing_country) <> 'JP'
  GROUP BY DATE_TRUNC(DATETIME(time_stamp), HOUR), DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)), EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR))
  UNION ALL
  SELECT 'CT - JP' AS app, DATE_TRUNC(DATETIME(time_stamp), HOUR) AS date_trunc, DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS date_value, EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS num_hour, COUNT(1) AS users FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental` AS d
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a ON d.AFID = a.AFID
  WHERE DATETIME(time_stamp) >= DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 850 HOUR), HOUR) AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))AND billing_cycle = '0' AND order_status <> '7' AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'CT') AND COALESCE(a.Country_Code, d.billing_country) = 'JP'
  GROUP BY DATE_TRUNC(DATETIME(time_stamp), HOUR), DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)), EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR))
  UNION ALL
  SELECT 'EN' AS app, DATE_TRUNC(DATETIME(time_stamp), HOUR) AS date_trunc, DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS date_value, EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS num_hour, COUNT(1) AS users FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_Incremental` WHERE DATETIME(time_stamp) >= DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 850 HOUR), HOUR) AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))AND billing_cycle = '0' AND order_status <> '7' AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'EN')
  GROUP BY DATE_TRUNC(DATETIME(time_stamp), HOUR), DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)), EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR))
)
  GROUP BY app, date_trunc, date_value, num_hour
  ORDER BY date_value ASC
),
generated_series AS (
  SELECT *, 'CT - US' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'CT - JP' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'EN' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
),
all_hours AS (
    SELECT * FROM (
    SELECT ROW_NUMBER() OVER (PARTITION BY app ORDER BY t_stamp DESC) AS r, ad.* FROM (
    SELECT t.app, t.t_stamp, extract(hour from DATE_TRUNC(t.t_stamp, HOUR)) AS num_hour, 
    CASE WHEN ad.users IS NULL THEN 0 ELSE ad.users END AS users FROM generated_series AS t
    LEFT JOIN past_orders AS ad ON t.t_stamp = TIMESTAMP(ad.date_trunc) AND t.app = ad.app
    WHERE (FORMAT_DATE('%u', t.t_stamp) IN ('6','7')) = (FORMAT_DATE('%u', DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR)) IN ('6','7'))
    ) AS ad
    ) AS rd WHERE  r <= 10
),
calc_squares AS (
    SELECT ad.app, ad.t_stamp, td.trailing_value AS mean, power(ad.users - td.trailing_value, 2) AS square FROM all_hours AS ad
    LEFT JOIN (SELECT app, num_hour, sum(users) / count(*) AS trailing_value FROM all_hours GROUP BY num_hour, app) AS td ON ad.num_hour = td.num_hour AND ad.app = td.app
    ORDER BY t_stamp ASC
),
calc_variance AS (
    SELECT app, extract(hour from DATE_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), HOUR)) AS num_hour, sum(square) / count(*) AS variance, sqrt(sum(square) / count(*)) AS std_devi, max(mean) AS mean
    FROM calc_squares
    GROUP BY app
),
control_chart AS (
    SELECT ad.app, ad.t_stamp, ad.users, cv.mean, 
    cv.std_devi + cv.mean AS one_sigma, cv.std_devi * 2 + cv.mean AS two_sigma, cv.std_devi * 3 + cv.mean AS three_sigma,
    cv.std_devi * -1 + cv.mean AS low_one_sigma, cv.std_devi * -2 + cv.mean AS low_two_sigma, cv.std_devi * -3 + cv.mean AS low_three_sigma 
    FROM all_hours AS ad
    LEFT JOIN calc_variance AS cv ON ad.num_hour = cv.num_hour AND ad.app = cv.app
    ORDER BY t_stamp ASC
),
past_hour AS (
    SELECT app, TIMESTAMP(DATE_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), HOUR)) AS t_stamp, 1 AS time_range, 'hour' AS range_string, users FROM past_orders WHERE date_value = current_date
),
chart_data AS (
    SELECT app, TO_JSON_STRING(ARRAY_AGG(STRUCT(DATE(t_stamp) AS date, users AS value) ORDER BY t_stamp DESC)) AS chart_data FROM (
        SELECT app, t_stamp, users FROM past_hour
        UNION ALL
        SELECT app, t_stamp, users FROM all_hours
    ) AS d GROUP BY app
)

SELECT d.app AS app_name, d.users, c.mean, c.low_two_sigma, c.low_three_sigma, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(app_ranks.subs_count_t30d, 0) AS subs_count_t30d, chart.chart_data FROM past_hour AS d
LEFT JOIN (SELECT * FROM control_chart QUALIFY ROW_NUMBER() OVER(PARTITION BY app ORDER BY t_stamp DESC) = 1) AS c ON d.app = c.app
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT app_short_name, sum(subs_count_t30d) AS subs_count_t30d FROM (
SELECT CASE WHEN App_Name = 'CT' THEN CASE WHEN Spend_Country_Code_AFID = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app_short_name, Spend_Country_Code_AFID AS country_code, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name, Spend_Country_Code_AFID)
GROUP BY app_short_name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = d.app
LEFT JOIN chart_data AS chart ON d.app = chart.app
WHERE c.mean - d.users >= 10 AND d.users / c.mean < 0.5 AND d.users < c.low_two_sigma;
