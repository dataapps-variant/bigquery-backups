-- job_id: ff0672ae-9208-4d94-a73b-1f31470f528e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:32.579000+00:00
-- started: 2026-07-28T10:02:32.660000+00:00
-- ended: 2026-07-28T10:02:32.755000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
