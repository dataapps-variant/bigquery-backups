-- job_id: 24a7cd8c-c63c-4f30-a5d0-a44b7df5dbb9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:09.725000+00:00
-- started: 2026-07-28T14:33:09.821000+00:00
-- ended: 2026-07-28T14:33:10.010000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RL2788ST' AND App_Name = 'RL'
            ORDER BY Billing_Cycle, SOT_Days
