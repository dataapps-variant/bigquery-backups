-- job_id: 77d0e8c5-4d43-4696-82a3-8b8d47e5fad0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:07.161000+00:00
-- started: 2026-08-03T12:28:07.245000+00:00
-- ended: 2026-08-03T12:28:07.473000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2788ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
