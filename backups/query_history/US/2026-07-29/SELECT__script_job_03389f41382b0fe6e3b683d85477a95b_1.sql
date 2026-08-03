-- job_id: script_job_03389f41382b0fe6e3b683d85477a95b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:05.461000+00:00
-- started: 2026-07-29T08:45:05.546000+00:00
-- ended: 2026-07-29T08:45:05.720000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
