-- job_id: a2473141-951c-4df7-ab17-82e19b112fef
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:24.341000+00:00
-- started: 2026-07-28T10:03:24.400000+00:00
-- ended: 2026-07-28T10:03:24.567000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3983YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
