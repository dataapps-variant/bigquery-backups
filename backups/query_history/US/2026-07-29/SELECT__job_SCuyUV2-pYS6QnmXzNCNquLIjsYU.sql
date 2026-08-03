-- job_id: job_SCuyUV2-pYS6QnmXzNCNquLIjsYU
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:50.598000+00:00
-- started: 2026-07-29T15:11:50.751000+00:00
-- ended: 2026-07-29T15:11:50.866000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
