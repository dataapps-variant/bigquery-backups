-- job_id: script_job_3bfbb333c240cc06fedd1020cf098837_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:07:54.584000+00:00
-- started: 2026-07-28T18:07:54.641000+00:00
-- ended: 2026-07-28T18:07:54.848000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM`variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
)).*;
