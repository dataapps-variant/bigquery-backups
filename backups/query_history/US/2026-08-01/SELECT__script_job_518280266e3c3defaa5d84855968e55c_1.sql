-- job_id: script_job_518280266e3c3defaa5d84855968e55c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:07.044000+00:00
-- started: 2026-08-01T08:45:07.113000+00:00
-- ended: 2026-08-01T08:45:07.286000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
