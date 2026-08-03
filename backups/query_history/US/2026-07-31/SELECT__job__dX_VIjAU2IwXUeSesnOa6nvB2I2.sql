-- job_id: job__dX_VIjAU2IwXUeSesnOa6nvB2I2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:46:32.839000+00:00
-- started: 2026-07-31T11:46:32.936000+00:00
-- ended: 2026-07-31T11:46:33.056000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
