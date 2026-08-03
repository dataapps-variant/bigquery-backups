-- job_id: bquxjob_426c713f_19fc6be2dba
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T08:29:40.882000+00:00
-- started: 2026-08-03T08:29:40.950000+00:00
-- ended: 2026-08-03T08:29:43.792000+00:00

-- =====================================================================
-- PHASE 1b  --  UNSEEN-CATEGORY CHECK
-- =====================================================================
-- PREREQUISITE : phase_1 views built
-- COST         : cheap
--
-- WHY THIS MATTERS:
--   0.9 showed products churn hard -- 7, 22, 11, 40, 23 per year against
--   161 distinct overall. Many products are short-lived.
--
--   With a TIME-BASED split, the holdout is the newest 20% of rows. If a
--   product, gateway or campaign launched after the split date, the model
--   has never seen it and has nothing useful to say about those rows.
--
--   That is not a bug -- it is the honest situation, and it is exactly
--   what happens in production too. But you need to know HOW MUCH of your
--   holdout is affected, because it puts a ceiling on achievable accuracy
--   and it changes how you read the Phase 4 metrics.
-- =====================================================================

DECLARE eval_cutoff DATE;

SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

WITH
train AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date <= eval_cutoff
),
holdout AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date > eval_cutoff
)

SELECT 'product_name_final_merged' AS feature,
       COUNT(*)                                        AS holdout_rows,
       COUNTIF(t.v IS NULL)                            AS unseen_rows,
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2) AS pct_unseen
FROM holdout h
LEFT JOIN (SELECT DISTINCT product_name_final_merged AS v FROM train) t
  ON h.product_name_final_merged = t.v

UNION ALL
SELECT 'gateway_id',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT gateway_id AS v FROM train) t
  ON h.gateway_id = t.v

UNION ALL
SELECT 'afid_channel',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT afid_channel AS v FROM train) t
  ON h.afid_channel = t.v

UNION ALL
SELECT 'trial_type',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT trial_type AS v FROM train) t
  ON h.trial_type = t.v

UNION ALL
SELECT 'app_name',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT app_name AS v FROM train) t
  ON h.app_name = t.v

UNION ALL
SELECT 'spend_country_code_afid',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT spend_country_code_afid AS v FROM train) t
  ON h.spend_country_code_afid = t.v

ORDER BY pct_unseen DESC;


-- ---------------------------------------------------------------------
-- HOW TO READ IT
-- ---------------------------------------------------------------------
--   pct_unseen under ~2% on every feature
--       -> fine. Proceed, ignore this.
--
--   pct_unseen 2-15% on product_name_final_merged
--       -> expected given the churn. The model will be weak on new
--          products specifically. Report your Phase 4 MAE with that
--          caveat, and consider reporting MAE separately for seen vs
--          unseen rows so the number is not blamed on the model.
--
--   pct_unseen above ~20% on any feature
--       -> serious. The holdout is largely a different population from
--          the training set and no model will score well. Options:
--            a) shorten the training window further so train and
--               holdout are closer in time
--            b) replace the raw product name with a coarser grouping
--               (product family, price band) that survives churn
--            c) accept a lower ceiling and say so up front
--
--   HIGH on gateway_id specifically
--       -> gateway migrations. Worth knowing regardless of the model;
--          it also affects your Daedalus routing work.
