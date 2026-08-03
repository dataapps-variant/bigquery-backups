-- job_id: script_job_6cacefc8ef74d033637281f6db636696_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.202000+00:00
-- started: 2026-07-28T08:45:04.285000+00:00
-- ended: 2026-07-28T08:45:04.466000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
