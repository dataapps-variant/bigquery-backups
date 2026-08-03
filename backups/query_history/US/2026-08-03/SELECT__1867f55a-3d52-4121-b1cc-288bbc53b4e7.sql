-- job_id: 1867f55a-3d52-4121-b1cc-288bbc53b4e7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:04.458000+00:00
-- started: 2026-08-03T12:24:04.519000+00:00
-- ended: 2026-08-03T12:24:04.628000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
