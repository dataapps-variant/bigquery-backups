-- job_id: script_job_21003d3b1563a084d6ed069d7f75f86a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:16:07.687000+00:00
-- started: 2026-07-30T10:16:07.779000+00:00
-- ended: 2026-07-30T10:16:07.980000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
