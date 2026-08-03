-- job_id: script_job_1968f03bb85cc0443810e75f7dd71644_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:07.433000+00:00
-- started: 2026-07-31T08:45:07.545000+00:00
-- ended: 2026-07-31T08:45:07.754000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
