-- job_id: script_job_272844459d3c87b5fb4488b4dc923eb5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:06.263000+00:00
-- started: 2026-07-30T08:30:06.343000+00:00
-- ended: 2026-07-30T08:30:06.542000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.Refund_Table`
)).*;
