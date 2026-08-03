-- job_id: script_job_14d3986364eace6a383ec2cf56212c31_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:40:01.295000+00:00
-- started: 2026-07-28T14:40:01.356000+00:00
-- ended: 2026-07-28T14:40:01.589000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
