-- job_id: script_job_81107a5d199f4732ec8684ba8bce4a07_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:13:11.518000+00:00
-- started: 2026-07-28T18:13:11.615000+00:00
-- ended: 2026-07-28T18:13:11.816000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
