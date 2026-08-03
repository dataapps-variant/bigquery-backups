-- job_id: job_KQ4KldTAWesJqgs1AY2XnWB_lXQP
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:23:55.977000+00:00
-- started: 2026-07-29T09:23:56.060000+00:00
-- ended: 2026-07-29T09:23:56.182000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
