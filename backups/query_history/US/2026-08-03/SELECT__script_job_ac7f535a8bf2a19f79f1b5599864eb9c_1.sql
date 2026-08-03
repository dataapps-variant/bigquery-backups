-- job_id: script_job_ac7f535a8bf2a19f79f1b5599864eb9c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:05.655000+00:00
-- started: 2026-08-03T09:45:05.714000+00:00
-- ended: 2026-08-03T09:45:05.887000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
