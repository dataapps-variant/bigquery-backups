-- job_id: job_S1pvkP_WcRvVTT3602NEEWsKfsy2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:17:01.537000+00:00
-- started: 2026-07-28T15:17:01.636000+00:00
-- ended: 2026-07-28T15:17:01.740000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
