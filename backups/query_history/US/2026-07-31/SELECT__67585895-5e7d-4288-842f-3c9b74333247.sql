-- job_id: 67585895-5e7d-4288-842f-3c9b74333247
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:42:19.177000+00:00
-- started: 2026-07-31T13:42:19.259000+00:00
-- ended: 2026-07-31T13:42:20.164000+00:00

SELECT Report_Date, App_Name, AFID_CHANNEL, Product_Name_Final_Merged, Billing_Cycle_Updated, BC_New_Users, T7D_Avg_New_Users FROM `variant-finance-data-project.ICARUS_Multi.User_Count`
