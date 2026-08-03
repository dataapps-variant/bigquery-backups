-- job_id: script_job_136b5f1a16265c922b7b4ae7cf3bc7cc_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.436000+00:00
-- started: 2026-08-02T08:45:06.500000+00:00
-- ended: 2026-08-02T08:45:06.673000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
