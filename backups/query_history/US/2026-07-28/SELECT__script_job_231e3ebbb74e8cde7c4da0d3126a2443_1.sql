-- job_id: script_job_231e3ebbb74e8cde7c4da0d3126a2443_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:04.915000+00:00
-- started: 2026-07-28T08:30:05.014000+00:00
-- ended: 2026-07-28T08:30:06.209000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
