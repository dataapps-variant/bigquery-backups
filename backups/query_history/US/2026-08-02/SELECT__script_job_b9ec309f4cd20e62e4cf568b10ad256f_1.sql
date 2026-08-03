-- job_id: script_job_b9ec309f4cd20e62e4cf568b10ad256f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:30:05.648000+00:00
-- started: 2026-08-02T08:30:05.739000+00:00
-- ended: 2026-08-02T08:30:05.984000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
