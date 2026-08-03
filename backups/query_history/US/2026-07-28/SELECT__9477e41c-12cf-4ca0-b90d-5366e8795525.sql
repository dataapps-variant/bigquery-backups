-- job_id: 9477e41c-12cf-4ca0-b90d-5366e8795525
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:25.606000+00:00
-- started: 2026-07-28T10:02:25.691000+00:00
-- ended: 2026-07-28T10:02:25.856000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
