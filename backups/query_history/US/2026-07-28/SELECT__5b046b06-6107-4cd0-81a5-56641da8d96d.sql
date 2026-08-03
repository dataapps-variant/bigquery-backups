-- job_id: 5b046b06-6107-4cd0-81a5-56641da8d96d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:31.240000+00:00
-- started: 2026-07-28T10:04:31.306000+00:00
-- ended: 2026-07-28T10:04:31.483000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
