-- job_id: script_job_fc940fb03d44b03d28ffd5ee6b367660_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:15:07.237000+00:00
-- started: 2026-07-28T18:15:07.304000+00:00
-- ended: 2026-07-28T18:15:07.480000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
