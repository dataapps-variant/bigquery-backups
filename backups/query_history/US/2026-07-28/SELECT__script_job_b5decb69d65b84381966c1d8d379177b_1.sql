-- job_id: script_job_b5decb69d65b84381966c1d8d379177b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:34:19.184000+00:00
-- started: 2026-07-28T18:34:19.257000+00:00
-- ended: 2026-07-28T18:34:19.484000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
