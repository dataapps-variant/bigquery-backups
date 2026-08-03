-- job_id: aaa425e3-91a8-42a0-b6fb-ba730ae8b41d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:05.040000+00:00
-- started: 2026-08-03T12:23:05.112000+00:00
-- ended: 2026-08-03T12:23:05.316000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
