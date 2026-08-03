-- job_id: script_job_fa87f51e3c801dc98a81de06904415ba_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:08.005000+00:00
-- started: 2026-07-31T08:45:08.111000+00:00
-- ended: 2026-07-31T08:45:08.313000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
