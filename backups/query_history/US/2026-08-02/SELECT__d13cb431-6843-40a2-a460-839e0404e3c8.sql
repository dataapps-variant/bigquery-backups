-- job_id: d13cb431-6843-40a2-a460-839e0404e3c8
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:29.409000+00:00
-- started: 2026-08-02T12:00:29.477000+00:00
-- ended: 2026-08-02T12:00:29.837000+00:00

WITH chargebacks AS (
  SELECT report_date, app, ts.display_name AS traffic_channel, count(1) AS chargeback_count FROM (SELECT DATE(Chargeback_Date) AS report_date, CASE WHEN App_Name = 'CT' THEN CASE WHEN COALESCE(NULLIF(Country_Code, 'OR'), Bill_Country_Code) = 'JP' THEN 'CT - JP' ELSE 'CT - US' END ELSE App_Name END AS app, AFID_CHANNEL FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Is_Chargeback = '1' AND DATE(Chargeback_Date) BETWEEN current_date - 135 AND current_date AND Final_Order_Status <> 7 AND AFID_CHANNEL <> 99 AND App_Name NOT IN ('CN', 'AT', 'IQ')) AS ud
LEFT JOIN (
  SELECT a.afid_channel, a.Channel_Name, min(a.Channel_Type) AS Channel_Type, CASE WHEN c.num_types = 1 THEN REPLACE(a.Channel_Name, '_', ' ') ELSE REPLACE(a.Channel_Name, '_', ' ') || ' (' || min(a.Channel_Type) || ')' END AS display_name
FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` AS a
LEFT JOIN (SELECT Channel_Name, count(DISTINCT Channel_Type) AS num_types FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` GROUP BY Channel_Name) AS c ON a.Channel_Name = c.Channel_Name
WHERE a.afid_channel <> 99
GROUP BY a.afid_channel, a.Channel_Name, c.num_types
ORDER BY a.afid_channel ASC
) AS ts ON ud.AFID_CHANNEL = ts.afid_channel
GROUP BY report_date, app, ts.display_name
),
generated_series AS (
  SELECT * FROM UNNEST(GENERATE_TIMESTAMP_ARRAY(TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 135 DAY), HOUR)), TIMESTAMP(date_trunc(DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 DAY), HOUR)), INTERVAL 1 DAY)) AS t_stamp
),
all_data AS (
  SELECT coalesce(o.report_date, c.report_date) AS report_date, coalesce(o.app, c.app) AS app, coalesce(o.traffic_channel, c.traffic_channel) AS traffic_channel, coalesce(c.chargeback_count, 0) AS chargeback_count
	FROM (SELECT DATE(s.t_stamp) AS report_date, c.app, c.traffic_channel FROM (SELECT DISTINCT app, traffic_channel FROM chargebacks) AS c
	FULL JOIN generated_series AS s ON 1=1) AS o
	FULL JOIN chargebacks AS c ON o.report_date = c.report_date AND o.traffic_channel = c.traffic_channel AND o.app = c.app
	ORDER BY report_date DESC
),
t7d_data AS (
	SELECT report_date, app, traffic_channel, chargeback_count, 
	sum(chargeback_count) OVER(PARTITION BY app, traffic_channel ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 6 FOLLOWING) AS t7d_count,
	sum(chargeback_count) OVER(PARTITION BY app, traffic_channel ORDER BY report_date DESC ROWS BETWEEN CURRENT ROW AND 29 FOLLOWING) AS t30d_count
	FROM all_data
	WHERE report_date >= current_date-135 AND traffic_channel IS NOT NULL
)

SELECT report_date+11 AS report_date, app, traffic_channel, chargeback_count, t7d_count, t30d_count FROM t7d_data WHERE report_date BETWEEN current_date-101 AND current_date-12
