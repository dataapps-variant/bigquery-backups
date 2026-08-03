-- job_id: 3ca1b5be-c816-4187-a955-a827853587fa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:14.078000+00:00
-- started: 2026-08-03T12:25:14.129000+00:00
-- ended: 2026-08-03T12:25:14.302000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV1988ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
