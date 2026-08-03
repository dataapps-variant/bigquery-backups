-- job_id: script_job_b459194b227625c0bf3b66d1f17b9746_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:05.482000+00:00
-- started: 2026-08-02T09:15:05.551000+00:00
-- ended: 2026-08-02T09:15:05.775000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
