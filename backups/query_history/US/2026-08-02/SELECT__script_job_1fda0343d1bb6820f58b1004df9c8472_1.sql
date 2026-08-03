-- job_id: script_job_1fda0343d1bb6820f58b1004df9c8472_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:05.142000+00:00
-- started: 2026-08-02T08:45:05.225000+00:00
-- ended: 2026-08-02T08:45:05.419000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
