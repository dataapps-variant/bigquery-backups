-- job_id: 0a665d28-50bd-4dc0-9ac3-17d42e4ac303
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:14.155000+00:00
-- started: 2026-07-28T10:05:14.216000+00:00
-- ended: 2026-07-28T10:05:14.312000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RL2788ST' AND App_Name = 'RL'
            ORDER BY Billing_Cycle, SOT_Days
