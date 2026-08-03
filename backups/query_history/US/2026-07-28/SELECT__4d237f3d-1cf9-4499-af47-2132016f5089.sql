-- job_id: 4d237f3d-1cf9-4499-af47-2132016f5089
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:20.669000+00:00
-- started: 2026-07-28T10:02:20.746000+00:00
-- ended: 2026-07-28T10:02:20.908000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
