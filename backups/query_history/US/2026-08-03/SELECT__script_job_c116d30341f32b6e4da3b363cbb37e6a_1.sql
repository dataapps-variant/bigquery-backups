-- job_id: script_job_c116d30341f32b6e4da3b363cbb37e6a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T10:00:09.517000+00:00
-- started: 2026-08-03T10:00:09.637000+00:00
-- ended: 2026-08-03T10:00:09.869000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
