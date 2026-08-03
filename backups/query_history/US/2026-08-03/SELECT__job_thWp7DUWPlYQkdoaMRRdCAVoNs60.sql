-- job_id: job_thWp7DUWPlYQkdoaMRRdCAVoNs60
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:57.706000+00:00
-- started: 2026-08-03T12:28:58.011000+00:00
-- ended: 2026-08-03T12:28:58.105000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
