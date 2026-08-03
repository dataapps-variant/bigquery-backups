-- job_id: a50f49ad-9171-4cc9-bf68-8569a8094c3e
-- user: 1041741270489-compute@developer.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T15:27:15.380000+00:00
-- started: 2026-07-27T15:27:15.457000+00:00
-- ended: 2026-07-27T15:27:16.022000+00:00

WITH trx_data AS (
  SELECT DATE(time_stamp) AS report_date, count(1) AS total_transactions FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_Incremental` WHERE DATETIME(time_stamp) BETWEEN current_date-7 AND current_date AND EXTRACT(HOUR FROM DATE_TRUNC(DATETIME(time_stamp), HOUR)) = EXTRACT(HOUR FROM DATETIME_SUB(datetime(current_timestamp, 'America/New_York'), INTERVAL 1 HOUR))
GROUP BY DATE(time_stamp)
)
SELECT datetime(max(_airbyte_extracted_at), 'America/New_York') AS last_extract_est, max(TIMESTAMP(time_stamp)) AS most_recent_order_est, TIMESTAMP_DIFF(current_timestamp, max(_airbyte_extracted_at), MINUTE) < 30 AS extract_done, avg(d.total_transactions) AS avg_transactions_for_hour FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_Incremental` 
LEFT JOIN trx_data AS d ON 1=1
WHERE DATETIME(time_stamp) >= current_date-1
