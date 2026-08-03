-- job_id: script_job_fe3a360dc1735949799035234412f8b1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.532000+00:00
-- started: 2026-07-31T08:45:06.638000+00:00
-- ended: 2026-07-31T08:45:06.818000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
