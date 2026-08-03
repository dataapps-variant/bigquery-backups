-- job_id: script_job_45358f2cb98c338bb7621b8fe6adee7f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:16:25.490000+00:00
-- started: 2026-07-28T18:16:25.561000+00:00
-- ended: 2026-07-28T18:16:25.786000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
