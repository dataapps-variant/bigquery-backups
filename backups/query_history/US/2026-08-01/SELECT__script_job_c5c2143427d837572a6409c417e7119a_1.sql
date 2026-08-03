-- job_id: script_job_c5c2143427d837572a6409c417e7119a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.727000+00:00
-- started: 2026-08-01T08:45:05.779000+00:00
-- ended: 2026-08-01T08:45:05.956000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
