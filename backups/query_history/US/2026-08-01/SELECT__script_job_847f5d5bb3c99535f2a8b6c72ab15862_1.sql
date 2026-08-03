-- job_id: script_job_847f5d5bb3c99535f2a8b6c72ab15862_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.714000+00:00
-- started: 2026-08-01T08:45:04.794000+00:00
-- ended: 2026-08-01T08:45:05.109000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
