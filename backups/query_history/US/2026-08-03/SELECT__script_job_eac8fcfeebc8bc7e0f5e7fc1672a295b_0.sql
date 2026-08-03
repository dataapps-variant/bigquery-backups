-- job_id: script_job_eac8fcfeebc8bc7e0f5e7fc1672a295b_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:01:47.862000+00:00
-- started: 2026-08-03T09:01:48.044000+00:00
-- ended: 2026-08-03T09:01:48.656000+00:00

SELECT STRUCT<DATE>((
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
)).*;
