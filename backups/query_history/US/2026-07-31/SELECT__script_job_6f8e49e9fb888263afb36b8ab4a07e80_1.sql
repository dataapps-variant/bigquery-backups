-- job_id: script_job_6f8e49e9fb888263afb36b8ab4a07e80_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.534000+00:00
-- started: 2026-07-31T08:45:06.590000+00:00
-- ended: 2026-07-31T08:45:06.937000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
