-- job_id: scheduled_query_6a74a385-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-28T14:40:01.104000+00:00
-- started: 2026-07-28T14:40:01.155000+00:00
-- ended: 2026-07-28T14:40:14.702000+00:00

DECLARE v_snapshot_id STRING;
DECLARE v_snapshot_date DATE;
DECLARE v_snapshot_hour INT64;
DECLARE v_row_count INT64;
DECLARE v_today_spend FLOAT64;
DECLARE v_total_spend FLOAT64;
DECLARE v_keep_snapshot_id STRING;

SET v_snapshot_date = current_date;
SET v_snapshot_hour = EXTRACT(HOUR FROM datetime(current_timestamp, 'America/New_York'));
SET v_snapshot_id = CONCAT('snap_', FORMAT_TIMESTAMP('%Y%m%d_%H%M%S', current_timestamp, 'America/New_York'), '_', SUBSTR(GENERATE_UUID(), 1, 8));

-- Find the current latest snapshot — KEEP it so lagged view can serve it
SET v_keep_snapshot_id = (
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
);

-- Delete history data EXCEPT the one we're keeping
IF v_keep_snapshot_id IS NOT NULL THEN
  DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id;
ELSE
  DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE 1=1;
END IF;

-- Clean old registry entries
DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY);

-- Register new snapshot
INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
(snapshot_id, snapshot_date, snapshot_hour_et, captured_at, status)
VALUES (v_snapshot_id, v_snapshot_date, v_snapshot_hour, current_timestamp, 'CAPTURING');

-- Copy fresh data from live table
INSERT INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
(snapshot_id, snapshot_timestamp, snapshot_date, snapshot_hour_et,
 Channel_name, Date, Channel_type, Channel_code,
 App_name, Final_URL_suffix_AFID, Country, Amount, Source)
SELECT 
  v_snapshot_id, current_timestamp, v_snapshot_date, v_snapshot_hour,
  Channel_name, Date, Channel_type, Channel_code,
  App_name, Final_URL_suffix_AFID, Country, Amount, Source
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_merged_final_spend`;

-- Count what was captured
SET v_row_count = (SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id);
SET v_today_spend = (SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date);
SET v_total_spend = (SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id);

-- Mark complete or failed
IF v_row_count > 0 THEN
  UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'COMPLETE', row_count = v_row_count, today_spend = v_today_spend, total_spend = v_total_spend
  WHERE snapshot_id = v_snapshot_id;
ELSE
  UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  SET status = 'FAILED', row_count = 0, today_spend = 0, total_spend = 0
  WHERE snapshot_id = v_snapshot_id;
END IF;
