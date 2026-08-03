-- job_id: job_7gzF8C6Tm2eg2yRWO9xX-Ay_0IUu
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:34:01.661000+00:00
-- started: 2026-07-31T11:34:01.804000+00:00
-- ended: 2026-07-31T11:34:01.931000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
