-- job_id: script_job_a24f9c6c4b526178e2e12211a6ea8003_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:07.186000+00:00
-- started: 2026-08-02T09:15:07.314000+00:00
-- ended: 2026-08-02T09:15:08.047000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
)).*;
