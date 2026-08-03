-- job_id: script_job_eabd4221c355cb5392e1fb21a6e561e0_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:45:07.244000+00:00
-- started: 2026-07-31T09:45:07.336000+00:00
-- ended: 2026-07-31T09:45:07.560000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
