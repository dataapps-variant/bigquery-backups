-- job_id: script_job_81571a3b2b17546b25b95825c0ecf80c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:30:05.777000+00:00
-- started: 2026-07-28T09:30:05.881000+00:00
-- ended: 2026-07-28T09:30:06.116000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
