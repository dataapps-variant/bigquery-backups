-- job_id: db40ed23-bd9f-4478-be09-77fefe026ad5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:03.893000+00:00
-- started: 2026-08-03T12:25:03.961000+00:00
-- ended: 2026-08-03T12:25:04.144000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
