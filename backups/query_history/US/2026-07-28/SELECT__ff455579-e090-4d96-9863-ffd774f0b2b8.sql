-- job_id: ff455579-e090-4d96-9863-ffd774f0b2b8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:32.637000+00:00
-- started: 2026-07-28T10:04:32.677000+00:00
-- ended: 2026-07-28T10:04:33.601000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
