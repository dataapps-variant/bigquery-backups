-- job_id: script_job_5f0b76250fc8d1590484be4728ebea81_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.468000+00:00
-- started: 2026-08-03T08:45:04.545000+00:00
-- ended: 2026-08-03T08:45:04.726000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
