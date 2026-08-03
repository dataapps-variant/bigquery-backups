-- job_id: job_GRXB4MZQs7ZxkSgm892_B_4K9TCp
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:42:11.243000+00:00
-- started: 2026-07-28T12:42:11.351000+00:00
-- ended: 2026-07-28T12:42:11.463000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
