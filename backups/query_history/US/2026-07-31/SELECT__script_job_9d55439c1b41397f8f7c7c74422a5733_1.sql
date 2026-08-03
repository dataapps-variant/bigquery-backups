-- job_id: script_job_9d55439c1b41397f8f7c7c74422a5733_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.178000+00:00
-- started: 2026-07-31T08:45:05.273000+00:00
-- ended: 2026-07-31T08:45:05.492000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
