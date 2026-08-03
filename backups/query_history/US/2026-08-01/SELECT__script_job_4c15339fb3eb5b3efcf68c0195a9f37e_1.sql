-- job_id: script_job_4c15339fb3eb5b3efcf68c0195a9f37e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:07.174000+00:00
-- started: 2026-08-01T08:45:07.263000+00:00
-- ended: 2026-08-01T08:45:07.460000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
