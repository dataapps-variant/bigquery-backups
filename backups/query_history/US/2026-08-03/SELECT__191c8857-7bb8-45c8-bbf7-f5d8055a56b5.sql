-- job_id: 191c8857-7bb8-45c8-bbf7-f5d8055a56b5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:24.050000+00:00
-- started: 2026-08-03T12:25:24.128000+00:00
-- ended: 2026-08-03T12:25:24.431000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2995ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
