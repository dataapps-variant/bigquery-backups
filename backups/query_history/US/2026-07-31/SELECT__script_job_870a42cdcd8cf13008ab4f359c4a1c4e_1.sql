-- job_id: script_job_870a42cdcd8cf13008ab4f359c4a1c4e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.529000+00:00
-- started: 2026-07-31T08:45:05.579000+00:00
-- ended: 2026-07-31T08:45:05.764000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
)).*;
