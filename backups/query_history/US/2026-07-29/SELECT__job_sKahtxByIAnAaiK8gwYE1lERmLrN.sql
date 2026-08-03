-- job_id: job_sKahtxByIAnAaiK8gwYE1lERmLrN
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:28:29.231000+00:00
-- started: 2026-07-29T18:28:29.341000+00:00
-- ended: 2026-07-29T18:28:29.842000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
