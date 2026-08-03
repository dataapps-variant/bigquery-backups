-- job_id: job_u_uR8f4mVOA9qWlKjrWXDPHj3OkL
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:43:23.953000+00:00
-- started: 2026-07-28T13:43:24.031000+00:00
-- ended: 2026-07-28T13:43:24.127000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
