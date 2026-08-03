-- job_id: script_job_bb4aa07d93969e471cdb52422220036f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.311000+00:00
-- started: 2026-08-03T08:45:03.351000+00:00
-- ended: 2026-08-03T08:45:03.497000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
