-- job_id: 38ec57c0-2c77-4bc0-b995-c30370a6bc86
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:47.118000+00:00
-- started: 2026-07-28T10:04:47.288000+00:00
-- ended: 2026-07-28T10:04:47.384000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
