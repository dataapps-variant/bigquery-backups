-- job_id: afff211d-f995-4782-9131-d532b32ea1a2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:28.208000+00:00
-- started: 2026-08-03T12:27:28.297000+00:00
-- ended: 2026-08-03T12:27:28.470000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB5178YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
