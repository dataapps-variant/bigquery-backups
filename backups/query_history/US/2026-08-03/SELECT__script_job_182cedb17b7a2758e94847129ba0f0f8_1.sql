-- job_id: script_job_182cedb17b7a2758e94847129ba0f0f8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.036000+00:00
-- started: 2026-08-03T08:45:04.167000+00:00
-- ended: 2026-08-03T08:45:04.347000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
