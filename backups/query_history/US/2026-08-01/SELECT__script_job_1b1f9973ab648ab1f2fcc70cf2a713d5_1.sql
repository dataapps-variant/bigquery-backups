-- job_id: script_job_1b1f9973ab648ab1f2fcc70cf2a713d5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:45:10.474000+00:00
-- started: 2026-08-01T09:45:10.546000+00:00
-- ended: 2026-08-01T09:45:10.746000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
