-- job_id: script_job_35b6c9d66f24edc3ec11d9c234cbad90_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.443000+00:00
-- started: 2026-07-31T08:45:04.500000+00:00
-- ended: 2026-07-31T08:45:04.697000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
