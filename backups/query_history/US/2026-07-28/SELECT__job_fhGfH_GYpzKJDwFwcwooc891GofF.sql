-- job_id: job_fhGfH_GYpzKJDwFwcwooc891GofF
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:36:09.594000+00:00
-- started: 2026-07-28T14:36:09.682000+00:00
-- ended: 2026-07-28T14:36:09.799000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
