-- job_id: script_job_86c558c5cad801ffe4679fbc91b44e0f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.699000+00:00
-- started: 2026-08-01T08:45:04.787000+00:00
-- ended: 2026-08-01T08:45:05.016000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
