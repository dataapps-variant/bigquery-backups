-- job_id: script_job_65c9c24ad6b83f07f813cc635004296f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.081000+00:00
-- started: 2026-07-31T08:45:05.161000+00:00
-- ended: 2026-07-31T08:45:05.324000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
