-- job_id: 0292ae98-6942-4e50-b1e1-176776a7c209
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:40.594000+00:00
-- started: 2026-07-28T10:03:40.644000+00:00
-- ended: 2026-07-28T10:03:40.830000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
