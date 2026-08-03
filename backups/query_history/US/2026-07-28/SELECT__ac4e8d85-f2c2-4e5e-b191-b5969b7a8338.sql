-- job_id: ac4e8d85-f2c2-4e5e-b191-b5969b7a8338
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:33.430000+00:00
-- started: 2026-07-28T10:05:33.475000+00:00
-- ended: 2026-07-28T10:05:33.554000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
