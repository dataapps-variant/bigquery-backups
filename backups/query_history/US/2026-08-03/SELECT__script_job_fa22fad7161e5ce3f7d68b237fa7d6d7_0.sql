-- job_id: script_job_fa22fad7161e5ce3f7d68b237fa7d6d7_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:57:26.887000+00:00
-- started: 2026-08-03T08:57:27.072000+00:00
-- ended: 2026-08-03T08:57:27.753000+00:00

SELECT STRUCT<DATE>((
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
)).*;
