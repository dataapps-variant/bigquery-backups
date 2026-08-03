-- job_id: script_job_de6b7bed153fa8e74f2c1faa5b47a424_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T10:00:05.313000+00:00
-- started: 2026-07-28T10:00:05.948000+00:00
-- ended: 2026-07-28T10:00:06.232000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
