-- job_id: script_job_16d8806873cc3ce3d6efd71b129e5542_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:28:17.895000+00:00
-- started: 2026-07-28T18:28:17.971000+00:00
-- ended: 2026-07-28T18:28:18.182000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
