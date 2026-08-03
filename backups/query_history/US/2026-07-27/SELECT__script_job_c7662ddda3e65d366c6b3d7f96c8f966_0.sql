-- job_id: script_job_c7662ddda3e65d366c6b3d7f96c8f966_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T22:40:05.685000+00:00
-- started: 2026-07-27T22:40:05.759000+00:00
-- ended: 2026-07-27T22:40:05.996000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
