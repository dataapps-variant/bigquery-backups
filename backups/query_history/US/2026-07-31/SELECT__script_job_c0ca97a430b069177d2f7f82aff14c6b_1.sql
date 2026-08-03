-- job_id: script_job_c0ca97a430b069177d2f7f82aff14c6b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:03.872000+00:00
-- started: 2026-07-31T08:30:03.918000+00:00
-- ended: 2026-07-31T08:30:04.116000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
