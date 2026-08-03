-- job_id: job_1--Pom3Ydt_bhTM1AGMRkC_OSAnN
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:26:57.978000+00:00
-- started: 2026-07-29T09:26:58.063000+00:00
-- ended: 2026-07-29T09:26:58.516000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
