-- job_id: 996c00a1-96d1-4f7e-ad65-dcef5f489cd6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:27.210000+00:00
-- started: 2026-07-28T10:04:27.284000+00:00
-- ended: 2026-07-28T10:04:27.451000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788MT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
