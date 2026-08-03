-- job_id: a052d309-8ad2-4752-b68e-509db6def182
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:16:43.084000+00:00
-- started: 2026-07-31T10:16:43.198000+00:00
-- ended: 2026-07-31T10:16:44.875000+00:00


    WITH past_orders AS (
  SELECT app, date_trunc, date_value, num_hour, count(1) AS users FROM (
  SELECT COALESCE(CASE WHEN AF.JF_App_Name IS NOT NULL AND TRIM(AF.JF_App_Name) != '' AND UPPER(TRIM(AF.JF_App_Name)) != 'COMBINED' THEN AF.JF_App_Name ELSE NULL END, CAM.App_Name, 'JF') AS app, o.order_id, DATE_TRUNC(DATETIME(time_stamp), HOUR) AS date_trunc, DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS date_value, EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS num_hour FROM `variant-finance-data-project.Sticky_Data.test_Sticky_data_API_original_JF_Incremental` AS o
  LEFT JOIN Sticky_Data.Sticky_Dim_AFID AS AF ON o.AFID = AF.AFID
LEFT JOIN Sticky_Data.Sticky_Dim_Campaign AS CAM ON o.Campaign_Id = CAM.Campaign_Id AND CAM.Entity = 'JF'
  WHERE DATETIME(time_stamp) >= DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 850 HOUR), HOUR) AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))AND billing_cycle = '0' AND order_status <> '7' AND o.campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE Entity = 'JF')
  )
  GROUP BY app, date_trunc, date_value, num_hour
  ORDER BY date_value ASC
),
generated_series AS (
  SELECT *, 'JF' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'CL' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'CV' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'RT' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
  UNION ALL
  SELECT *, 'RL' AS app FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 35 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
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
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = d.app
LEFT JOIN chart_data AS chart ON d.app = chart.app
WHERE c.mean - d.users >= 10 AND d.users / c.mean < 0.5 AND d.users < c.low_two_sigma;
