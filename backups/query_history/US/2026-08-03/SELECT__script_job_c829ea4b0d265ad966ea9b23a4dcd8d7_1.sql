-- job_id: script_job_c829ea4b0d265ad966ea9b23a4dcd8d7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.168000+00:00
-- started: 2026-08-03T08:45:04.235000+00:00
-- ended: 2026-08-03T08:45:04.469000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
