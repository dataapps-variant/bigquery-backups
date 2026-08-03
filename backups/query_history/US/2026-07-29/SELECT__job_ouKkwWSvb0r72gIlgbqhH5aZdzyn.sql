-- job_id: job_ouKkwWSvb0r72gIlgbqhH5aZdzyn
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:28:04.388000+00:00
-- started: 2026-07-29T18:28:04.510000+00:00
-- ended: 2026-07-29T18:28:04.638000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
