-- job_id: 7d9600f4-08dd-459f-9579-d4b4026e79fb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:29.747000+00:00
-- started: 2026-08-03T12:22:29.827000+00:00
-- ended: 2026-08-03T12:22:30.087000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2995MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
