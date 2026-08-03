-- job_id: 43956636-ffaf-4f8b-a729-4ded4ca3c954
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:00.702000+00:00
-- started: 2026-08-03T12:26:00.805000+00:00
-- ended: 2026-08-03T12:26:01.002000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3983YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
