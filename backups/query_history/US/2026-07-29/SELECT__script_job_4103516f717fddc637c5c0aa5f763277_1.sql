-- job_id: script_job_4103516f717fddc637c5c0aa5f763277_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:32:37.826000+00:00
-- started: 2026-07-29T10:32:37.883000+00:00
-- ended: 2026-07-29T10:32:38.067000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
)).*;
