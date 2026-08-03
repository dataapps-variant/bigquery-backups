-- job_id: bquxjob_37323822_19fc6d85806
-- user: dataapps@variant.net
-- statement_type: CREATE_MODEL
-- created: 2026-08-03T08:58:15.484000+00:00
-- started: 2026-08-03T08:58:16.067000+00:00
-- ended: 2026-08-03T08:58:46.505000+00:00

-- 3.A  Model A: predict net LTV directly
CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.ltv_bc4_linear_v1`
OPTIONS(
  MODEL_TYPE               = 'LINEAR_REG',
  INPUT_LABEL_COLS         = ['bc4_net_ltv'],
  DATA_SPLIT_METHOD        = 'SEQ',
  DATA_SPLIT_COL           = 'acquisition_date',
  DATA_SPLIT_EVAL_FRACTION = 0.2,
  MAX_ITERATIONS           = 20,
  EARLY_STOP               = TRUE,
  ENABLE_GLOBAL_EXPLAIN    = TRUE
) AS
SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`;
