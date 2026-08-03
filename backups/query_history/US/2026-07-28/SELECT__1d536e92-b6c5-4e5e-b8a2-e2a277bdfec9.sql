-- job_id: 1d536e92-b6c5-4e5e-b8a2-e2a277bdfec9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:26.792000+00:00
-- started: 2026-07-28T14:33:26.876000+00:00
-- ended: 2026-07-28T14:33:27.034000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3983YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
