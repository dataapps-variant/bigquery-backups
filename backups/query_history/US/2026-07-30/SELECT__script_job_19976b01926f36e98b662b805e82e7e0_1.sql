-- job_id: script_job_19976b01926f36e98b662b805e82e7e0_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:00:08.975000+00:00
-- started: 2026-07-30T10:00:09.047000+00:00
-- ended: 2026-07-30T10:00:09.239000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
