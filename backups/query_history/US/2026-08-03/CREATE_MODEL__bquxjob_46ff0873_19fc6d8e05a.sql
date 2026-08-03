-- job_id: bquxjob_46ff0873_19fc6d8e05a
-- user: dataapps@variant.net
-- statement_type: CREATE_MODEL
-- created: 2026-08-03T08:58:50.350000+00:00
-- started: 2026-08-03T08:58:50.958000+00:00
-- ended: 2026-08-03T08:59:21.442000+00:00

-- 3.B  Model B: predict gross ARPU (CAC subtracted afterwards)
CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.arpu_bc4_linear_v1`
OPTIONS(
  MODEL_TYPE               = 'LINEAR_REG',
  INPUT_LABEL_COLS         = ['cum_net_arpu_thru_bc4'],
  DATA_SPLIT_METHOD        = 'SEQ',
  DATA_SPLIT_COL           = 'acquisition_date',
  DATA_SPLIT_EVAL_FRACTION = 0.2,
  MAX_ITERATIONS           = 20,
  EARLY_STOP               = TRUE,
  ENABLE_GLOBAL_EXPLAIN    = TRUE
) AS
SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_arpu_training`;
