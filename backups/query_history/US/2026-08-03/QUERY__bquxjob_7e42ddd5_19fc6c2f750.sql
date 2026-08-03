-- job_id: bquxjob_7e42ddd5_19fc6c2f750
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-08-03T08:34:54.608000+00:00
-- started: 2026-08-03T08:34:54.622000+00:00
-- ended: 2026-08-03T08:34:54.622000+00:00

-- =====================================================================
-- PHASE 4b  --  A/B TEST: net-LTV model vs ARPU-minus-CAC model
-- =====================================================================
-- PREREQUISITE : both Phase 3 models trained
-- COST         : cheap (two ML.PREDICT calls over the holdout)
--
-- THE ONLY FAIR COMPARISON. Both models are scored on the same held-out
-- rows, on the same target (actual net LTV), in the same units.
--
-- Model B's raw output is ARPU. It is converted with:
--       predicted_net_ltv = predicted_arpu - actual cac
-- which is legitimate because cac is known at acquisition. Phase 0.6
-- proved the identity holds exactly and 0.11 confirms cac is populated
-- for immature rows.
--
-- RUN AS ONE BLOCK -- DECLARE must lead the script.
-- =====================================================================

DECLARE eval_cutoff DATE;

-- Reproduce the SEQ split: the newest 20% of rows by acquisition_date
SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

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
ORDER BY net_ltv_mae;


-- ---------------------------------------------------------------------
-- HOW TO READ IT
-- ---------------------------------------------------------------------
--   B clearly beats A   -> expected. You replaced a predicted CAC with a
--                          known one. Take Model B forward into Phase 5
--                          and swap the model name in phases 5-8.
--
--   A and B are level    -> CAC is highly predictable from the
--                          dimensions anyway. Keep A: it is simpler,
--                          one model instead of a model plus arithmetic.
--
--   A beats B            -> surprising. Most likely the winsorisation on
--                          View A is flattering it by removing errors
--                          that View B still carries. Turn the
--                          winsorisation off and rerun before believing it.
--
--   NEITHER beats the baseline
--                        -> STOP. Do not run Phase 5. The twelve features
--                          do not carry enough signal at this grain.
--                          That is a real, reportable finding.


-- =====================================================================
-- 4b.2  SEEN vs UNSEEN PRODUCTS
-- =====================================================================
-- Phase 1b found 8.88% of holdout rows carry a product that never
-- appeared in training. Those rows have a structurally lower ceiling --
-- the model has literally no information about them.
--
-- Run this AFTER 4b.1. It splits the winning model's error into the
-- part that is the model's responsibility and the part that is product
-- churn. Report both, so a weak headline MAE gets attributed correctly.
--
-- SWAP THE MODEL NAME below to whichever won 4b.1.
--
-- RUN AS ONE BLOCK -- DECLARE must lead.
-- =====================================================================

DECLARE eval_cutoff DATE;

SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

WITH
seen_products AS (
  SELECT DISTINCT product_name_final_merged
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date <= eval_cutoff
),
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
scored AS (
  SELECT
    product_name_final_merged,
    actual_net_ltv,
    -- MODEL B version. For Model A, swap the model name and use
    -- predicted_bc4_net_ltv without the "- cac".
    predicted_cum_net_arpu_thru_bc4 - cac AS pred_net_ltv
  FROM ML.PREDICT(
    MODEL `variant-finance-data-project.Cohort_Hunter.arpu_bc4_linear_v1`,
    (SELECT * FROM holdout)
  )
)
SELECT
  CASE WHEN sp.product_name_final_merged IS NULL
       THEN 'unseen product (no training data)'
       ELSE 'seen product' END                          AS segment,
  COUNT(*)                                              AS n_rows,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2)      AS pct_of_holdout,
  ROUND(AVG(ABS(s.pred_net_ltv - s.actual_net_ltv)), 3) AS mae,
  ROUND(AVG(s.actual_net_ltv), 2)                       AS avg_actual,
  ROUND(AVG(s.pred_net_ltv), 2)                         AS avg_predicted
FROM scored s
LEFT JOIN seen_products sp USING (product_name_final_merged)
GROUP BY 1
ORDER BY 1;

-- HOW TO READ IT:
--   MAE similar in both segments
--       -> product identity was not carrying much signal anyway. The
--          8.88% is a non-issue; report the headline number as-is.
--   MAE much worse on unseen
--       -> as expected. Report the SEEN figure as the model's real
--          performance, and the unseen figure as the cost of product
--          churn. Then consider a coarser product grouping (family or
--          price band) that survives churn, as a Tier 2 improvement.
