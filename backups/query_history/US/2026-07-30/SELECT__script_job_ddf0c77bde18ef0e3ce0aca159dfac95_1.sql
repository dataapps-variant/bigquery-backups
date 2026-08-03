-- job_id: script_job_ddf0c77bde18ef0e3ce0aca159dfac95_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:19:10.480000+00:00
-- started: 2026-07-30T10:19:10.607000+00:00
-- ended: 2026-07-30T10:19:10.853000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
)).*;
