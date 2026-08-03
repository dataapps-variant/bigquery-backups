-- job_id: 45060921-ad0f-4ff5-a3d6-d4d5c5d9e35f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:35.616000+00:00
-- started: 2026-07-28T10:04:35.686000+00:00
-- ended: 2026-07-28T10:04:35.989000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
