-- job_id: script_job_b7dc36628af4a15a7bf9e440016d0a92_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.493000+00:00
-- started: 2026-08-03T08:45:04.556000+00:00
-- ended: 2026-08-03T08:45:04.707000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
