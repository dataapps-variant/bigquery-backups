-- job_id: be53941c-bbaa-4a5c-b53f-a6d92777109d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:02.302000+00:00
-- started: 2026-08-03T12:28:02.363000+00:00
-- ended: 2026-08-03T12:28:02.546000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF5985ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
