-- job_id: script_job_2a0e8c8e4f95dcaa2d4a6b4aa514f9d6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:05.343000+00:00
-- started: 2026-07-29T09:45:05.439000+00:00
-- ended: 2026-07-29T09:45:05.703000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
