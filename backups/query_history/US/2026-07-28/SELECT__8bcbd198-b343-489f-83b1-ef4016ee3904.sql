-- job_id: 8bcbd198-b343-489f-83b1-ef4016ee3904
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:28.404000+00:00
-- started: 2026-07-28T10:03:28.451000+00:00
-- ended: 2026-07-28T10:03:28.620000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT5178YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
