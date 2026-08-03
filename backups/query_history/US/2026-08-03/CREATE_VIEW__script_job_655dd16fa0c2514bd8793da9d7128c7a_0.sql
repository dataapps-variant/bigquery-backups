-- job_id: script_job_655dd16fa0c2514bd8793da9d7128c7a_0
-- user: dataapps@variant.net
-- statement_type: CREATE_VIEW
-- created: 2026-08-03T08:04:59.638000+00:00
-- started: 2026-08-03T08:04:59.829000+00:00
-- ended: 2026-08-03T08:04:59.941000+00:00

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
  -- THESE CONSTANTS ARE STALE -- they came from the full 2022-2026
  -- population. Replace with net_ltv_p01 / net_ltv_p99 from Phase 0.12,
  -- which recomputes them on the 2024+ window.
  -- REMOVE the GREATEST/LEAST wrapper entirely if 0.10 showed the extreme
  -- tail is genuine refund behaviour rather than CAC allocation noise.
  GREATEST(LEAST(bc4_net_ltv, 123.40), -116.28)  AS bc4_net_ltv   -- <<< TUNE

FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND acquisition_date IS NOT NULL
  AND acquisition_date >= '2024-01-01'
