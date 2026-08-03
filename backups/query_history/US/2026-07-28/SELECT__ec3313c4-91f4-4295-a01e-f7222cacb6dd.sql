-- job_id: ec3313c4-91f4-4295-a01e-f7222cacb6dd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:14.087000+00:00
-- started: 2026-07-28T14:33:14.202000+00:00
-- ended: 2026-07-28T14:33:14.363000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
