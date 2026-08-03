-- job_id: fca11bfd-a5f6-43b9-9292-49bd9371450b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:39.216000+00:00
-- started: 2026-07-28T10:00:39.292000+00:00
-- ended: 2026-07-28T10:00:39.484000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
