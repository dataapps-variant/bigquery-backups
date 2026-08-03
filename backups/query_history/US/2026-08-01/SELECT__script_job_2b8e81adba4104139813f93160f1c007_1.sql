-- job_id: script_job_2b8e81adba4104139813f93160f1c007_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:08.530000+00:00
-- started: 2026-08-01T08:30:08.601000+00:00
-- ended: 2026-08-01T08:30:08.802000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
