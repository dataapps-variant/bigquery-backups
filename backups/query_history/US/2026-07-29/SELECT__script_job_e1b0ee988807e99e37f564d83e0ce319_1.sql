-- job_id: script_job_e1b0ee988807e99e37f564d83e0ce319_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:07:35.341000+00:00
-- started: 2026-07-29T14:07:35.415000+00:00
-- ended: 2026-07-29T14:07:35.606000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
