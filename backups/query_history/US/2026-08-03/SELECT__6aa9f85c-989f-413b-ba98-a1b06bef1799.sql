-- job_id: 6aa9f85c-989f-413b-ba98-a1b06bef1799
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:43.697000+00:00
-- started: 2026-08-03T12:24:44.100000+00:00
-- ended: 2026-08-03T12:24:44.288000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
