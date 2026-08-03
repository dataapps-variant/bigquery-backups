-- job_id: script_job_e516a6a449b8fd3ad4aa42c339816f28_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:05.395000+00:00
-- started: 2026-08-03T08:45:05.476000+00:00
-- ended: 2026-08-03T08:45:05.688000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
