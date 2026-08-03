-- job_id: script_job_646e4bfd4220fa486e6d5c44d7d95d12_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:57:25.034000+00:00
-- started: 2026-07-30T10:57:25.105000+00:00
-- ended: 2026-07-30T10:57:25.285000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
)).*;
