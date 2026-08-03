-- job_id: script_job_b01b769751f29cdde5dc584448d8372a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:03.518000+00:00
-- started: 2026-08-03T08:30:03.589000+00:00
-- ended: 2026-08-03T08:30:03.779000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
)).*;
