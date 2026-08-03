-- job_id: 29200599-845e-4a92-9bb2-e3f785bcdc25
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:59.168000+00:00
-- started: 2026-08-03T12:24:59.241000+00:00
-- ended: 2026-08-03T12:24:59.533000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
