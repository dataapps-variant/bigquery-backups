-- job_id: script_job_1cfd6c69841c7bd54d8eeb254e735f51_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:07.893000+00:00
-- started: 2026-07-29T09:45:07.995000+00:00
-- ended: 2026-07-29T09:45:08.225000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
