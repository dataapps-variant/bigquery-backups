-- job_id: bquxjob_6c971e49_19fb769e626
-- user: dataapps@variant.net
-- statement_type: None
-- created: 2026-07-31T09:03:19.173000+00:00
-- started: 2026-07-31T09:03:19.190000+00:00
-- ended: 2026-07-31T09:03:19.190000+00:00


-- #####################################################################
-- PHASE 0  --  PRE-FLIGHT
-- Run all five. Nothing else runs until these pass.
-- #####################################################################
 
-- ---------------------------------------------------------------------
-- 0.1  What columns actually exist, and what type are they?
-- ---------------------------------------------------------------------
SELECT column_name, data_type, is_nullable
FROM `{{PROJECT}}.{{DATASET}}.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = '{{TABLE}}'
ORDER BY ordinal_position;
 
-- ACTION: write down the real names for:
--   - the 8 dimension columns
--   - the label            (expected: bc4_net_ltv)
--   - the maturity flag    (expected: is_bc4_mature)
--   - the organic flag     (expected: is_organic)
--   - the acquisition date (candidates: Date_of_Sale / Acquisition_Date_Time)
-- Correct the rest of this script before continuing.
 
 
-- ---------------------------------------------------------------------
-- 0.2  Which physical region does the dataset live in?
-- ---------------------------------------------------------------------
SELECT schema_name, location
FROM `{{PROJECT}}.INFORMATION_SCHEMA.SCHEMATA`
WHERE schema_name = '{{DATASET}}';
 
-- GATE: check this region against Google's list of regions that support
--       BOOSTED_TREE training. Boosted trees are NOT available everywhere.
--       If unsupported -> Phase 5 is off the table. You stop at Phase 3
--       with the linear model, which is still a genuine result.
 
 
-- ---------------------------------------------------------------------
-- 0.3  How much trainable data is there, and over what window?
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                             AS total_rows,
  COUNTIF(is_bc4_mature)                               AS mature_rows,
  COUNTIF(is_bc4_mature
          AND NOT is_organic
          AND bc4_net_ltv IS NOT NULL)                 AS trainable_rows,
  MIN({{DATE_COL}})                                    AS earliest_acq,
  MAX({{DATE_COL}})                                    AS latest_acq,
  COUNT(DISTINCT afid_channel)                         AS n_channels,
  COUNT(DISTINCT gateway_id)                           AS n_gateways,
  COUNT(DISTINCT product_name_final_merged)            AS n_products
FROM `{{PROJECT}}.{{DATASET}}.{{TABLE}}`;
 
-- GATE:
--   trainable_rows >= 20,000 -> full path, all phases
--   trainable_rows  5,000-20,000 -> proceed, but expect boosted tree
--                                   gains over linear to be modest
--   trainable_rows  1,000-5,000  -> linear model only. Skip Phase 5.
--   trainable_rows  < 1,000      -> STOP. Not enough signal.
--                                   Deliverable 2 (lift + significance)
--                                   remains the better tool.
--
-- ALSO NOTE: if n_channels or n_gateways is in the hundreds, revisit
--            CATEGORY_ENCODING_METHOD in Phase 5.
 
 
-- ---------------------------------------------------------------------
-- 0.4  Is the label sane, or is it full of outliers?
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                        AS n,
  ROUND(AVG(bc4_net_ltv), 2)                      AS mean_ltv,
  ROUND(STDDEV(bc4_net_ltv), 2)                   AS stddev_ltv,
  MIN(bc4_net_ltv)                                AS min_ltv,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(1)]   AS p01,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(25)]  AS p25,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(50)]  AS median,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(75)]  AS p75,
  APPROX_QUANTILES(bc4_net_ltv, 100)[OFFSET(99)]  AS p99,
  MAX(bc4_net_ltv)                                AS max_ltv,
  COUNTIF(bc4_net_ltv < 0)                        AS negative_ltv_rows
FROM `{{PROJECT}}.{{DATASET}}.{{TABLE}}`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL;
 
-- WHAT TO LOOK FOR:
--   - max_ltv wildly above p99  -> a handful of whales will dominate the
--     model's error. Consider capping at p99 in the training view.
--   - negative_ltv_rows large   -> heavy refunds/chargebacks. Expected in
--     your data, but confirm the sign convention is what you think it is.
--   - stddev >> mean            -> a hard prediction problem. Set
--     expectations accordingly before showing anyone an R-squared.
 
 
-- ---------------------------------------------------------------------
-- 0.5  Do you have permission to create models here?
-- ---------------------------------------------------------------------
-- Simplest test: try to create and drop a throwaway model.
CREATE OR REPLACE MODEL `{{PROJECT}}.{{DATASET}}.zz_permission_test`
OPTIONS(MODEL_TYPE = 'LINEAR_REG', INPUT_LABEL_COLS = ['y']) AS
SELECT 1 AS x, 1.0 AS y UNION ALL
SELECT 2 AS x, 2.0 AS y UNION ALL
SELECT 3 AS x, 3.1 AS y UNION ALL
SELECT 4 AS x, 3.9 AS y;
 
DROP MODEL `{{PROJECT}}.{{DATASET}}.zz_permission_test`;
 
-- If this fails you are missing bigquery.models.create. Fix IAM first.
-- If it succeeds, BQML works in your project. Costs approximately nothing.
 
-- >>> STOP HERE. Report the results of 0.1 - 0.4 before continuing. <<<
 
 
 
-- #####################################################################
-- PHASE 1  --  THE TRAINING VIEW
-- One definition of the training set. Everything downstream reads this.
-- #####################################################################
 
CREATE OR REPLACE VIEW `{{PROJECT}}.{{DATASET}}.v_ltv_training` AS
SELECT
  -- the 8 dimensions (features)
  entity_name,
  app_name,
  product_name_final_merged,
  trial_type,
  afid_channel,
  spend_country_code_afid,
  payment,
  gateway_id,
 
  -- the split column: must be a DATE, must be acquisition-time
  DATE({{DATE_COL}})            AS acq_date,
 
  -- the label
  bc4_net_ltv
FROM `{{PROJECT}}.{{DATASET}}.{{TABLE}}`
WHERE is_bc4_mature   = TRUE      -- only outcomes that have actually matured
  AND NOT is_organic              -- paid only; organic has no CAC, different economics
  AND bc4_net_ltv IS NOT NULL
  AND {{DATE_COL}} IS NOT NULL;   -- SEQ split cannot handle a null split column
