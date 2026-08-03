-- job_id: script_job_57d6c6a9e26a16805e7b40a385c91985_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.099000+00:00
-- started: 2026-07-29T08:45:07.155000+00:00
-- ended: 2026-07-29T08:45:07.619000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
