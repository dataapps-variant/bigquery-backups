-- job_id: script_job_d338f94b8d1a4a425e8f9d248350b669_3
-- user: dataapps@variant.net
-- statement_type: CREATE_MODEL
-- created: 2026-07-31T09:22:56.592000+00:00
-- started: 2026-07-31T09:22:57.224000+00:00
-- ended: 2026-07-31T09:23:04.034000+00:00

CREATE OR REPLACE MODEL `variant-finance-data-project.Cohort_Hunter.zz_permission_test`
OPTIONS(MODEL_TYPE = 'LINEAR_REG', INPUT_LABEL_COLS = ['y']) AS
SELECT x, x * 2.0 + 1 AS y
FROM UNNEST(GENERATE_ARRAY(1, 100)) AS x
