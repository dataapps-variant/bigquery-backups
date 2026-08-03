-- job_id: job_rdVWJxyJ5K1jpCLkFSXtOA6CwDVN
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:23.348000+00:00
-- started: 2026-08-03T11:52:23.461000+00:00
-- ended: 2026-08-03T11:52:23.553000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
