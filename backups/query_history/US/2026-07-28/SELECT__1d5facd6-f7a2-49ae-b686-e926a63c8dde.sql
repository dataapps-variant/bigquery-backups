-- job_id: 1d5facd6-f7a2-49ae-b686-e926a63c8dde
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:15.718000+00:00
-- started: 2026-07-28T10:02:15.810000+00:00
-- ended: 2026-07-28T10:02:16+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
