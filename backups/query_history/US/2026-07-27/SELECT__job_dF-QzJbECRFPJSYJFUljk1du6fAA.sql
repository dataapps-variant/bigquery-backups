-- job_id: job_dF-QzJbECRFPJSYJFUljk1du6fAA
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T13:45:50.877000+00:00
-- started: 2026-07-27T13:45:50.979000+00:00
-- ended: 2026-07-27T13:45:51.084000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
