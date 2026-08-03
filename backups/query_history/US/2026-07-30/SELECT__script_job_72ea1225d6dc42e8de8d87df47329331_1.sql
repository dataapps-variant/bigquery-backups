-- job_id: script_job_72ea1225d6dc42e8de8d87df47329331_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:10.140000+00:00
-- started: 2026-07-30T08:45:10.195000+00:00
-- ended: 2026-07-30T08:45:10.368000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
