-- job_id: 563d99f1-5c96-49e2-9a48-f4873e0d0e8a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:40.450000+00:00
-- started: 2026-08-03T12:22:40.539000+00:00
-- ended: 2026-08-03T12:22:41.037000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD9600AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
