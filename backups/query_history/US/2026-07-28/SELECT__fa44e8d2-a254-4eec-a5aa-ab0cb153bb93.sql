-- job_id: fa44e8d2-a254-4eec-a5aa-ab0cb153bb93
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:50.988000+00:00
-- started: 2026-07-28T10:04:51.084000+00:00
-- ended: 2026-07-28T10:04:51.245000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB3983YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
