-- job_id: script_job_0a317d6900e9f7fc10a8e12d5a505798_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:03:15.678000+00:00
-- started: 2026-07-30T10:03:15.793000+00:00
-- ended: 2026-07-30T10:03:16.010000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
