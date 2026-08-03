-- job_id: job_qXo8zjBuXCcZyVX1zu3AAFx9IKtZ
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T15:11:47.340000+00:00
-- started: 2026-07-29T15:11:47.480000+00:00
-- ended: 2026-07-29T15:11:47.602000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
