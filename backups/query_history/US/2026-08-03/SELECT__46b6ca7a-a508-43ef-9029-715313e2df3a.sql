-- job_id: 46b6ca7a-a508-43ef-9029-715313e2df3a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:56.886000+00:00
-- started: 2026-08-03T12:21:56.973000+00:00
-- ended: 2026-08-03T12:21:57.179000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD4988MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
