-- job_id: script_job_d18bf942e5e2dd6fdd05a72e9d0cd2c8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:50:34.939000+00:00
-- started: 2026-07-29T09:50:35.002000+00:00
-- ended: 2026-07-29T09:50:35.202000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
