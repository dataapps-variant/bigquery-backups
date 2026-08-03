-- job_id: script_job_70d547e2baeb6cc3cf380256157c32b4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:18:47.016000+00:00
-- started: 2026-07-28T15:18:47.104000+00:00
-- ended: 2026-07-28T15:18:47.304000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
