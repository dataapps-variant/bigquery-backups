-- job_id: script_job_7def391a546bf06d053ea118d58e20f5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.894000+00:00
-- started: 2026-07-31T08:45:04.978000+00:00
-- ended: 2026-07-31T08:45:05.181000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
