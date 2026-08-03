-- job_id: script_job_39931ea7606ad15b4e816901078754a0_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:05.444000+00:00
-- started: 2026-07-31T09:15:05.524000+00:00
-- ended: 2026-07-31T09:15:06.009000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
