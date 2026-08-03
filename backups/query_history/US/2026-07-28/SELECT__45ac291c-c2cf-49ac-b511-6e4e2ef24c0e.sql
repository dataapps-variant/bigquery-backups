-- job_id: 45ac291c-c2cf-49ac-b511-6e4e2ef24c0e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:27.362000+00:00
-- started: 2026-07-28T14:32:27.453000+00:00
-- ended: 2026-07-28T14:32:27.610000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
