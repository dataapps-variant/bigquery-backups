-- job_id: job_bwfy60UL4N37GzqlOkGdeD04NIjX
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:55:35.053000+00:00
-- started: 2026-08-03T11:55:35.116000+00:00
-- ended: 2026-08-03T11:55:35.497000+00:00

SELECT Input_ID, Channel_Bucket, spend_date, SUM(spend_usd) AS spend
   FROM `variant-finance-data-project.R100.R100_Historical_Spend`
   WHERE spend_date IS NOT NULL
   GROUP BY Input_ID, Channel_Bucket, spend_date
