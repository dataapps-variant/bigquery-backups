-- job_id: bbf8399b-663f-4377-9885-b126653273ed
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:07.766000+00:00
-- started: 2026-07-28T10:03:07.838000+00:00
-- ended: 2026-07-28T10:03:08.025000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RL2788ST' AND App_Name = 'RL'
            ORDER BY Billing_Cycle, SOT_Days
