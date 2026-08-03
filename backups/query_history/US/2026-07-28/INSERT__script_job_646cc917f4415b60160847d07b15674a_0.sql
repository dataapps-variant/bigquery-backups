-- job_id: script_job_646cc917f4415b60160847d07b15674a_0
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-28T14:51:13.031000+00:00
-- started: 2026-07-28T14:51:13.335000+00:00
-- ended: 2026-07-28T14:51:16.895000+00:00

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
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
