-- job_id: script_job_99f544f3c5f06f4cd2c0b21a46dafc24_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:45:08.878000+00:00
-- started: 2026-08-01T09:45:08.927000+00:00
-- ended: 2026-08-01T09:45:09.104000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
