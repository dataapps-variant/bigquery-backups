-- job_id: script_job_852185e1864207907318f4304c6356a4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:06.260000+00:00
-- started: 2026-08-01T08:30:06.375000+00:00
-- ended: 2026-08-01T08:30:06.991000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
