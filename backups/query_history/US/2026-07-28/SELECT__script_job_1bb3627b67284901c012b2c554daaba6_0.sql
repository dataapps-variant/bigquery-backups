-- job_id: script_job_1bb3627b67284901c012b2c554daaba6_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T04:40:02.859000+00:00
-- started: 2026-07-28T04:40:02.996000+00:00
-- ended: 2026-07-28T04:40:03.211000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
