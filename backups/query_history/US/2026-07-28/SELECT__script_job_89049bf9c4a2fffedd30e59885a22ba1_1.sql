-- job_id: script_job_89049bf9c4a2fffedd30e59885a22ba1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.298000+00:00
-- started: 2026-07-28T08:45:03.376000+00:00
-- ended: 2026-07-28T08:45:03.550000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
