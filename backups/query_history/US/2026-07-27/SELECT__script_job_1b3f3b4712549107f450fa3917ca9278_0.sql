-- job_id: script_job_1b3f3b4712549107f450fa3917ca9278_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T19:40:05.195000+00:00
-- started: 2026-07-27T19:40:05.290000+00:00
-- ended: 2026-07-27T19:40:05.543000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
