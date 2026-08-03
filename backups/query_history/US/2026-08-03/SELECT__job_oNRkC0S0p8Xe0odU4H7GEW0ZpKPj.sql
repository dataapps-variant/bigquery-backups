-- job_id: job_oNRkC0S0p8Xe0odU4H7GEW0ZpKPj
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:49:05.096000+00:00
-- started: 2026-08-03T11:49:05.243000+00:00
-- ended: 2026-08-03T11:49:05.990000+00:00

SELECT Input_ID, Day_First_Charge_Acquired AS acq_date, Day_Refunded,
          SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL AND Day_First_Charge_Acquired IS NOT NULL
   GROUP BY Input_ID, Day_First_Charge_Acquired, Day_Refunded
