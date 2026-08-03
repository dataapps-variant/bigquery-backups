-- job_id: 532dd8d4-6541-4c1b-bc49-3a44a9ea0d6d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:24.502000+00:00
-- started: 2026-07-28T10:03:24.562000+00:00
-- ended: 2026-07-28T10:03:24.664000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT3995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
