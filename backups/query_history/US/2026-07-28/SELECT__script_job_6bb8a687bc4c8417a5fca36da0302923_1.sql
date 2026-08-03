-- job_id: script_job_6bb8a687bc4c8417a5fca36da0302923_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:50:29.552000+00:00
-- started: 2026-07-28T18:50:29.654000+00:00
-- ended: 2026-07-28T18:50:29.871000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
