-- job_id: script_job_b580386bbf527f5b840338c0276a33b4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:07.795000+00:00
-- started: 2026-08-03T08:45:07.830000+00:00
-- ended: 2026-08-03T08:45:08.006000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
