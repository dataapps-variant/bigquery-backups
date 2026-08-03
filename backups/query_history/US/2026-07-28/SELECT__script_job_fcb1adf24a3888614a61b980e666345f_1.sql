-- job_id: script_job_fcb1adf24a3888614a61b980e666345f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:33:47.841000+00:00
-- started: 2026-07-28T17:33:47.937000+00:00
-- ended: 2026-07-28T17:33:48.159000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
