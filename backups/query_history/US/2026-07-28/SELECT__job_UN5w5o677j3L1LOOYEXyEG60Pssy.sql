-- job_id: job_UN5w5o677j3L1LOOYEXyEG60Pssy
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:44:44.394000+00:00
-- started: 2026-07-28T12:44:44.555000+00:00
-- ended: 2026-07-28T12:44:44.673000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
