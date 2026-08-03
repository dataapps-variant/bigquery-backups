-- job_id: job_P8N1U7ASe9NY8UjmPuOyzbWUhGaI
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T18:25:09.860000+00:00
-- started: 2026-07-29T18:25:09.989000+00:00
-- ended: 2026-07-29T18:25:10.099000+00:00

SELECT App_Name, Product_Name_Final, Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
   FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
