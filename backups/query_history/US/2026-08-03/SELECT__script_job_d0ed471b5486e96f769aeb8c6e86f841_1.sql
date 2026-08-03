-- job_id: script_job_d0ed471b5486e96f769aeb8c6e86f841_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:30:05.032000+00:00
-- started: 2026-08-03T09:30:05.096000+00:00
-- ended: 2026-08-03T09:30:05.398000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
