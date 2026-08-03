-- job_id: 804cff3e-5b0d-48a0-9c98-54680921f8d5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:38.394000+00:00
-- started: 2026-08-03T12:24:38.444000+00:00
-- ended: 2026-08-03T12:24:38.674000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
