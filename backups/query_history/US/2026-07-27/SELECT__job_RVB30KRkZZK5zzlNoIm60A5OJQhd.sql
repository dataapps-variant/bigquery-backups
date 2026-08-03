-- job_id: job_RVB30KRkZZK5zzlNoIm60A5OJQhd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:48:29.057000+00:00
-- started: 2026-07-27T14:48:29.220000+00:00
-- ended: 2026-07-27T14:48:30.792000+00:00


  SELECT Input_ID, COUNT(*) n, ROUND(SUM(spend_usd)) total, MIN(spend_date) mn, MAX(spend_date) mx
  FROM `variant-finance-data-project.R100.R100_Historical_Spend`
  GROUP BY 1 ORDER BY 1 LIMIT 15
