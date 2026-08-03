-- job_id: 88fcdc9f-752c-4636-a2d1-6020efe4317c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:23.225000+00:00
-- started: 2026-07-28T10:04:23.297000+00:00
-- ended: 2026-07-28T10:04:23.495000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
