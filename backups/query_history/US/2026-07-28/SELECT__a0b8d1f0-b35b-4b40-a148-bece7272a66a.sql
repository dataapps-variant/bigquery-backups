-- job_id: a0b8d1f0-b35b-4b40-a148-bece7272a66a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:22.417000+00:00
-- started: 2026-07-28T14:32:22.510000+00:00
-- ended: 2026-07-28T14:32:22.711000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
