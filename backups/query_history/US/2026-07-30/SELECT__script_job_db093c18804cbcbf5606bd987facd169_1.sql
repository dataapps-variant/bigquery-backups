-- job_id: script_job_db093c18804cbcbf5606bd987facd169_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:53:44.755000+00:00
-- started: 2026-07-30T10:53:44.803000+00:00
-- ended: 2026-07-30T10:53:44.961000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
