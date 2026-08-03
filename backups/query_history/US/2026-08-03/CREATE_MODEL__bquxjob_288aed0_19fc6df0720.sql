-- job_id: bquxjob_288aed0_19fc6df0720
-- user: dataapps@variant.net
-- statement_type: CREATE_MODEL
-- created: 2026-08-03T09:05:33.528000+00:00
-- started: 2026-08-03T09:05:34.223000+00:00
-- ended: 2026-08-03T09:06:10.761000+00:00

CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.arpu_bc4_linear_v2`
OPTIONS(
  MODEL_TYPE               = 'LINEAR_REG',
  INPUT_LABEL_COLS         = ['cum_net_arpu_thru_bc4'],
  DATA_SPLIT_METHOD        = 'SEQ',
  DATA_SPLIT_COL           = 'acquisition_date',
  DATA_SPLIT_EVAL_FRACTION = 0.2,
  L2_REG                   = 10.0,
  CATEGORY_ENCODING_METHOD = 'DUMMY_ENCODING',
  MAX_ITERATIONS           = 20,
  EARLY_STOP               = TRUE,
  ENABLE_GLOBAL_EXPLAIN    = TRUE
) AS
SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_arpu_training`;
