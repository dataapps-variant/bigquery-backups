-- job_id: script_job_5049bc1a5b931f17df9d8cd6f50f3edb_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:06.191000+00:00
-- started: 2026-08-03T08:45:06.256000+00:00
-- ended: 2026-08-03T08:45:06.471000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
