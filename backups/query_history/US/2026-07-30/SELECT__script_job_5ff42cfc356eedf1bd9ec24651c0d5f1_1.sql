-- job_id: script_job_5ff42cfc356eedf1bd9ec24651c0d5f1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:55:55.922000+00:00
-- started: 2026-07-30T10:55:56.010000+00:00
-- ended: 2026-07-30T10:55:56.217000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
