-- job_id: script_job_5fa538045b1848254dbb69508a00e1ff_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:00:17.311000+00:00
-- started: 2026-08-03T09:00:17.444000+00:00
-- ended: 2026-08-03T09:00:17.754000+00:00

SELECT STRUCT<DATE>((
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
)).*;
