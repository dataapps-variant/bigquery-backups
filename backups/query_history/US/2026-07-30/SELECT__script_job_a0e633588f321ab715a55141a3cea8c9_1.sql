-- job_id: script_job_a0e633588f321ab715a55141a3cea8c9_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:09.865000+00:00
-- started: 2026-07-30T08:45:09.905000+00:00
-- ended: 2026-07-30T08:45:10.125000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
