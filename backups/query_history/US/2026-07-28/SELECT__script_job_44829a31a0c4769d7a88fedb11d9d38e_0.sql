-- job_id: script_job_44829a31a0c4769d7a88fedb11d9d38e_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:40:01.497000+00:00
-- started: 2026-07-28T11:40:01.578000+00:00
-- ended: 2026-07-28T11:40:01.783000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
