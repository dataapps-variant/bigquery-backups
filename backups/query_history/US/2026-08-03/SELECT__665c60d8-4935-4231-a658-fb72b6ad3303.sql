-- job_id: 665c60d8-4935-4231-a658-fb72b6ad3303
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:53.225000+00:00
-- started: 2026-08-03T12:27:53.291000+00:00
-- ended: 2026-08-03T12:27:53.448000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
