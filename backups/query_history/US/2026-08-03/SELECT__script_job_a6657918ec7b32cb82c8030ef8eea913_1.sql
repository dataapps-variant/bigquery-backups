-- job_id: script_job_a6657918ec7b32cb82c8030ef8eea913_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:04.041000+00:00
-- started: 2026-08-03T08:30:04.148000+00:00
-- ended: 2026-08-03T08:30:04.397000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
