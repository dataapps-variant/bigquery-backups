-- job_id: job__h5o86Nk0VT-Vry900JxnCs-g6uX
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:51:48.033000+00:00
-- started: 2026-07-27T14:51:48.165000+00:00
-- ended: 2026-07-27T14:51:48.805000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
