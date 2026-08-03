-- job_id: scheduled_query_6a74e459-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-28T14:51:13.041000+00:00
-- started: 2026-07-28T14:51:13.110000+00:00
-- ended: 2026-07-28T14:51:19.058000+00:00

-- Capture one hourly snapshot of live spend into the new history table
INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
(snapshot_id, snapshot_timestamp, snapshot_date, snapshot_hour_et, captured_at,
 Channel_name, Date, Channel_type, Channel_code,
 App_name, Final_URL_suffix_AFID, Country, Amount, Source)
SELECT
  CONCAT('snap_', FORMAT_TIMESTAMP('%Y%m%d_%H%M%S', current_timestamp, 'America/New_York'),
         '_', SUBSTR(GENERATE_UUID(), 1, 8)) AS snapshot_id,
  current_timestamp AS snapshot_timestamp,
  current_date AS snapshot_date,
  EXTRACT(HOUR FROM DATETIME(current_timestamp, 'America/New_York')) AS snapshot_hour_et,
  current_timestamp AS captured_at,
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country, Amount, Source
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;

-- Keep only the last 2 hours of snapshots
DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history1`
WHERE captured_at < TIMESTAMP_SUB(current_timestamp, INTERVAL 2 HOUR);
