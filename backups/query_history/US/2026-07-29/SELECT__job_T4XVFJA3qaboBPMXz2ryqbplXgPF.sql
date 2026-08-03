-- job_id: job_T4XVFJA3qaboBPMXz2ryqbplXgPF
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:14:33.961000+00:00
-- started: 2026-07-29T15:14:34.086000+00:00
-- ended: 2026-07-29T15:14:34.196000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
