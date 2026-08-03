-- job_id: 6e79b7e1-e0e7-41fc-ac9a-7407cbc778ee
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:33.553000+00:00
-- started: 2026-07-28T14:29:33.722000+00:00
-- ended: 2026-07-28T14:29:33.916000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD4988MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
