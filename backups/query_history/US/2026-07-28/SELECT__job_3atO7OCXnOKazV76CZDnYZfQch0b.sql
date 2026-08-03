-- job_id: job_3atO7OCXnOKazV76CZDnYZfQch0b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:13:15.930000+00:00
-- started: 2026-07-28T15:13:16.025000+00:00
-- ended: 2026-07-28T15:13:16.128000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
