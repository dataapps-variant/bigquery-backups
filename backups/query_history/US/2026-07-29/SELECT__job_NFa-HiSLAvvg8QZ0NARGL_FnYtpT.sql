-- job_id: job_NFa-HiSLAvvg8QZ0NARGL_FnYtpT
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:14:57.743000+00:00
-- started: 2026-07-29T15:14:57.864000+00:00
-- ended: 2026-07-29T15:14:58.233000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
