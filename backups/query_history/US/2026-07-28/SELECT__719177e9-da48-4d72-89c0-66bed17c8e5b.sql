-- job_id: 719177e9-da48-4d72-89c0-66bed17c8e5b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:39.412000+00:00
-- started: 2026-07-28T10:04:39.461000+00:00
-- ended: 2026-07-28T10:04:39.769000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB2788YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
