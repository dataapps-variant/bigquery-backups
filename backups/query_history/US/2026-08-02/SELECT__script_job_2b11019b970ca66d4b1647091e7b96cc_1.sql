-- job_id: script_job_2b11019b970ca66d4b1647091e7b96cc_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:45:05.144000+00:00
-- started: 2026-08-02T09:45:05.227000+00:00
-- ended: 2026-08-02T09:45:05.443000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_300`
)).*;
