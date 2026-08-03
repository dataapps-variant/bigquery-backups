-- job_id: script_job_57e341181864773f04274007d5e54810_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:45:04.577000+00:00
-- started: 2026-08-02T09:45:04.686000+00:00
-- ended: 2026-08-02T09:45:04.933000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
