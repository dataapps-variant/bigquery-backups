-- job_id: job_MWiIW6RhKAnBh-u23i6MoQM4A7DG
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:43:20.590000+00:00
-- started: 2026-07-28T13:43:20.710000+00:00
-- ended: 2026-07-28T13:43:20.845000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
