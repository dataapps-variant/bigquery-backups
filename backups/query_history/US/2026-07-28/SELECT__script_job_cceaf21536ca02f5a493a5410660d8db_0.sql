-- job_id: script_job_cceaf21536ca02f5a493a5410660d8db_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:40:04.969000+00:00
-- started: 2026-07-28T12:40:05.065000+00:00
-- ended: 2026-07-28T12:40:05.290000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
