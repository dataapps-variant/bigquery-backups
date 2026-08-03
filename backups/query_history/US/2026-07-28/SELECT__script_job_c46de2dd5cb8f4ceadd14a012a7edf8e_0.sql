-- job_id: script_job_c46de2dd5cb8f4ceadd14a012a7edf8e_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T02:40:04.591000+00:00
-- started: 2026-07-28T02:40:04.751000+00:00
-- ended: 2026-07-28T02:40:04.991000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
