-- job_id: script_job_5c92a9aab4d7ced23c2b18ddcb5b37e8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:06.531000+00:00
-- started: 2026-08-02T08:30:06.632000+00:00
-- ended: 2026-08-02T08:30:06.861000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
