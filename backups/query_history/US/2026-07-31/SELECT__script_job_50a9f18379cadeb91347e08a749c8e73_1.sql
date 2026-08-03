-- job_id: script_job_50a9f18379cadeb91347e08a749c8e73_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:05.967000+00:00
-- started: 2026-07-31T09:15:06.048000+00:00
-- ended: 2026-07-31T09:15:06.249000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
