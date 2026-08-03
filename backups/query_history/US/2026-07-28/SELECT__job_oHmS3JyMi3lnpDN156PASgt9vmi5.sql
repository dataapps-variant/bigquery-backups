-- job_id: job_oHmS3JyMi3lnpDN156PASgt9vmi5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:46:21.184000+00:00
-- started: 2026-07-28T13:46:21.283000+00:00
-- ended: 2026-07-28T13:46:21.689000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
