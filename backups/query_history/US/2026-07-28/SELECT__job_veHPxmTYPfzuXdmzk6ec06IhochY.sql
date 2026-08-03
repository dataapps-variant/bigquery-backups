-- job_id: job_veHPxmTYPfzuXdmzk6ec06IhochY
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:59.020000+00:00
-- started: 2026-07-28T13:10:59.105000+00:00
-- ended: 2026-07-28T13:10:59.220000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
