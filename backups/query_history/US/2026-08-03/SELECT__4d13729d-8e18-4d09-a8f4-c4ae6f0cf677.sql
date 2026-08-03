-- job_id: 4d13729d-8e18-4d09-a8f4-c4ae6f0cf677
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:32.745000+00:00
-- started: 2026-08-03T12:27:32.803000+00:00
-- ended: 2026-08-03T12:27:32.996000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB3983YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
