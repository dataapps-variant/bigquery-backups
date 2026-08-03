-- job_id: script_job_1fc05899967ac4da2c4aee934fbf0052_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:12:30.932000+00:00
-- started: 2026-07-29T10:12:31.005000+00:00
-- ended: 2026-07-29T10:12:31.221000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
