-- job_id: script_job_c2d55cd524464e92d8df60e606226766_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:05.984000+00:00
-- started: 2026-08-03T09:45:06.079000+00:00
-- ended: 2026-08-03T09:45:06.289000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
