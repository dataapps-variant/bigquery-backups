CREATE VIEW `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
AS SELECT
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
  AND acquisition_date >= '2024-01-01';
