-- job_id: script_job_441bf44592ceae023d35a20394cf9a33_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:09.051000+00:00
-- started: 2026-07-30T08:30:09.162000+00:00
-- ended: 2026-07-30T08:30:09.344000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
