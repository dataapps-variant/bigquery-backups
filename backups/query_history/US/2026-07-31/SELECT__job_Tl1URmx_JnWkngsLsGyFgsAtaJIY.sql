-- job_id: job_Tl1URmx_JnWkngsLsGyFgsAtaJIY
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:54:33.775000+00:00
-- started: 2026-07-31T11:54:33.904000+00:00
-- ended: 2026-07-31T11:54:34.049000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
