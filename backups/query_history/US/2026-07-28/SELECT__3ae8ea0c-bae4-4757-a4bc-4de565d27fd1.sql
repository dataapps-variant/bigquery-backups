-- job_id: 3ae8ea0c-bae4-4757-a4bc-4de565d27fd1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:28.704000+00:00
-- started: 2026-07-28T10:01:28.806000+00:00
-- ended: 2026-07-28T10:01:28.891000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
