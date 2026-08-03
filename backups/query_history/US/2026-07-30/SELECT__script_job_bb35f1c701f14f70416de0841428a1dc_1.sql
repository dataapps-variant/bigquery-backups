-- job_id: script_job_bb35f1c701f14f70416de0841428a1dc_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:07.986000+00:00
-- started: 2026-07-30T09:45:08.053000+00:00
-- ended: 2026-07-30T09:45:08.367000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_30`
)).*;
