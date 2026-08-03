-- job_id: script_job_0d8abee8d698dc4d222fc772b2f6dccd_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:05.753000+00:00
-- started: 2026-08-03T09:15:05.838000+00:00
-- ended: 2026-08-03T09:15:06.115000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
