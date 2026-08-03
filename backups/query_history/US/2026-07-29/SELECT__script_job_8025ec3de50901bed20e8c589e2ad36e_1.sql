-- job_id: script_job_8025ec3de50901bed20e8c589e2ad36e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:30:05.610000+00:00
-- started: 2026-07-29T09:30:05.678000+00:00
-- ended: 2026-07-29T09:30:05.920000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
