-- job_id: 3aea3f84-5297-4492-820b-38a6a9381585
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:14.155000+00:00
-- started: 2026-07-28T10:03:14.244000+00:00
-- ended: 2026-07-28T10:03:14.434000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
