-- job_id: job_lvHyYl_r5aY6kHXYnDTD602wUjmY
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:45:57.417000+00:00
-- started: 2026-07-28T13:45:57.532000+00:00
-- ended: 2026-07-28T13:45:57.846000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
