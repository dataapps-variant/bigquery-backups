-- job_id: script_job_78f0f7462f70054b8d496d4e94c2739a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:09.132000+00:00
-- started: 2026-07-29T08:30:09.220000+00:00
-- ended: 2026-07-29T08:30:09.427000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
