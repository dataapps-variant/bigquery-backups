-- job_id: 83971ab6-9a4e-40eb-a46d-4e68d32ef585
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:32.721000+00:00
-- started: 2026-07-28T09:59:32.829000+00:00
-- ended: 2026-07-28T09:59:33.013000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD4988MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
