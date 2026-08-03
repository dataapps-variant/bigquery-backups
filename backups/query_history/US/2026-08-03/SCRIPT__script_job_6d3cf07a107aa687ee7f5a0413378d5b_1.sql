-- job_id: script_job_6d3cf07a107aa687ee7f5a0413378d5b_1
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T08:57:27.971000+00:00
-- started: 2026-08-03T08:57:28.070000+00:00
-- ended: 2026-08-03T08:57:28.070000+00:00

WITH
-- the held-out rows, with everything needed for both models plus truth
holdout AS (
  SELECT
    entity_name,
    app_name,
    product_name_final_merged,
    trial_type,
    is_nt,
    CAST(afid_channel AS STRING) AS afid_channel,
    spend_country_code_afid,
    payment,
    gateway_id,
    dow_bc0,
    CAST(month_bc0 AS STRING)    AS month_bc0,
    retry_bc0,
    acquisition_date,
    cac,                                    -- passes through ML.PREDICT
    bc4_net_ltv           AS actual_net_ltv,
    cum_net_arpu_thru_bc4 AS actual_arpu
  FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
  WHERE is_bc4_mature = TRUE
    AND NOT is_organic
    AND bc4_net_ltv IS NOT NULL
    AND cac IS NOT NULL
    AND acquisition_date > eval_cutoff
),

-- Model A: predicts net LTV directly
pred_a AS (
  SELECT
    actual_net_ltv,
    predicted_bc4_net_ltv AS pred_net_ltv
  FROM ML.PREDICT(
    MODEL `variant-finance-data-project.Cohort_Hunter.ltv_bc4_linear_v1`,
    (SELECT * EXCEPT(actual_arpu) FROM holdout)
  )
),

-- Model B: predicts ARPU, then we subtract the CAC we already know
pred_b AS (
  SELECT
    actual_net_ltv,
    predicted_cum_net_arpu_thru_bc4 - cac AS pred_net_ltv
  FROM ML.PREDICT(
    MODEL `variant-finance-data-project.Cohort_Hunter.arpu_bc4_linear_v1`,
    (SELECT * EXCEPT(actual_arpu) FROM holdout)
  )
),

-- the dumb baseline, for reference
base AS (
  SELECT
    actual_net_ltv,
    (SELECT AVG(bc4_net_ltv)
     FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
     WHERE acquisition_date <= eval_cutoff) AS pred_net_ltv
  FROM holdout
)

SELECT 'baseline (global mean)' AS model,
       COUNT(*)                                              AS n,
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3)     AS net_ltv_mae,
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3) AS net_ltv_rmse
FROM base
UNION ALL
SELECT 'A: predict net LTV',
       COUNT(*),
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3),
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3)
FROM pred_a
UNION ALL
SELECT 'B: predict ARPU minus known CAC',
       COUNT(*),
       ROUND(AVG(ABS(pred_net_ltv - actual_net_ltv)), 3),
       ROUND(SQRT(AVG(POW(pred_net_ltv - actual_net_ltv, 2))), 3)
FROM pred_b
ORDER BY net_ltv_mae
