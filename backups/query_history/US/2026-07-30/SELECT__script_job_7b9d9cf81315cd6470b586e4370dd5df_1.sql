-- job_id: script_job_7b9d9cf81315cd6470b586e4370dd5df_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.319000+00:00
-- started: 2026-07-30T08:45:07.403000+00:00
-- ended: 2026-07-30T08:45:07.580000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
