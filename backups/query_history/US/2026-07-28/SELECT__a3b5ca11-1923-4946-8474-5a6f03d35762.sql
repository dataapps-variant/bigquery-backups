-- job_id: a3b5ca11-1923-4946-8474-5a6f03d35762
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:41.718000+00:00
-- started: 2026-07-28T10:05:41.823000+00:00
-- ended: 2026-07-28T10:05:41.941000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT6373YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
