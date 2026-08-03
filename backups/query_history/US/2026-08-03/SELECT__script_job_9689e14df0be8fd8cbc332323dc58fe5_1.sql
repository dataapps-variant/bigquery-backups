-- job_id: script_job_9689e14df0be8fd8cbc332323dc58fe5_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.175000+00:00
-- started: 2026-08-03T08:45:03.228000+00:00
-- ended: 2026-08-03T08:45:03.380000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
