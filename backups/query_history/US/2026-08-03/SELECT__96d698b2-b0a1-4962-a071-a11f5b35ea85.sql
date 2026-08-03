-- job_id: 96d698b2-b0a1-4962-a071-a11f5b35ea85
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:48.038000+00:00
-- started: 2026-08-03T12:25:48.132000+00:00
-- ended: 2026-08-03T12:25:48.327000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
