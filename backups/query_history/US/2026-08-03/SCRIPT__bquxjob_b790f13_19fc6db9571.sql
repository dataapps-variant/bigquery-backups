-- job_id: bquxjob_b790f13_19fc6db9571
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T09:01:47.713000+00:00
-- started: 2026-08-03T09:01:47.762000+00:00
-- ended: 2026-08-03T09:01:49.878000+00:00

DECLARE eval_cutoff DATE;
SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

WITH holdout AS (
  SELECT
    entity_name, app_name, product_name_final_merged, trial_type, is_nt,
    CAST(afid_channel AS STRING) AS afid_channel,
    spend_country_code_afid, payment, gateway_id, dow_bc0,
    CAST(month_bc0 AS STRING) AS month_bc0,
    retry_bc0, acquisition_date, cac, bc4_net_ltv AS actual
  FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
  WHERE is_bc4_mature AND NOT is_organic
    AND bc4_net_ltv IS NOT NULL AND cac IS NOT NULL
    AND acquisition_date > eval_cutoff
)
SELECT
  ROUND(MIN(predicted_bc4_net_ltv), 1)                                AS pred_min,
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(1)], 1)   AS pred_p01,
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(50)], 1)  AS pred_median,
  ROUND(APPROX_QUANTILES(predicted_bc4_net_ltv, 100)[OFFSET(99)], 1)  AS pred_p99,
  ROUND(MAX(predicted_bc4_net_ltv), 1)                                AS pred_max
FROM ML.PREDICT(
  MODEL `variant-finance-data-project.Cohort_Hunter.ltv_bc4_linear_v1`,
  (SELECT * FROM holdout));
