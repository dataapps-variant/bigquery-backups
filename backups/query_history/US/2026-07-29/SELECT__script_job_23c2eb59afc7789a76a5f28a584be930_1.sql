-- job_id: script_job_23c2eb59afc7789a76a5f28a584be930_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:11.206000+00:00
-- started: 2026-07-29T08:30:11.314000+00:00
-- ended: 2026-07-29T08:30:11.490000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
