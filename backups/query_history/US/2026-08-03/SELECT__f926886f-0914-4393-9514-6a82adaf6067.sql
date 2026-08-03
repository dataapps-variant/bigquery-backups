-- job_id: f926886f-0914-4393-9514-6a82adaf6067
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:23.908000+00:00
-- started: 2026-08-03T12:27:23.983000+00:00
-- ended: 2026-08-03T12:27:24.176000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB6373YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
