-- job_id: script_job_59176f16fd632e371ce8f18f7a0f2173_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.290000+00:00
-- started: 2026-07-31T08:45:06.422000+00:00
-- ended: 2026-07-31T08:45:06.591000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
