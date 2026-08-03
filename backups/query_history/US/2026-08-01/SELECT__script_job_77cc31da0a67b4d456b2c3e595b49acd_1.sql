-- job_id: script_job_77cc31da0a67b4d456b2c3e595b49acd_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.652000+00:00
-- started: 2026-08-01T08:45:04.767000+00:00
-- ended: 2026-08-01T08:45:04.938000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
