-- job_id: script_job_2ec44d17cd0991753edaf14b5a1ca4ee_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:30:08.759000+00:00
-- started: 2026-08-03T09:30:08.843000+00:00
-- ended: 2026-08-03T09:30:09.032000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
