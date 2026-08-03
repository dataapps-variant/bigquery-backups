-- job_id: job_10wOSmX1rwxYHFcAVmEktd3bfyUL
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:14:33.598000+00:00
-- started: 2026-07-30T16:14:33.692000+00:00
-- ended: 2026-07-30T16:14:33.817000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
