-- job_id: script_job_e6824e1b513bb3424183fd4d88d0c580_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T23:40:01.543000+00:00
-- started: 2026-07-27T23:40:01.632000+00:00
-- ended: 2026-07-27T23:40:01.970000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
