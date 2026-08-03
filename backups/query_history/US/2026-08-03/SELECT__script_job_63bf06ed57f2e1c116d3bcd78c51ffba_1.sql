-- job_id: script_job_63bf06ed57f2e1c116d3bcd78c51ffba_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:29:42.391000+00:00
-- started: 2026-08-03T08:29:42.558000+00:00
-- ended: 2026-08-03T08:29:43.611000+00:00

WITH
train AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date <= eval_cutoff
),
holdout AS (
  SELECT * FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`
  WHERE acquisition_date > eval_cutoff
)

SELECT 'product_name_final_merged' AS feature,
       COUNT(*)                                        AS holdout_rows,
       COUNTIF(t.v IS NULL)                            AS unseen_rows,
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2) AS pct_unseen
FROM holdout h
LEFT JOIN (SELECT DISTINCT product_name_final_merged AS v FROM train) t
  ON h.product_name_final_merged = t.v

UNION ALL
SELECT 'gateway_id',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT gateway_id AS v FROM train) t
  ON h.gateway_id = t.v

UNION ALL
SELECT 'afid_channel',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT afid_channel AS v FROM train) t
  ON h.afid_channel = t.v

UNION ALL
SELECT 'trial_type',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT trial_type AS v FROM train) t
  ON h.trial_type = t.v

UNION ALL
SELECT 'app_name',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT app_name AS v FROM train) t
  ON h.app_name = t.v

UNION ALL
SELECT 'spend_country_code_afid',
       COUNT(*), COUNTIF(t.v IS NULL),
       ROUND(100 * COUNTIF(t.v IS NULL) / COUNT(*), 2)
FROM holdout h
LEFT JOIN (SELECT DISTINCT spend_country_code_afid AS v FROM train) t
  ON h.spend_country_code_afid = t.v

ORDER BY pct_unseen DESC
