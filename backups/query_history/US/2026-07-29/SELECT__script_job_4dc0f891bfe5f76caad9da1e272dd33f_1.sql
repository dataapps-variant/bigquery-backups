-- job_id: script_job_4dc0f891bfe5f76caad9da1e272dd33f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.371000+00:00
-- started: 2026-07-29T08:45:06.417000+00:00
-- ended: 2026-07-29T08:45:06.613000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
