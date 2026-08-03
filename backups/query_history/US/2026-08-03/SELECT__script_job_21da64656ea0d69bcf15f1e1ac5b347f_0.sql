-- job_id: script_job_21da64656ea0d69bcf15f1e1ac5b347f_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:04:22.746000+00:00
-- started: 2026-08-03T08:04:22.838000+00:00
-- ended: 2026-08-03T08:04:23.746000+00:00

SELECT
  CASE
    WHEN bc4_net_ltv < -1000 THEN 'a. below -1000'
    WHEN bc4_net_ltv <  -500 THEN 'b. -1000 to -500'
    WHEN bc4_net_ltv <  -116 THEN 'c. -500 to -116'
    WHEN bc4_net_ltv <     0 THEN 'd. -116 to 0'
    ELSE                          'e. 0 and above'
  END                                              AS bucket,
  COUNT(*)                                         AS subs,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 3) AS pct_of_total,
  ROUND(AVG(cac), 2)                               AS avg_cac,
  ROUND(MAX(cac), 2)                               AS max_cac,
  ROUND(AVG(cum_net_arpu_thru_bc4), 2)             AS avg_arpu,
  ROUND(MIN(cum_net_arpu_thru_bc4), 2)             AS min_arpu
FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Wide`
WHERE is_bc4_mature = TRUE
  AND NOT is_organic
  AND bc4_net_ltv IS NOT NULL
  AND acquisition_date >= '2024-01-01'
GROUP BY 1
ORDER BY 1
