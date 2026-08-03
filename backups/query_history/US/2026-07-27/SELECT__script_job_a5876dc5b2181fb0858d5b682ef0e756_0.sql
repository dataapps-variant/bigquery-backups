-- job_id: script_job_a5876dc5b2181fb0858d5b682ef0e756_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T15:40:06.356000+00:00
-- started: 2026-07-27T15:40:06.447000+00:00
-- ended: 2026-07-27T15:40:06.676000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
