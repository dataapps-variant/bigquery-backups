-- job_id: script_job_45c211e43a29b26b8917733526d6cab1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:05.520000+00:00
-- started: 2026-08-03T08:45:05.588000+00:00
-- ended: 2026-08-03T08:45:05.840000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
