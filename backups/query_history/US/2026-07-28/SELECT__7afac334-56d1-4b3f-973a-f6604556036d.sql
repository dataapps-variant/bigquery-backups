-- job_id: 7afac334-56d1-4b3f-973a-f6604556036d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:46.731000+00:00
-- started: 2026-07-28T14:33:46.793000+00:00
-- ended: 2026-07-28T14:33:46.981000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT6373YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
