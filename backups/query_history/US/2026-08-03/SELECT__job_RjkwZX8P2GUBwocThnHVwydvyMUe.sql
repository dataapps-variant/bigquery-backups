-- job_id: job_RjkwZX8P2GUBwocThnHVwydvyMUe
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:19.914000+00:00
-- started: 2026-08-03T11:52:20.015000+00:00
-- ended: 2026-08-03T11:52:20.151000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
