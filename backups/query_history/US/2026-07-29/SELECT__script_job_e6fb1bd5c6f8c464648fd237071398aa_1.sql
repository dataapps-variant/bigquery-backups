-- job_id: script_job_e6fb1bd5c6f8c464648fd237071398aa_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T14:10:06.157000+00:00
-- started: 2026-07-29T14:10:06.232000+00:00
-- ended: 2026-07-29T14:10:06.425000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
