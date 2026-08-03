-- job_id: 6d8777ef-4fc0-4a35-80a7-2fe7675884aa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:57.374000+00:00
-- started: 2026-07-28T10:03:57.440000+00:00
-- ended: 2026-07-28T10:03:57.534000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
