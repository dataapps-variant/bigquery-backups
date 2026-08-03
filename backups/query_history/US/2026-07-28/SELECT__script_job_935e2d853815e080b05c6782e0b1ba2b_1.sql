-- job_id: script_job_935e2d853815e080b05c6782e0b1ba2b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:10.444000+00:00
-- started: 2026-07-28T08:30:10.489000+00:00
-- ended: 2026-07-28T08:30:10.775000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
