-- job_id: script_job_cbc8dd3f16a5fbbbd2b338c459b34f98_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:06.132000+00:00
-- started: 2026-07-28T09:45:06.198000+00:00
-- ended: 2026-07-28T09:45:06.363000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
