-- job_id: job_qkWinrWv4REEcohyZygua8ZujIp_
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:13:56.446000+00:00
-- started: 2026-07-28T13:13:56.525000+00:00
-- ended: 2026-07-28T13:13:57.906000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
