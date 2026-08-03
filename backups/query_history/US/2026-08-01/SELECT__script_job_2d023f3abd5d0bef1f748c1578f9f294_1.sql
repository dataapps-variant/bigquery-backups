-- job_id: script_job_2d023f3abd5d0bef1f748c1578f9f294_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:07.520000+00:00
-- started: 2026-08-01T08:45:07.609000+00:00
-- ended: 2026-08-01T08:45:07.818000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_AFID`
)).*;
