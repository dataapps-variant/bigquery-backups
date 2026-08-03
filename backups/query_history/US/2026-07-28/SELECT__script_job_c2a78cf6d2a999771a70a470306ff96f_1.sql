-- job_id: script_job_c2a78cf6d2a999771a70a470306ff96f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.754000+00:00
-- started: 2026-07-28T08:45:03.818000+00:00
-- ended: 2026-07-28T08:45:04.004000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
