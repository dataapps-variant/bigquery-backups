-- job_id: script_job_34ec7355cfd139866ecb8f726a636471_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:08.713000+00:00
-- started: 2026-08-01T09:15:08.814000+00:00
-- ended: 2026-08-01T09:15:09.852000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
