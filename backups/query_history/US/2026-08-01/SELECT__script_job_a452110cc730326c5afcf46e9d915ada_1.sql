-- job_id: script_job_a452110cc730326c5afcf46e9d915ada_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.530000+00:00
-- started: 2026-08-01T08:45:08.855000+00:00
-- ended: 2026-08-01T08:45:09.065000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
