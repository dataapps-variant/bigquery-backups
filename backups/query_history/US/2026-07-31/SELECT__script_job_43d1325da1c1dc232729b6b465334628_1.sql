-- job_id: script_job_43d1325da1c1dc232729b6b465334628_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.853000+00:00
-- started: 2026-07-31T08:45:04.923000+00:00
-- ended: 2026-07-31T08:45:05.112000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
