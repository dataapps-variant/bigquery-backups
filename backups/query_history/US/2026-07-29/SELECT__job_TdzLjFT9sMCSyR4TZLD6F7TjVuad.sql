-- job_id: job_TdzLjFT9sMCSyR4TZLD6F7TjVuad
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:07:29.031000+00:00
-- started: 2026-07-29T19:07:29.128000+00:00
-- ended: 2026-07-29T19:07:29.246000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
