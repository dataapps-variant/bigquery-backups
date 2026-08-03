-- job_id: script_job_faee4f0b6ef96b2ec047b5a662a975fb_4
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T23:40:07.306000+00:00
-- started: 2026-07-27T23:40:07.676000+00:00
-- ended: 2026-07-27T23:40:11.722000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
(snapshot_id, snapshot_timestamp, snapshot_date, snapshot_hour_et,
 Channel_name, Date, Channel_type, Channel_code,
 App_name, Final_URL_suffix_AFID, Country, Amount, Source)
SELECT 
  v_snapshot_id, current_timestamp, v_snapshot_date, v_snapshot_hour,
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country, Amount, Source
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
