-- job_id: b9bf8c3d-12a8-4ac7-a006-d8ef474d5b26
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:08.290000+00:00
-- started: 2026-07-28T10:01:08.351000+00:00
-- ended: 2026-07-28T10:01:08.534000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
