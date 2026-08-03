-- job_id: script_job_f2e18c8cf6a2c48ec9f9029e1bdbadd8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:04.803000+00:00
-- started: 2026-07-29T08:45:04.887000+00:00
-- ended: 2026-07-29T08:45:05.123000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
