-- job_id: script_job_57eae7e1d575628b0df60f53ebd94915_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:29:41.043000+00:00
-- started: 2026-08-03T08:29:41.360000+00:00
-- ended: 2026-08-03T08:29:42.128000+00:00

SELECT STRUCT<DATE>((
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
)).*;
