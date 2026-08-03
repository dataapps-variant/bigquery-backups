-- job_id: script_job_022fceb42719b6b8b1973483e2426a33_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T00:40:02.571000+00:00
-- started: 2026-07-28T00:40:02.821000+00:00
-- ended: 2026-07-28T00:40:03.104000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
