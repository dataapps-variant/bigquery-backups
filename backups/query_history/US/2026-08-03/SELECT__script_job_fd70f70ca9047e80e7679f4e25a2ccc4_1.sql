-- job_id: script_job_fd70f70ca9047e80e7679f4e25a2ccc4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.257000+00:00
-- started: 2026-08-03T08:45:04.313000+00:00
-- ended: 2026-08-03T08:45:04.529000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
