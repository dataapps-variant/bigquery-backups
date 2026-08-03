-- job_id: script_job_58c82405c6fbe1d402cb90c133c49a11_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T07:40:03.517000+00:00
-- started: 2026-07-28T07:40:03.614000+00:00
-- ended: 2026-07-28T07:40:03.849000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
