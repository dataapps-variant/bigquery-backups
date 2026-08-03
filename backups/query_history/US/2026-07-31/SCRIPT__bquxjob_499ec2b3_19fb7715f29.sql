-- job_id: bquxjob_499ec2b3_19fb7715f29
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T09:11:28.821000+00:00
-- started: 2026-07-31T09:11:28.862000+00:00
-- ended: 2026-07-31T09:11:30.525000+00:00

-- =====================================================================
-- PHASE 0  --  PRE-FLIGHT
-- =====================================================================
-- PREREQUISITE : none
-- COST         : essentially nothing
-- TIME         : seconds
-- GATES        : 0.2 (region) and 0.3 (row count) are go/no-go
--
-- Run each block separately. Record the answers before moving on.
-- =====================================================================


-- ---------------------------------------------------------------------
-- 0.1  What columns actually exist, and what type are they?
--      RUN THIS FIRST. Every other file depends on the answer.
-- ---------------------------------------------------------------------
SELECT column_name, data_type, is_nullable
FROM `variant-finance-data-project.Cohort_Hunter.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'User_Feature_Wide'
ORDER BY ordinal_position;

-- WHAT TO LOOK FOR:
--   a) Exact spelling of the 8 dimensions:
--        entity_name, app_name, product_name_final_merged, trial_type,
--        afid_channel, spend_country_code_afid, payment, gateway_id
--   b) The label:          bc4_net_ltv
--   c) The maturity flag:  is_bc4_mature   -- AND CHECK ITS TYPE
--        BOOL   -> everything works as written
--        INT64  -> change  = TRUE  to  = 1  throughout
--        STRING -> change  = TRUE  to  = 'Y'  throughout
--   d) The organic flag:   is_organic      -- same type check
--   e) The acquisition date column. Candidates in your stack:
--        Date_of_Sale, Acquisition_Date_Time, acquisition_date
--
-- ZERO ROWS = wrong project or dataset, not an error.
--   Try variant-finance-data-net.


-- ---------------------------------------------------------------------
-- 0.2  GATE -- which physical region does the dataset live in?
-- ---------------------------------------------------------------------
SELECT schema_name, location
FROM `variant-finance-data-project.INFORMATION_SCHEMA.SCHEMATA`
WHERE schema_name = 'Cohort_Hunter';

-- WHY IT MATTERS:
--   BOOSTED_TREE training is NOT supported in every BigQuery ML region.
--   Check the returned location against Google's BigQuery ML locations
--   list before planning on Phase 5.
--
-- GATE:
--   supported     -> full path available
--   NOT supported -> Phase 5 is off the table. Stop at Phase 3 with the
--                    linear model. That is still a real result.


-- ---------------------------------------------------------------------
-- 0.3  GATE -- how much trainable data is there, over what window?
-- ---------------------------------------------------------------------
SELECT
  COUNT(*)                                    AS total_rows,
  COUNTIF(is_bc4_mature)                      AS mature_rows,
  COUNTIF(is_bc4_mature
          AND NOT is_organic
          AND bc4_net_ltv IS NOT NULL)        AS trainable_rows,
  MIN(Date_of_Sale)                           AS earliest_acq,   -- <<< EDIT
  MAX(Date_of_Sale)                           AS latest_acq,     -- <<< EDIT
  COUNT(DISTINCT afid_channel)                AS n_channels,
  COUNT(DISTINCT gateway_id)                  AS n_gateways,
  COUNT(DISTINCT product_name_final_merged)   AS n_products,
  COUNT(DISTINCT entity_name)                 AS n_entities
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`;

-- GATE on trainable_rows:
--   >= 20,000       -> full path, all phases
--   5,000 - 20,000  -> proceed, but expect the boosted tree to beat
--                      linear only modestly
--   1,000 - 5,000   -> linear model only. Skip Phase 5.
--   < 1,000         -> STOP. Not enough signal for a model.
--                      Deliverable 2 (lift + significance) is the better
--                      instrument. Write that up as the finding.
--
-- ALSO NOTE n_channels and n_gateways:
--   either in the hundreds -> keep TARGET_ENCODING in Phase 5
--   both under ~20         -> remove that option in Phase 5


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

-- WHAT TO LOOK FOR:
--   max_ltv far above p99  -> a few whales will dominate the error.
--                             Consider capping at p99 in Phase 1.
--   many negatives         -> expected given refunds and chargebacks,
--                             but confirm the sign convention.
--   stddev >> mean         -> genuinely hard problem. Set expectations
--                             before showing anyone an R2.


-- ---------------------------------------------------------------------
-- 0.5  Can you create models in this project at all?
--      Trains on 100 synthetic rows. Costs essentially nothing.
-- ---------------------------------------------------------------------
CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.zz_permission_test`
OPTIONS(MODEL_TYPE = 'LINEAR_REG', INPUT_LABEL_COLS = ['y']) AS
SELECT x, x * 2.0 + 1 AS y
FROM UNNEST(GENERATE_ARRAY(1, 100)) AS x;

-- then clean up:
DROP MODEL `variant-finance-data-project.Cohort_Hunter.zz_permission_test`;

-- Permission error -> you are missing bigquery.models.create.
-- You need BigQuery Data Editor or equivalent, not just read access.


-- >>> STOP. Record 0.1 - 0.4 before opening Phase 1. <<<
