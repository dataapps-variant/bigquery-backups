-- job_id: script_job_be8417c4cf8f04bc0b3946c4d5258ab2_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:40:03.408000+00:00
-- started: 2026-07-27T18:40:03.496000+00:00
-- ended: 2026-07-27T18:40:03.691000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
