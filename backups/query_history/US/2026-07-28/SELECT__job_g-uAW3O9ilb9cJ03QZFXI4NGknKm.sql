-- job_id: job_g-uAW3O9ilb9cJ03QZFXI4NGknKm
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:19:47.004000+00:00
-- started: 2026-07-28T15:19:47.101000+00:00
-- ended: 2026-07-28T15:19:47.207000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
