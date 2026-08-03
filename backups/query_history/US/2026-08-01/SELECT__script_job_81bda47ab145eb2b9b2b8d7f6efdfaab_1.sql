-- job_id: script_job_81bda47ab145eb2b9b2b8d7f6efdfaab_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:07.727000+00:00
-- started: 2026-08-01T09:15:07.799000+00:00
-- ended: 2026-08-01T09:15:07.988000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
