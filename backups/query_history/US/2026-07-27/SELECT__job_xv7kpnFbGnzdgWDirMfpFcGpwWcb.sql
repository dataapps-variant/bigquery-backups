-- job_id: job_xv7kpnFbGnzdgWDirMfpFcGpwWcb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:48:51.747000+00:00
-- started: 2026-07-27T14:48:51.838000+00:00
-- ended: 2026-07-27T14:48:51.949000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
