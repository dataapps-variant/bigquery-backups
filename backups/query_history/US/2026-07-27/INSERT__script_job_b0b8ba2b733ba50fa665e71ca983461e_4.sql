-- job_id: script_job_b0b8ba2b733ba50fa665e71ca983461e_4
-- user: dataapps@variant.net
-- statement_type: INSERT
-- created: 2026-07-27T15:40:13.074000+00:00
-- started: 2026-07-27T15:40:13.455000+00:00
-- ended: 2026-07-27T15:40:17.132000+00:00

INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
(snapshot_id, snapshot_timestamp, snapshot_date, snapshot_hour_et,
 Channel_name, Date, Channel_type, Channel_code,
 App_name, Final_URL_suffix_AFID, Country, Amount, Source)
SELECT 
  v_snapshot_id, current_timestamp, v_snapshot_date, v_snapshot_hour,
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country, Amount, Source
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`
