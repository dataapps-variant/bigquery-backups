-- job_id: script_job_810519f546d4040d09179e54d70c38fe_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:03.485000+00:00
-- started: 2026-07-28T09:45:03.571000+00:00
-- ended: 2026-07-28T09:45:03.763000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
