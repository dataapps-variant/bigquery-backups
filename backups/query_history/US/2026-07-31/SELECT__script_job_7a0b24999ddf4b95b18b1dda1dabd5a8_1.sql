-- job_id: script_job_7a0b24999ddf4b95b18b1dda1dabd5a8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:04.948000+00:00
-- started: 2026-07-31T08:30:05.070000+00:00
-- ended: 2026-07-31T08:30:05.295000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
