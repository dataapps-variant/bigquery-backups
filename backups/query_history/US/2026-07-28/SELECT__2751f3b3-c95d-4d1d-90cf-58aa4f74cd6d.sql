-- job_id: 2751f3b3-c95d-4d1d-90cf-58aa4f74cd6d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:30.656000+00:00
-- started: 2026-07-28T14:33:30.726000+00:00
-- ended: 2026-07-28T14:33:30.893000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT5178YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
