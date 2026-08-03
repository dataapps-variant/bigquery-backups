-- job_id: a28f0cc5-b8db-4d46-9b6b-fba2aef554f1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:11.108000+00:00
-- started: 2026-07-28T10:06:11.187000+00:00
-- ended: 2026-07-28T10:06:11.265000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
