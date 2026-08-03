-- job_id: script_job_35212c94d9e2da4528b6404a74a11f58_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.629000+00:00
-- started: 2026-08-01T08:45:08.708000+00:00
-- ended: 2026-08-01T08:45:09.069000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
)).*;
