-- job_id: script_job_839bc28c1af17fcb253074169b04ebbd_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:23:12.587000+00:00
-- started: 2026-07-27T18:23:12.662000+00:00
-- ended: 2026-07-27T18:23:20.200000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
