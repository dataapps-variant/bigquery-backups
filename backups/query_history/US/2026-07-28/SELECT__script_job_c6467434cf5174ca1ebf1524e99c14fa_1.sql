-- job_id: script_job_c6467434cf5174ca1ebf1524e99c14fa_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:50:57.362000+00:00
-- started: 2026-07-28T17:50:57.430000+00:00
-- ended: 2026-07-28T17:50:57.676000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
