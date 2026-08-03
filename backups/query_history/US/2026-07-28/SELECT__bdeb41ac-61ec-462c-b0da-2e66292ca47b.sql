-- job_id: bdeb41ac-61ec-462c-b0da-2e66292ca47b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:47.419000+00:00
-- started: 2026-07-28T10:04:47.491000+00:00
-- ended: 2026-07-28T10:04:47.644000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB5178YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
