-- job_id: script_job_d241d0b4db73890e0b2204d2345c5f4e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:45:07.111000+00:00
-- started: 2026-07-28T18:45:07.214000+00:00
-- ended: 2026-07-28T18:45:07.433000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
