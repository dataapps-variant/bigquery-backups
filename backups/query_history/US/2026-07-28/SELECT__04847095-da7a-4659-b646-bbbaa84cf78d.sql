-- job_id: 04847095-da7a-4659-b646-bbbaa84cf78d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:53.676000+00:00
-- started: 2026-07-28T14:30:53.742000+00:00
-- ended: 2026-07-28T14:30:53.971000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT3995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
