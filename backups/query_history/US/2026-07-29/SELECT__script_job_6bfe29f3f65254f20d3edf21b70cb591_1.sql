-- job_id: script_job_6bfe29f3f65254f20d3edf21b70cb591_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.657000+00:00
-- started: 2026-07-29T08:45:07.750000+00:00
-- ended: 2026-07-29T08:45:07.956000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
