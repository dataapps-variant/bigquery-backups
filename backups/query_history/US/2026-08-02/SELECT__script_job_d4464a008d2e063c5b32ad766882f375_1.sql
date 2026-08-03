-- job_id: script_job_d4464a008d2e063c5b32ad766882f375_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.151000+00:00
-- started: 2026-08-02T08:45:06.231000+00:00
-- ended: 2026-08-02T08:45:06.417000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
