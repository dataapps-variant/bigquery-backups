-- job_id: script_job_e78ccaf269787af3111fc0b4b5b90343_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.710000+00:00
-- started: 2026-07-28T08:45:03.787000+00:00
-- ended: 2026-07-28T08:45:03.987000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
