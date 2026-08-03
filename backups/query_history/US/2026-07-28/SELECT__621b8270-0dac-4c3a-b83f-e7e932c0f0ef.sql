-- job_id: 621b8270-0dac-4c3a-b83f-e7e932c0f0ef
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:50.643000+00:00
-- started: 2026-07-28T10:00:50.724000+00:00
-- ended: 2026-07-28T10:00:50.895000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT3995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
