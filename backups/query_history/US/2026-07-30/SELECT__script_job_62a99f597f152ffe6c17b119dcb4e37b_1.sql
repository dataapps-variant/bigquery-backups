-- job_id: script_job_62a99f597f152ffe6c17b119dcb4e37b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T11:00:42.078000+00:00
-- started: 2026-07-30T11:00:42.184000+00:00
-- ended: 2026-07-30T11:00:42.697000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
