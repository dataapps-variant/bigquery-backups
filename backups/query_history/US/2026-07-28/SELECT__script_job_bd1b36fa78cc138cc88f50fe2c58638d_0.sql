-- job_id: script_job_bd1b36fa78cc138cc88f50fe2c58638d_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:40:01.741000+00:00
-- started: 2026-07-28T08:40:01.834000+00:00
-- ended: 2026-07-28T08:40:02.057000+00:00

SELECT STRUCT<STRING>((
  SELECT snapshot_id
  FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
  WHERE status = 'COMPLETE'
  ORDER BY captured_at DESC
  LIMIT 1
)).*;
