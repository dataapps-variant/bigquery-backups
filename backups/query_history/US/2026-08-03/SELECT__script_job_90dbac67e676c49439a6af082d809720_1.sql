-- job_id: script_job_90dbac67e676c49439a6af082d809720_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.875000+00:00
-- started: 2026-08-03T08:45:03.951000+00:00
-- ended: 2026-08-03T08:45:04.204000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
