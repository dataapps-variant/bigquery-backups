-- job_id: 8bded59d-2f09-4e39-8e09-77d444ed4b0c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:54.379000+00:00
-- started: 2026-07-28T14:34:54.439000+00:00
-- ended: 2026-07-28T14:34:54.612000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995MT' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
