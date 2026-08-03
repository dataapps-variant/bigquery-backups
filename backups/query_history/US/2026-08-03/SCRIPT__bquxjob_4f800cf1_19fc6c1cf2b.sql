-- job_id: bquxjob_4f800cf1_19fc6c1cf2b
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T08:33:38.747000+00:00
-- started: 2026-08-03T08:33:38.839000+00:00
-- ended: 2026-08-03T08:33:41.237000+00:00

-- =====================================================================
-- PHASE 1  --  THE TRAINING VIEWS   [v3 -- informed by Phase 0 results]
-- =====================================================================
-- WHAT CHANGED AND WHY:
--
--   1. TRAINING WINDOW = 2024-01-01 onward.
--      0.9 showed 2019-2021 contribute ZERO trainable rows (all organic,
--      immature or null-labelled) -- the real data starts in 2022.
--      It also showed a STRUCTURAL BREAK between 2023 and 2024:
--          avg net LTV  -0.15 -> -5.30
--          channels          6 -> 11
--      2022-23 was a roughly break-even business; 2024+ is structurally
--      loss-making. Since acquisition_date is the split column it is
--      EXCLUDED from the features, so the model cannot learn "things got
--      worse" -- it would just average across two different regimes.
--      -> 2024-01-01 onward. ~2,092,682 rows. Plenty.
--
--   2. WINSORISATION. min LTV is -5,028 against a p01 of -116. Without
--      capping, a handful of rows dominate the error and every MAE you
--      report is distorted.
--      -> capped at p01/p99. REMOVE if 0.10 shows the tail is real.
--
--   3. TWO VIEWS, NOT ONE. Phase 0.6 proved
--          bc4_net_ltv = cum_net_arpu_thru_bc4 - cac
--      exactly, for all 2,451,199 rows, with zero null CACs. So there
--      are two ways to model this and one is probably better:
--          A) predict net LTV directly
--          B) predict ARPU, then subtract the CAC you already know
--      Build both. Phase 4b compares them on the same scale.
--
--   4. bin EXCLUDED. 22,677 distinct values is an overfitting trap.
--
--   5. afid_channel CAST TO STRING -- stored as INT64.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 1.0  VIEW A  --  label = net LTV  (the original design)
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW `variant-finance-data-project.Cohort_Hunter.v_ltv_training` AS
SELECT
  -- ---- acquisition attributes ----
  entity_name,
  app_name,
  product_name_final_merged,
  trial_type,
  is_nt,

  -- CRITICAL: stored as INT64. Without this cast BQML treats channel
  -- numbers as a QUANTITY -- as if channel 90 were "more" than channel 6.
  CAST(afid_channel AS STRING)  AS afid_channel,

  spend_country_code_afid,
  payment,
  gateway_id,

  -- ---- BC0 transaction attributes ----
  dow_bc0,
  CAST(month_bc0 AS STRING)     AS month_bc0,   -- category, not a quantity
  retry_bc0,                                    -- genuinely numeric: a count

  -- ---- split column (BQML excludes this from features automatically) ----
  acquisition_date,

  -- ---- label, winsorised ----
  -- CONSTANTS CONFIRMED from Phase 0.12 on the 2024+ window:
  --   p01 = -130.23   p99 = 134.39
  --
  -- WINSORISATION IS JUSTIFIED. Phase 0.10 proved the extreme tail is a
  -- CAC ALLOCATION ARTEFACT, not customer behaviour:
  --   bucket below -1000 : avg_cac 1,640.70 (max 5,030.44)
  --                        avg_arpu 20.94 -- completely NORMAL revenue
  --   bucket -1000..-500 : avg_cac   654.30
  --                        avg_arpu 14.99 -- also normal
  -- The revenue side is healthy in both. Only the cost side is broken.
  -- Left uncapped, ~731 mis-attributed rows would distort the squared
  -- loss that the regressor actually minimises.
  GREATEST(LEAST(bc4_net_ltv, 134.39), -130.23)  AS bc4_net_ltv

FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND acquisition_date IS NOT NULL
  AND acquisition_date >= '2024-01-01';                           -- <<< TUNE


-- ---------------------------------------------------------------------
-- 1.0b  VIEW B  --  label = gross ARPU  (predict revenue, subtract known CAC)
--       Identical features. Only the label differs.
-- ---------------------------------------------------------------------
CREATE OR REPLACE VIEW `variant-finance-data-project.Cohort_Hunter.v_arpu_training` AS
SELECT
  entity_name,
  app_name,
  product_name_final_merged,
  trial_type,
  is_nt,
  CAST(afid_channel AS STRING)  AS afid_channel,
  spend_country_code_afid,
  payment,
  gateway_id,
  dow_bc0,
  CAST(month_bc0 AS STRING)     AS month_bc0,
  retry_bc0,
  acquisition_date,

  -- label: the REVENUE side only. CAC is not predicted -- it is known.
  cum_net_arpu_thru_bc4

FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND cac IS NOT NULL
  AND acquisition_date IS NOT NULL
  AND acquisition_date >= '2024-01-01';                           -- <<< TUNE

-- NO WINSORISATION HERE, AND NONE IS NEEDED. Phase 0.12 confirmed ARPU
-- is naturally well-behaved on the 2024+ window:
--        ARPU        net LTV
--   p01  -0.18       -130.23
--   min  -33.58    -5,028.49
--   max  201.75       190.92
--
-- ARPU's floor is essentially zero. Net LTV's minimum is 150x further
-- out, and every bit of that excess is CAC.
--
-- THIS IS THE WHOLE ARGUMENT FOR MODEL B: it predicts the genuinely
-- uncertain quantity and subtracts a known one, instead of predicting a
-- target whose entire pathological tail comes from a term you already
-- have exactly.


-- ---------------------------------------------------------------------
-- 1.1  LEAKAGE AUDIT  --  your actual 46 columns, sorted
-- ---------------------------------------------------------------------
--
-- IN THE MODEL (all pass "known when the prediction is needed"):
--   entity_name, app_name, product_name_final_merged, trial_type,
--   is_nt, afid_channel, spend_country_code_afid, payment, gateway_id
--       -> fixed at signup
--   dow_bc0, month_bc0, retry_bc0
--       -> fixed once the BC0 charge settles
--
-- DELIBERATELY EXCLUDED, NOT LEAKAGE:
--   cac      -> known at acquisition, but 0.6 proved it is literally a
--               term of the label. Including it hands the model half its
--               own answer. It is USED in View B's design -- just
--               subtracted afterwards rather than learned.
--   is_organic -> filtered to FALSE, so it is constant. Zero variance,
--               zero information.
--   bin      -> 22,677 distinct values. Overfitting trap.
--               Revisit later as LEFT(bin, 2) for card network.
--
-- KNOWN LIMITATION (Phase 1b): 8.88% of holdout rows carry a product
-- that never appears in training. Products churn hard -- 161 distinct
-- overall, but only 11-40 active in any given year. Those rows have a
-- structurally lower accuracy ceiling and it is not the model's fault.
-- Phase 4b.2 measures the effect separately so it can be reported
-- honestly. Everything else is fine: gateway 0.04% unseen, channel and
-- country 0.00%.
--
-- ABSOLUTE LEAKAGE -- NEVER add:
--   cum_net_arpu_thru_bc4   <- the label's own revenue term (View A)
--   cycles_reached          <- the outcome restated
--   net_arpu_bc1 .. bc4     <- future revenue
--   retry_bc1 .. bc4        <- future events
--   refund_bc0 .. bc4       <- refunds land days to weeks later, incl. bc0
--   chargeback_bc0 .. bc4   <- chargebacks land 30-120 days later, incl. bc0
--   last_refreshed          <- pipeline metadata
--   sub_key                 <- a unique identifier; pure overfitting fuel
--
-- STILL PENDING A DECISION:
--   decline_reason_category, fault_category
--       BC0-scoped -> add them, probably strong
--       lifetime   -> leakage, keep out
--   Check the procedure that populates User_Feature_Wide.
--
-- TIER 2, add ONE AT A TIME after v1 works, keeping only what lowers MAE:
--   afid (313 distinct)  campaign_id (145)  day_of_month_bc0


-- ---------------------------------------------------------------------
-- 1.2  GATE -- sanity check both views
-- ---------------------------------------------------------------------
SELECT 'v_ltv_training' AS view_name,
       COUNT(*)                    AS rows_in_view,
       MIN(acquisition_date)       AS earliest,
       MAX(acquisition_date)       AS latest,
       ROUND(MIN(bc4_net_ltv), 2)  AS min_label,
       ROUND(MAX(bc4_net_ltv), 2)  AS max_label
FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`

UNION ALL

SELECT 'v_arpu_training',
       COUNT(*),
       MIN(acquisition_date),
       MAX(acquisition_date),
       ROUND(MIN(cum_net_arpu_thru_bc4), 2),
       ROUND(MAX(cum_net_arpu_thru_bc4), 2)
FROM `variant-finance-data-project.Cohort_Hunter.v_arpu_training`;

-- GATE:
--   both row counts should be identical (or within a rounding error --
--   View B additionally requires cac IS NOT NULL, which 0.6 showed is
--   never true, so they should match exactly)
--   min/max on View A should now be exactly -116.28 and 123.40 if the
--   winsorisation is working
