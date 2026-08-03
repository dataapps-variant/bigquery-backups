-- job_id: script_job_de99c0e314f208a4f61a2721113ec366_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:45:07.311000+00:00
-- started: 2026-07-31T09:45:07.402000+00:00
-- ended: 2026-07-31T09:45:07.632000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
