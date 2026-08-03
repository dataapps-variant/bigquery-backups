-- job_id: script_job_36b5dcafde34c5bb77d40c528f028b16_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:11.214000+00:00
-- started: 2026-07-29T08:30:11.262000+00:00
-- ended: 2026-07-29T08:30:11.449000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
