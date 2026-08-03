-- job_id: script_job_003568c3ebc3bcc88b7f49f91bdac6fb_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.651000+00:00
-- started: 2026-07-28T08:45:03.701000+00:00
-- ended: 2026-07-28T08:45:03.898000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
