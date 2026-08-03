-- job_id: 14cbb60c-25f4-4bb6-9efb-714ee9cce2bf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:37.201000+00:00
-- started: 2026-07-28T10:04:37.261000+00:00
-- ended: 2026-07-28T10:04:37.382000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
