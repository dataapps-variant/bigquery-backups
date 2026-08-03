-- job_id: script_job_fe458b2fd29d583ee7511809cf1cf81c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.063000+00:00
-- started: 2026-08-01T08:45:08.130000+00:00
-- ended: 2026-08-01T08:45:08.292000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
