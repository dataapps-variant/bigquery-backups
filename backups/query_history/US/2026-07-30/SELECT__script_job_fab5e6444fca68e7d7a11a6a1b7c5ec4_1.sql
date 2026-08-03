-- job_id: script_job_fab5e6444fca68e7d7a11a6a1b7c5ec4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:05.340000+00:00
-- started: 2026-07-30T08:30:05.423000+00:00
-- ended: 2026-07-30T08:30:05.620000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table`
)).*;
