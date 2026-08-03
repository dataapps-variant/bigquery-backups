-- job_id: fd41b16b-2f72-4585-af5c-b9f7d690ce4c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:43.791000+00:00
-- started: 2026-08-03T12:25:43.868000+00:00
-- ended: 2026-08-03T12:25:44.035000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RL2788ST' AND App_Name = 'RL'
            ORDER BY Billing_Cycle, SOT_Days
