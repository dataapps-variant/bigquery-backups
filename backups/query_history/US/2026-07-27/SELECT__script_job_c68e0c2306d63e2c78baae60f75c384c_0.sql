-- job_id: script_job_c68e0c2306d63e2c78baae60f75c384c_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T16:40:02.703000+00:00
-- started: 2026-07-27T16:40:02.788000+00:00
-- ended: 2026-07-27T16:40:03.023000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
