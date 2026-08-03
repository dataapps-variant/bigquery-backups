-- job_id: job_cH5VvgaFXnA_yQa_69pM5UI04fMV
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:07:49.840000+00:00
-- started: 2026-07-29T19:07:49.939000+00:00
-- ended: 2026-07-29T19:07:50.420000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
