-- job_id: script_job_312f6e7198c808278f4f46273491dfd8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.588000+00:00
-- started: 2026-08-02T08:45:04.672000+00:00
-- ended: 2026-08-02T08:45:04.861000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
