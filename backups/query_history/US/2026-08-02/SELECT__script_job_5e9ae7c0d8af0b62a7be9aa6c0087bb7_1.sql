-- job_id: script_job_5e9ae7c0d8af0b62a7be9aa6c0087bb7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T10:00:23.264000+00:00
-- started: 2026-08-02T10:00:23.365000+00:00
-- ended: 2026-08-02T10:00:23.582000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
