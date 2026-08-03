-- job_id: script_job_e3af1046256abfc7857f00a36407e223_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:06.777000+00:00
-- started: 2026-07-30T08:45:06.825000+00:00
-- ended: 2026-07-30T08:45:06.996000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
