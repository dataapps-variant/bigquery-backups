-- job_id: script_job_7211d3a8b7c12bc6d70697e2a5bde42d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:07.609000+00:00
-- started: 2026-08-03T09:15:07.695000+00:00
-- ended: 2026-08-03T09:15:07.931000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
