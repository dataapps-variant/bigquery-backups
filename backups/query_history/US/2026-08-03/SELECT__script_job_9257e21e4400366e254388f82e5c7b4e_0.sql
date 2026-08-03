-- job_id: script_job_9257e21e4400366e254388f82e5c7b4e_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:00:29.706000+00:00
-- started: 2026-08-03T09:00:29.936000+00:00
-- ended: 2026-08-03T09:00:30.230000+00:00

SELECT STRUCT<DATE>((
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
)).*;
