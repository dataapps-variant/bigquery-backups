-- job_id: job_y_ztQRrJsVlEpJ_9jM2Wa1x3i-wd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:17:05.050000+00:00
-- started: 2026-07-28T15:17:05.174000+00:00
-- ended: 2026-07-28T15:17:05.844000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
