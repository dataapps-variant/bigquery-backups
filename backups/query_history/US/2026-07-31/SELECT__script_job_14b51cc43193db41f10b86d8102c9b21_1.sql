-- job_id: script_job_14b51cc43193db41f10b86d8102c9b21_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:04.220000+00:00
-- started: 2026-07-31T08:30:04.315000+00:00
-- ended: 2026-07-31T08:30:04.508000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
