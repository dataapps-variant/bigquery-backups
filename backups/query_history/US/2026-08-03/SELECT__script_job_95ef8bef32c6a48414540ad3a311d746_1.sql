-- job_id: script_job_95ef8bef32c6a48414540ad3a311d746_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:03.574000+00:00
-- started: 2026-08-03T08:30:03.674000+00:00
-- ended: 2026-08-03T08:30:03.881000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
