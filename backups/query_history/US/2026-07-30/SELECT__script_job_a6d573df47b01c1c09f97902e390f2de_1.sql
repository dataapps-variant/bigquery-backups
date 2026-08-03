-- job_id: script_job_a6d573df47b01c1c09f97902e390f2de_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:59:38.642000+00:00
-- started: 2026-07-30T10:59:38.861000+00:00
-- ended: 2026-07-30T10:59:39.153000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
