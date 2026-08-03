-- job_id: script_job_fb278316964c8ea54075ce0e9849b3cb_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:10:04.793000+00:00
-- started: 2026-07-27T14:10:04.932000+00:00
-- ended: 2026-07-27T14:10:05.530000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
