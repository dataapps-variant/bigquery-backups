-- job_id: script_job_2df7740aa6bd7c21c5b90226af5ef5e9_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:29:35.928000+00:00
-- started: 2026-07-28T18:29:36.002000+00:00
-- ended: 2026-07-28T18:29:36.182000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
