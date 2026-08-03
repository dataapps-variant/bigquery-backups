-- job_id: bquxjob_6baa9fef_19fc6da3349
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-03T09:00:17.149000+00:00
-- started: 2026-08-03T09:00:17.198000+00:00
-- ended: 2026-08-03T09:00:19.772000+00:00

DECLARE eval_cutoff DATE;

SET eval_cutoff = (
  SELECT APPROX_QUANTILES(acquisition_date, 100)[OFFSET(80)]
  FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
);

WITH
train AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date <= eval_cutoff
),
eval AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date > eval_cutoff
),
product_avg AS (
  SELECT product_name_final_merged, AVG(bc4_net_ltv) AS avg_ltv
  FROM train GROUP BY 1
),
global_avg AS (
  SELECT AVG(bc4_net_ltv) AS g FROM train
)
SELECT
  eval_cutoff                                   AS split_date,
  (SELECT COUNT(*) FROM train)                  AS train_rows,
  COUNT(*)                                      AS eval_rows,
  ROUND(AVG(ABS(e.bc4_net_ltv - (SELECT g FROM global_avg))), 3)
                                                AS baseline_global_mae,
  ROUND(AVG(ABS(e.bc4_net_ltv
        - COALESCE(p.avg_ltv, (SELECT g FROM global_avg)))), 3)
                                                AS baseline_product_mae
FROM eval e
LEFT JOIN product_avg p USING (product_name_final_merged);
