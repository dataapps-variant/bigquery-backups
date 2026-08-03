-- job_id: script_job_017921d5858e74d8316e341245884504_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.725000+00:00
-- started: 2026-08-01T08:45:05.819000+00:00
-- ended: 2026-08-01T08:45:05.979000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
