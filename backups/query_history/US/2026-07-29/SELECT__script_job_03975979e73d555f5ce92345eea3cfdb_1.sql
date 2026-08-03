-- job_id: script_job_03975979e73d555f5ce92345eea3cfdb_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:00:13.517000+00:00
-- started: 2026-07-29T10:00:13.609000+00:00
-- ended: 2026-07-29T10:00:13.879000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
