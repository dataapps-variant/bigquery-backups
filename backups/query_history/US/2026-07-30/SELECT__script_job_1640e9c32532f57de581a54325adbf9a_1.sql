-- job_id: script_job_1640e9c32532f57de581a54325adbf9a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:06.923000+00:00
-- started: 2026-07-30T09:45:06.987000+00:00
-- ended: 2026-07-30T09:45:07.215000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
