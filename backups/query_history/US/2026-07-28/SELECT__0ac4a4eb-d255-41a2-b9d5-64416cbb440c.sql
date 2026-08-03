-- job_id: 0ac4a4eb-d255-41a2-b9d5-64416cbb440c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:26.641000+00:00
-- started: 2026-07-28T10:06:26.714000+00:00
-- ended: 2026-07-28T10:06:26.815000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB6373YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
