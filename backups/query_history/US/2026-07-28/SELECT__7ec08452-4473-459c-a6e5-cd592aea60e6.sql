-- job_id: 7ec08452-4473-459c-a6e5-cd592aea60e6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:08.308000+00:00
-- started: 2026-07-28T10:04:08.392000+00:00
-- ended: 2026-07-28T10:04:08.510000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995MT' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
