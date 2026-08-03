-- job_id: script_job_5a176c3dadf8c9aee33e9536d4271f05_1
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:31:43.135000+00:00
-- started: 2026-07-31T11:31:43.256000+00:00
-- ended: 2026-07-31T11:31:43.447000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
