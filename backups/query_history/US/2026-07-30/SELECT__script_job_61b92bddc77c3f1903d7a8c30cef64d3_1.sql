-- job_id: script_job_61b92bddc77c3f1903d7a8c30cef64d3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:04.093000+00:00
-- started: 2026-07-30T08:45:04.137000+00:00
-- ended: 2026-07-30T08:45:05.114000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
