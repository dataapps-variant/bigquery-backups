-- job_id: 85b76463-e608-4ede-9f62-a002757e4f47
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:14.450000+00:00
-- started: 2026-08-03T12:24:14.529000+00:00
-- ended: 2026-08-03T12:24:14.699000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'EN2788YT' AND App_Name = 'EN'
            ORDER BY Billing_Cycle, SOT_Days
