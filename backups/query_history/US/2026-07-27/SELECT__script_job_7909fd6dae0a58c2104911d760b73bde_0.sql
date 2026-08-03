-- job_id: script_job_7909fd6dae0a58c2104911d760b73bde_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T21:40:01.488000+00:00
-- started: 2026-07-27T21:40:01.788000+00:00
-- ended: 2026-07-27T21:40:02.038000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
