-- job_id: script_job_e27addd0b7c8a015aa908d6461715ed3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:33:40.131000+00:00
-- started: 2026-08-03T08:33:40.244000+00:00
-- ended: 2026-08-03T08:33:41.054000+00:00

SELECT 'v_ltv_training' AS view_name,
       COUNT(*)                    AS rows_in_view,
       MIN(acquisition_date)       AS earliest,
       MAX(acquisition_date)       AS latest,
       ROUND(MIN(bc4_net_ltv), 2)  AS min_label,
       ROUND(MAX(bc4_net_ltv), 2)  AS max_label
FROM `variant-finance-data-project.Cohort_Hunter.v_ltv_training`

UNION ALL

SELECT 'v_arpu_training',
       COUNT(*),
       MIN(acquisition_date),
       MAX(acquisition_date),
       ROUND(MIN(cum_net_arpu_thru_bc4), 2),
       ROUND(MAX(cum_net_arpu_thru_bc4), 2)
FROM `variant-finance-data-project.Cohort_Hunter.v_arpu_training`
