-- job_id: script_job_cbc2ff9c97ba11c210065bdb12e25a67_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:36:23.153000+00:00
-- started: 2026-07-28T18:36:23.219000+00:00
-- ended: 2026-07-28T18:36:23.446000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
