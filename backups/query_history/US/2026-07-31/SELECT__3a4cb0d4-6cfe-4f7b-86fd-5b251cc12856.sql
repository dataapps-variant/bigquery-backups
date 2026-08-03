-- job_id: 3a4cb0d4-6cfe-4f7b-86fd-5b251cc12856
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:19.166000+00:00
-- started: 2026-07-31T13:42:19.260000+00:00
-- ended: 2026-07-31T13:42:20.289000+00:00

SELECT Report_Date, App_Name, AFID, Product_Name_Final_Merged, Billing_Cycle_Updated, BC_New_Users, T7D_Avg_New_Users FROM `variant-finance-data-project.Icarus_Cohort.User_Count_AFID`
