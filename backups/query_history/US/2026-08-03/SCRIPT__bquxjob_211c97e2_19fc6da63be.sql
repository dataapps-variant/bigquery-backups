-- job_id: bquxjob_211c97e2_19fc6da63be
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T09:00:29.586000+00:00
-- started: 2026-08-03T09:00:29.620000+00:00
-- ended: 2026-08-03T09:00:31.958000+00:00

DECLARE eval_cutoff DATE;

SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

WITH
holdout AS (
  SELECT
    entity_name, app_name, product_name_final_merged, trial_type, is_nt,
    CAST(afid_channel AS STRING) AS afid_channel,
    spend_country_code_afid, payment, gateway_id,
    dow_bc0,
    CAST(month_bc0 AS STRING)    AS month_bc0,
    retry_bc0, acquisition_date, cac,
    bc4_net_ltv                  AS actual_net_ltv
  FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
  WHERE is_bc4_mature = TRUE
    AND NOT is_organic
    AND bc4_net_ltv IS NOT NULL
    AND cac IS NOT NULL
    AND acquisition_date > eval_cutoff
),
pred_a AS (
  SELECT actual_net_ltv, predicted_bc4_net_ltv AS pred_net_ltv
  FROM ML.PREDICT(
    MODEL `variant-finance-data-project.Cohort_Hunter.ltv_bc4_linear_v1`,
    (SELECT * FROM holdout))
),
pred_b AS (
  SELECT actual_net_ltv,
         predicted_cum_net_arpu_thru_bc4 - cac AS pred_net_ltv
  FROM ML.PREDICT(
    MODEL `variant-finance-data-project.Cohort_Hunter.arpu_bc4_linear_v1`,
    (SELECT * FROM holdout))
),
base AS (
  SELECT actual_net_ltv,
         (SELECT AVG(bc4_net_ltv)
          FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
          WHERE acquisition_date <= eval_cutoff) AS pred_net_ltv
  FROM holdout
)
SELECT 'baseline (global mean)' AS model, COUNT(*) AS n,
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3)          AS mae,
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3) AS rmse
FROM base
UNION ALL
SELECT 'A: predict net LTV', COUNT(*),
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3),
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3)
FROM pred_a
UNION ALL
SELECT 'B: predict ARPU minus known CAC', COUNT(*),
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3),
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3)
FROM pred_b
ORDER BY mae;
