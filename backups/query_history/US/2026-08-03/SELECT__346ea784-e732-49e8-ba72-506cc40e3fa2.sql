-- job_id: 346ea784-e732-49e8-ba72-506cc40e3fa2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:23.545000+00:00
-- started: 2026-08-03T12:26:23.616000+00:00
-- ended: 2026-08-03T12:26:23.842000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT6373YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
