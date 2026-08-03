-- job_id: script_job_0054401b9610fedc3830cd602ad969ea_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:08.087000+00:00
-- started: 2026-08-03T09:15:08.166000+00:00
-- ended: 2026-08-03T09:15:08.585000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
