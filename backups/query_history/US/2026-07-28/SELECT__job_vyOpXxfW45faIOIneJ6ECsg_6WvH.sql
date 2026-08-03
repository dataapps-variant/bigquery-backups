-- job_id: job_vyOpXxfW45faIOIneJ6ECsg_6WvH
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:13:39.132000+00:00
-- started: 2026-07-28T15:13:39.217000+00:00
-- ended: 2026-07-28T15:13:39.595000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
