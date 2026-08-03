-- job_id: bquxjob_4ceccbbb_19fb77bc9cf
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T09:22:51.633000+00:00
-- started: 2026-07-31T09:22:51.708000+00:00
-- ended: 2026-07-31T09:23:08.410000+00:00

-- =====================================================================
-- PHASE 0  --  PRE-FLIGHT          [UPDATED with real schema]
-- =====================================================================
-- PREREQUISITE : none
-- COST         : essentially nothing
-- GATES        : 0.2 (region) and 0.3 (row count) are go/no-go
--
-- 0.1 IS DONE. Confirmed schema:
--     split column   : acquisition_date   (DATE -- no cast needed)
--     label          : bc4_net_ltv        (FLOAT)
--     maturity flag  : is_bc4_mature      (BOOLEAN -- "= TRUE" works)
--     organic flag   : is_organic         (BOOLEAN)
--     WARNING        : afid_channel is INTEGER and MUST be cast to
--                      STRING or BQML treats it as a quantity.
--
-- Run 0.2, 0.3, 0.4, 0.6, 0.7. Skip 0.5 if you already know your IAM.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 0.2  GATE -- which physical region does the dataset live in?
-- ---------------------------------------------------------------------
SELECT schema_name, location
FROM `variant-finance-data-project.INFORMATION_SCHEMA.SCHEMATA`
WHERE schema_name = 'Cohort_Hunter';

-- BOOSTED_TREE training is NOT supported in every BigQuery ML region.
-- Check the returned location against Google's BigQuery ML locations list.
--
-- GATE:
--   supported     -> full path available
--   NOT supported -> Phase 5 is off. Stop at Phase 3 with the linear
--                    model. That is still a real result.


-- ---------------------------------------------------------------------
-- 0.3  GATE -- how much trainable data is there, over what window?
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                    AS total_rows,
  COUNTIF(is_bc4_mature)                      AS mature_rows,
  COUNTIF(is_bc4_mature
          AND NOT is_organic
          AND bc4_net_ltv IS NOT NULL)        AS trainable_rows,
  MIN(acquisition_date)                       AS earliest_acq,
  MAX(acquisition_date)                       AS latest_acq,
  COUNTIF(acquisition_date IS NULL)           AS null_acq_dates
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`;

-- GATE on trainable_rows:
--   >= 20,000       -> full path, all phases
--   5,000 - 20,000  -> proceed, expect modest gains from the tree
--   1,000 - 5,000   -> linear model only. Skip Phase 5.
--   < 1,000         -> STOP. Deliverable 2 (lift + significance) is the
--                      better instrument. That is a finding, not a failure.


-- ---------------------------------------------------------------------
-- 0.4  Is the label sane, or dominated by outliers?
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                        AS n,
  ROUND(AVG(bc4_net_ltv), 2)                      AS mean_ltv,
  ROUND(STDDEV(bc4_net_ltv), 2)                   AS stddev_ltv,
  ROUND(MIN(bc4_net_ltv), 2)                      AS min_ltv,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(1)]   AS p01,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(25)]  AS p25,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(50)]  AS median,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(75)]  AS p75,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(99)]  AS p99,
  ROUND(MAX(bc4_net_ltv), 2)                      AS max_ltv,
  COUNTIF(bc4_net_ltv < 0)                        AS negative_ltv_rows
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL;

-- max_ltv far above p99  -> a few whales dominate the error.
--                           Consider capping at p99 in Phase 1.
-- many negatives         -> expected given refunds/chargebacks, but
--                           confirm the sign convention is what you think.
-- stddev >> mean         -> hard problem. Set expectations before
--                           showing anyone an R2.


-- ---------------------------------------------------------------------
-- 0.5  Can you create models here?  (skip if you already know)
-- ---------------------------------------------------------------------
CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.zz_permission_test`
OPTIONS(MODEL_TYPE = 'LINEAR_REG', INPUT_LABEL_COLS = ['y']) AS
SELECT x, x * 2.0 + 1 AS y
FROM UNNEST(GENERATE_ARRAY(1, 100)) AS x;

DROP MODEL `variant-finance-data-project.Cohort_Hunter.zz_permission_test`;


-- ---------------------------------------------------------------------
-- 0.6  NEW -- how is bc4_net_ltv actually constructed?
--      This decides whether cac can ever be a feature.
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                                          AS total,
  COUNTIF(ABS(bc4_net_ltv - (cum_net_arpu_thru_bc4 - cac)) < 0.01)  AS matches_arpu_minus_cac,
  COUNTIF(ABS(bc4_net_ltv - cum_net_arpu_thru_bc4) < 0.01)          AS matches_arpu_only,
  COUNTIF(cac IS NULL)                                              AS null_cac
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL;

-- HOW TO READ IT:
--   matches_arpu_minus_cac ~= total
--       -> the label IS revenue minus CAC. Do NOT use cac as a feature;
--          you would be handing the model half of its own answer.
--          (This is the assumption baked into Phase 1.)
--
--   matches_arpu_only ~= total
--       -> the label is gross revenue, CAC is separate. cac becomes a
--          legitimate and probably strong feature. Tell me and I will
--          add it to the view.
--
--   neither matches
--       -> there is a third component. Find out what before modelling.


-- ---------------------------------------------------------------------
-- 0.7  NEW -- cardinality check.
--      Decides TARGET_ENCODING, and whether bin/afid/campaign_id are usable.
-- ---------------------------------------------------------------------
SELECT
  COUNT(DISTINCT entity_name)               AS n_entity,
  COUNT(DISTINCT app_name)                  AS n_app,
  COUNT(DISTINCT product_name_final_merged) AS n_product,
  COUNT(DISTINCT trial_type)                AS n_trial_type,
  COUNT(DISTINCT afid_channel)              AS n_afid_channel,
  COUNT(DISTINCT spend_country_code_afid)   AS n_country,
  COUNT(DISTINCT payment)                   AS n_payment,
  COUNT(DISTINCT gateway_id)                AS n_gateway,
  COUNT(DISTINCT dow_bc0)                   AS n_dow,
  COUNT(DISTINCT bin)                       AS n_bin,
  COUNT(DISTINCT afid)                      AS n_afid,
  COUNT(DISTINCT campaign_id)               AS n_campaign
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic;

-- RULES OF THUMB:
--   any column > 100 distinct   -> keep CATEGORY_ENCODING_METHOD =
--                                  'TARGET_ENCODING' in Phase 5
--   all columns < 20 distinct   -> remove that option, use the default
--   bin / afid / campaign_id
--     under a few hundred       -> safe to add as Tier 2 features
--     in the thousands          -> add ONE at a time and check whether
--                                  MAE actually improves. High-cardinality
--                                  IDs are the classic way to overfit.


-- ---------------------------------------------------------------------
-- 0.8  OPEN QUESTION -- answer this before Phase 1
-- ---------------------------------------------------------------------
-- decline_reason_category and fault_category:
--   are they scoped to the BC0 transaction only, or do they reflect the
--   subscription's whole life?
--
--   BC0-only  -> legitimate, and probably two of your strongest features
--   lifetime  -> LEAKAGE. A decline recorded at BC3 cannot be known when
--                you are predicting BC4 LTV from acquisition.
--
-- Until you know, they stay out of the model. Check the procedure that
-- populates User_Feature_Wide.
