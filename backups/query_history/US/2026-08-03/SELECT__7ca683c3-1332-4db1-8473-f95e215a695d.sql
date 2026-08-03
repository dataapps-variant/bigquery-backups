-- job_id: 7ca683c3-1332-4db1-8473-f95e215a695d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:28.681000+00:00
-- started: 2026-08-03T12:25:28.793000+00:00
-- ended: 2026-08-03T12:25:28.955000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'IQ2788YT' AND App_Name = 'IQ'
            ORDER BY Billing_Cycle, SOT_Days
