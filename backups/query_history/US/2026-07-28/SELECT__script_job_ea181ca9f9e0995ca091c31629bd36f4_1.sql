-- job_id: script_job_ea181ca9f9e0995ca091c31629bd36f4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:04.803000+00:00
-- started: 2026-07-28T08:30:04.895000+00:00
-- ended: 2026-07-28T08:30:05.213000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
