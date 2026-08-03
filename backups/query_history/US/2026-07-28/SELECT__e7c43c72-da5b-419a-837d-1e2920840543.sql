-- job_id: e7c43c72-da5b-419a-837d-1e2920840543
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:11.589000+00:00
-- started: 2026-07-28T10:03:11.644000+00:00
-- ended: 2026-07-28T10:03:11.815000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
