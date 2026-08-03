-- job_id: script_job_44e63012bc7baac7762f680ebd9fcfb3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.817000+00:00
-- started: 2026-08-03T08:45:03.874000+00:00
-- ended: 2026-08-03T08:45:04.014000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
