-- job_id: script_job_8778c156c4f02434b5f96290fe9a9b74_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:13:34.570000+00:00
-- started: 2026-07-30T10:13:34.651000+00:00
-- ended: 2026-07-30T10:13:34.864000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
