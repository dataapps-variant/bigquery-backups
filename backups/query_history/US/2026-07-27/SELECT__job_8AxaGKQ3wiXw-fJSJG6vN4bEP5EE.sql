-- job_id: job_8AxaGKQ3wiXw-fJSJG6vN4bEP5EE
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T14:48:47.205000+00:00
-- started: 2026-07-27T14:48:47.312000+00:00
-- ended: 2026-07-27T14:48:47.458000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
