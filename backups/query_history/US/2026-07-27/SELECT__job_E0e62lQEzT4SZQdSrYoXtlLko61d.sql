-- job_id: job_E0e62lQEzT4SZQdSrYoXtlLko61d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:51:25.462000+00:00
-- started: 2026-07-27T14:51:25.607000+00:00
-- ended: 2026-07-27T14:51:25.730000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
