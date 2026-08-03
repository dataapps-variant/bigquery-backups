-- job_id: script_job_874b3a6d16772234dc3aa0c90daf02e9_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:58:23.592000+00:00
-- started: 2026-07-30T10:58:23.656000+00:00
-- ended: 2026-07-30T10:58:23.792000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
