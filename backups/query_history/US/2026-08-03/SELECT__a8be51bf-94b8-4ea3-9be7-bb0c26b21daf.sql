-- job_id: a8be51bf-94b8-4ea3-9be7-bb0c26b21daf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:17.655000+00:00
-- started: 2026-08-03T12:23:17.735000+00:00
-- ended: 2026-08-03T12:23:17.907000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT3995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
