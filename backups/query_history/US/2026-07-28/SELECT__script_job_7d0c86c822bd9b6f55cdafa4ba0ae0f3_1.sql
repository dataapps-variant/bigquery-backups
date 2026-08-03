-- job_id: script_job_7d0c86c822bd9b6f55cdafa4ba0ae0f3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:26:40.268000+00:00
-- started: 2026-07-28T18:26:40.365000+00:00
-- ended: 2026-07-28T18:26:40.570000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
)).*;
