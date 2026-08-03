-- job_id: script_job_af4cdd66a589b8522cf9438774eee3a7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:06.659000+00:00
-- started: 2026-08-03T09:15:06.751000+00:00
-- ended: 2026-08-03T09:15:06.953000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
