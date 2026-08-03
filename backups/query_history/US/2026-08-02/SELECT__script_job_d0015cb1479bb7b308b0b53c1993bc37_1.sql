-- job_id: script_job_d0015cb1479bb7b308b0b53c1993bc37_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:12.819000+00:00
-- started: 2026-08-02T08:45:12.909000+00:00
-- ended: 2026-08-02T08:45:13.157000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
