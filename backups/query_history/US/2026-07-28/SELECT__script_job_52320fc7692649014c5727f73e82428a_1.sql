-- job_id: script_job_52320fc7692649014c5727f73e82428a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:37:16.162000+00:00
-- started: 2026-07-28T18:37:16.387000+00:00
-- ended: 2026-07-28T18:37:16.609000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
