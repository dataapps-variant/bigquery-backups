-- job_id: script_job_fe449505fa72de03b283f4a77ee10a3c_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T20:40:04.227000+00:00
-- started: 2026-07-27T20:40:04.345000+00:00
-- ended: 2026-07-27T20:40:04.725000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
