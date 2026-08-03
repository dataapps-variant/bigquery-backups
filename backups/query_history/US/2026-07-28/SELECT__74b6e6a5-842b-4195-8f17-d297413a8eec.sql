-- job_id: 74b6e6a5-842b-4195-8f17-d297413a8eec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:41.231000+00:00
-- started: 2026-07-28T10:04:41.318000+00:00
-- ended: 2026-07-28T10:04:41.441000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
