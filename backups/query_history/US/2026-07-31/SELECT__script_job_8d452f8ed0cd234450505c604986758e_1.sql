-- job_id: script_job_8d452f8ed0cd234450505c604986758e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:00:06.153000+00:00
-- started: 2026-07-31T10:00:06.258000+00:00
-- ended: 2026-07-31T10:00:06.498000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
