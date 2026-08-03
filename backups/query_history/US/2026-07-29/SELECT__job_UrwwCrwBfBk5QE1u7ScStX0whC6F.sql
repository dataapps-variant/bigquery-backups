-- job_id: job_UrwwCrwBfBk5QE1u7ScStX0whC6F
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:14:36.335000+00:00
-- started: 2026-07-29T15:14:36.522000+00:00
-- ended: 2026-07-29T15:14:36.646000+00:00

SELECT Input_ID, Day_First_Charge_Acquired AS acq_date, Day_Refunded,
          SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL AND Day_First_Charge_Acquired IS NOT NULL
   GROUP BY Input_ID, Day_First_Charge_Acquired, Day_Refunded
