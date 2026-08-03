-- job_id: f41ef3fd-c411-47e4-a771-3810ae7886f9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:26.515000+00:00
-- started: 2026-08-03T12:24:26.567000+00:00
-- ended: 2026-08-03T12:24:26.751000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
