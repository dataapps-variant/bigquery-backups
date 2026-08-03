-- job_id: script_job_880bf6590578c18ece8ae42fc1c15aef_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:05.086000+00:00
-- started: 2026-08-01T09:15:05.166000+00:00
-- ended: 2026-08-01T09:15:05.357000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
