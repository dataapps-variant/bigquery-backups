-- job_id: script_job_150ec387a2a52577a7f4c1a83cd2cc61_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:40:01.443000+00:00
-- started: 2026-07-28T10:40:01.522000+00:00
-- ended: 2026-07-28T10:40:01.735000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
