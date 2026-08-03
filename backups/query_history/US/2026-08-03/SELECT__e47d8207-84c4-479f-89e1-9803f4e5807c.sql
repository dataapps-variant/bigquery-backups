-- job_id: e47d8207-84c4-479f-89e1-9803f4e5807c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:48.732000+00:00
-- started: 2026-08-03T12:24:48.831000+00:00
-- ended: 2026-08-03T12:24:48.996000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
