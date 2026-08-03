-- job_id: job_nrLrxzpDX_VPbii7gz5NUPDzAjoZ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:13:34.470000+00:00
-- started: 2026-07-28T13:13:34.571000+00:00
-- ended: 2026-07-28T13:13:34.682000+00:00

SELECT Input_ID, Day_Refunded, SUM(Refund_Amount) AS amt
   FROM `variant-finance-data-project.R100.R100_Historical_Refunds`
   WHERE Day_Refunded IS NOT NULL
   GROUP BY Input_ID, Day_Refunded
