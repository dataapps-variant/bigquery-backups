-- job_id: script_job_9a10d317fa7ca59eb635b7b77d2272d0_1
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:01:09.322000+00:00
-- started: 2026-07-31T12:01:09.442000+00:00
-- ended: 2026-07-31T12:01:09.655000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
