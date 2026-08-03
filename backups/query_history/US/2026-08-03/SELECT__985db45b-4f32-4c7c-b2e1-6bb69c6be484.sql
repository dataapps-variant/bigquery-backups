-- job_id: 985db45b-4f32-4c7c-b2e1-6bb69c6be484
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:59.804000+00:00
-- started: 2026-08-03T12:23:59.897000+00:00
-- ended: 2026-08-03T12:23:59.995000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
