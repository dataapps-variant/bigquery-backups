-- job_id: script_job_1857b4f93ea92490188623bf9ea79500_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:17:07.978000+00:00
-- started: 2026-07-28T17:17:08.066000+00:00
-- ended: 2026-07-28T17:17:08.264000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
