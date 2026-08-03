-- job_id: 5438959b-3f57-450c-9ee6-9c80bd16c9cf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:10.301000+00:00
-- started: 2026-08-03T12:27:10.356000+00:00
-- ended: 2026-08-03T12:27:10.515000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
