-- job_id: script_job_0f507539a5d6136c51ad8d13717b4697_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:05.027000+00:00
-- started: 2026-08-01T09:15:05.108000+00:00
-- ended: 2026-08-01T09:15:05.274000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
