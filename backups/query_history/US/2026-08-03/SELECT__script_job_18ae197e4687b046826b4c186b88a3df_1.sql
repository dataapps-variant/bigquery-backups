-- job_id: script_job_18ae197e4687b046826b4c186b88a3df_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.235000+00:00
-- started: 2026-08-03T08:45:03.314000+00:00
-- ended: 2026-08-03T08:45:03.525000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
