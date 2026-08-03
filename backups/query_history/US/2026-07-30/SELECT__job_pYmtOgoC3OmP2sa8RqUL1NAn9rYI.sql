-- job_id: job_pYmtOgoC3OmP2sa8RqUL1NAn9rYI
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:51.547000+00:00
-- started: 2026-07-30T16:11:51.632000+00:00
-- ended: 2026-07-30T16:11:51.750000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
