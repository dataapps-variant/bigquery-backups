-- job_id: 06e21438-8454-48e1-91f3-c8d3ae578edf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:45.121000+00:00
-- started: 2026-08-03T12:22:45.193000+00:00
-- ended: 2026-08-03T12:22:45.425000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT2788YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
