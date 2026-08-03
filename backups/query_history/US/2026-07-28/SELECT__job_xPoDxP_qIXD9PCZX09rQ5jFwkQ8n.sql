-- job_id: job_xPoDxP_qIXD9PCZX09rQ5jFwkQ8n
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:13:36.521000+00:00
-- started: 2026-07-28T13:13:36.606000+00:00
-- ended: 2026-07-28T13:13:36.718000+00:00

SELECT Input_ID, Day_First_Charge_Acquired AS acq_date, Day_Refunded,
          SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL AND Day_First_Charge_Acquired IS NOT NULL
   GROUP BY Input_ID, Day_First_Charge_Acquired, Day_Refunded
