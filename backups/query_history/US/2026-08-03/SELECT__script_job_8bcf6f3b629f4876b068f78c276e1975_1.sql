-- job_id: script_job_8bcf6f3b629f4876b068f78c276e1975_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:07.540000+00:00
-- started: 2026-08-03T08:45:07.612000+00:00
-- ended: 2026-08-03T08:45:08.100000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
)).*;
