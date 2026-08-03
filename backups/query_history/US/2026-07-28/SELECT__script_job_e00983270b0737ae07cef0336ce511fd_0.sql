-- job_id: script_job_e00983270b0737ae07cef0336ce511fd_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T01:40:05.243000+00:00
-- started: 2026-07-28T01:40:05.435000+00:00
-- ended: 2026-07-28T01:40:05.748000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
