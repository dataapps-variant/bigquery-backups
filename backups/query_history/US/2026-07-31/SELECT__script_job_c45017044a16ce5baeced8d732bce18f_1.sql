-- job_id: script_job_c45017044a16ce5baeced8d732bce18f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.778000+00:00
-- started: 2026-07-31T08:45:04.897000+00:00
-- ended: 2026-07-31T08:45:05.144000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
