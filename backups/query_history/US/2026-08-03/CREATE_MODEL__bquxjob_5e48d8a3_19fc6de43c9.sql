-- job_id: bquxjob_5e48d8a3_19fc6de43c9
-- user: dataapps@variant.net
-- statement_type: CREATE_MODEL
-- created: 2026-08-03T09:04:43.493000+00:00
-- started: 2026-08-03T09:04:44.093000+00:00
-- ended: 2026-08-03T09:05:20.150000+00:00

CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.ltv_bc4_linear_v2`
OPTIONS(
  MODEL_TYPE               = 'LINEAR_REG',
  INPUT_LABEL_COLS         = ['bc4_net_ltv'],
  DATA_SPLIT_METHOD        = 'SEQ',
  DATA_SPLIT_COL           = 'acquisition_date',
  DATA_SPLIT_EVAL_FRACTION = 0.2,
  L2_REG                   = 10.0,
  CATEGORY_ENCODING_METHOD = 'DUMMY_ENCODING',
  MAX_ITERATIONS           = 20,
  EARLY_STOP               = TRUE,
  ENABLE_GLOBAL_EXPLAIN    = TRUE
) AS
SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`;
