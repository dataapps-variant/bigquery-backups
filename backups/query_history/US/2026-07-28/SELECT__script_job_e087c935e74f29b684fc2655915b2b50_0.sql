-- job_id: script_job_e087c935e74f29b684fc2655915b2b50_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:40:03.453000+00:00
-- started: 2026-07-28T15:40:03.512000+00:00
-- ended: 2026-07-28T15:40:03.858000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
