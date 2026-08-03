-- job_id: script_job_9fb952583b56b078beb7ce37760810d4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.737000+00:00
-- started: 2026-07-31T08:45:04.821000+00:00
-- ended: 2026-07-31T08:45:05.040000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
)).*;
