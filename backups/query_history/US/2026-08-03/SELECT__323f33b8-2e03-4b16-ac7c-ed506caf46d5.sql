-- job_id: 323f33b8-2e03-4b16-ac7c-ed506caf46d5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:00.285000+00:00
-- started: 2026-08-03T12:27:00.358000+00:00
-- ended: 2026-08-03T12:27:00.537000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
