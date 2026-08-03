-- job_id: job_pTry4dGkB_D7xAEO7xWDnreYIBiy
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:02.389000+00:00
-- started: 2026-08-03T11:49:02.505000+00:00
-- ended: 2026-08-03T11:49:02.827000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
