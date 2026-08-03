-- job_id: script_job_a7badfe3618e88344c7212f5db4372c1_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:31:24.036000+00:00
-- started: 2026-07-31T09:31:24.106000+00:00
-- ended: 2026-07-31T09:31:26.047000+00:00

SELECT
  EXTRACT(YEAR FROM acquisition_date)             AS yr,
  COUNT(*)                                        AS subs,
  ROUND(AVG(bc4_net_ltv), 2)                      AS avg_net_ltv,
  ROUND(AVG(cac), 2)                              AS avg_cac,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)            AS avg_arpu,
  ROUND(100 * COUNTIF(bc4_net_ltv > 0) / COUNT(*), 1) AS pct_profitable,
  COUNT(DISTINCT gateway_id)                      AS gateways,
  COUNT(DISTINCT product_name_final_merged)       AS products,
  COUNT(DISTINCT afid_channel)                    AS channels
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
GROUP BY 1
ORDER BY 1
