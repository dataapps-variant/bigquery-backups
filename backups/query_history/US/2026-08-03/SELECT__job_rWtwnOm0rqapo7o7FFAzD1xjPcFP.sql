-- job_id: job_rWtwnOm0rqapo7o7FFAzD1xjPcFP
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:01.561000+00:00
-- started: 2026-08-03T12:29:01.643000+00:00
-- ended: 2026-08-03T12:29:01.756000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
