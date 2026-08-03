-- job_id: 7aad9113-b2a6-45aa-9669-917a79b45b8b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:48.513000+00:00
-- started: 2026-08-03T12:27:48.568000+00:00
-- ended: 2026-08-03T12:27:48.717000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF4995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
