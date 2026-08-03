-- job_id: job_FBvto78pqujNS1Z2oT5YowMNsjdJ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:31:57.159000+00:00
-- started: 2026-08-03T12:31:57.247000+00:00
-- ended: 2026-08-03T12:31:57.758000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
