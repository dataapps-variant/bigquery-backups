-- job_id: script_job_644e514575140d04c4372fbdd64f0ef6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:12.475000+00:00
-- started: 2026-08-01T08:30:12.559000+00:00
-- ended: 2026-08-01T08:30:13.993000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
