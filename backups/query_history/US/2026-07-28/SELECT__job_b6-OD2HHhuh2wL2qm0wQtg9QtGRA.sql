-- job_id: job_b6-OD2HHhuh2wL2qm0wQtg9QtGRA
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:42:07.580000+00:00
-- started: 2026-07-28T12:42:07.805000+00:00
-- ended: 2026-07-28T12:42:08.352000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
