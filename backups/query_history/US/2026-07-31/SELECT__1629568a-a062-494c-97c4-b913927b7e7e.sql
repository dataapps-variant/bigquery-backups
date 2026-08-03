-- job_id: 1629568a-a062-494c-97c4-b913927b7e7e
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T01:15:11.233000+00:00
-- started: 2026-07-31T01:15:11.504000+00:00
-- ended: 2026-07-31T01:15:12.757000+00:00


    WITH past_orders AS (
  SELECT DATE_TRUNC(DATETIME(time_stamp), HOUR) AS date_trunc, DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS date_value, EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) AS num_hour, COUNT(1) AS count FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_Incremental` WHERE DATETIME(time_stamp) >= DATETIME_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 720 HOUR), HOUR) AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))AND campaign_id IN (SELECT Campaign_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Campaign` WHERE App_Name = 'PD')
  GROUP BY DATE_TRUNC(DATETIME(time_stamp), HOUR), DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)), EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR))
  ORDER BY DATE(DATE_TRUNC(DATETIME(time_stamp), HOUR)) ASC
),
generated_series AS (
  SELECT * FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), INTERVAL 30 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 2 HOUR), HOUR)), INTERVAL 1 DAY)) AS t_stamp
),
all_hours AS (
    SELECT * FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY t_stamp DESC) AS r, ad.* FROM (
    SELECT t.t_stamp, extract(hour from DATE_TRUNC(t.t_stamp, HOUR)) AS num_hour, 
    CASE WHEN ad.count IS NULL THEN 0 ELSE ad.count END AS count FROM generated_series AS t
    LEFT JOIN past_orders AS ad ON t.t_stamp = TIMESTAMP(ad.date_trunc)
    WHERE (FORMAT_DATE('%u', t.t_stamp) IN ('6','7')) = (FORMAT_DATE('%u', DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR)) IN ('6','7'))
    ) AS ad
    ) AS rd WHERE  r <= 7
),
hour_stats AS (
    SELECT num_hour, avg(count) AS avg_transactions, COUNTIF(count = 0) AS no_orders, sum(count) AS total_transactions FROM all_hours
    GROUP BY num_hour ORDER BY num_hour ASC
),
current_data AS (
    SELECT TIMESTAMP(DATE_TRUNC(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR), HOUR)) AS t_stamp, 1 AS time_range, 'hour' AS range_string, count AS transactions FROM past_orders WHERE date_value = current_date
),
chart_data AS (
    SELECT TO_JSON_STRING(ARRAY_AGG(STRUCT(DATE(t_stamp) AS date, count AS value) ORDER BY t_stamp DESC)) AS chart_data FROM (
        SELECT t_stamp, transactions AS count FROM current_data
        UNION ALL
        SELECT t_stamp, count FROM all_hours
    ) AS d
)

SELECT 'PD' AS app_name, d.range_string, d.transactions, d.avg_transactions, coalesce(app_ranks.alert_level, 0) AS app_priority, coalesce(app_ranks.subs_count_t30d, 0) AS subs_count_t30d, chart.chart_data FROM (
SELECT cd.*, hs.num_hour, hs.avg_transactions, hs.no_orders FROM current_data AS cd
LEFT JOIN hour_stats AS hs ON extract(hour from DATE_TRUNC(cd.t_stamp, HOUR)) = hs.num_hour) AS d
LEFT JOIN (SELECT app, rank() over(ORDER BY subs_count_t30d DESC) AS rank, alert_level, subs_count_t30d FROM (
SELECT app_short_name AS app, sum(subs_count_t30d) AS subs_count_t30d,
CASE WHEN sum(subs_count_t30d) > 25000 THEN 4 WHEN sum(subs_count_t30d) > 10000 THEN 3 WHEN sum(subs_count_t30d) > 5000 THEN 2 WHEN sum(subs_count_t30d) > 2000 THEN 1 ELSE 0 END AS alert_level
FROM (SELECT App_Name AS app_short_name, sum(Daily_Users) AS subs_count_t30d 
FROM `variant-finance-data-project.Utilities.New_User_Count_by_Day` WHERE Date_of_Sale BETWEEN current_date-30 AND current_date-1 AND right(Plan_Name, 2) <> 'SS'
GROUP BY App_Name) AS d
GROUP BY app_short_name) AS ad
ORDER BY subs_count_t30d DESC) AS app_ranks ON app_ranks.app = 'PD'
LEFT JOIN chart_data AS chart ON 1=1
WHERE d.transactions = 0 AND d.avg_transactions >= 10;
