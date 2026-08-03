-- job_id: 25558aef-bbad-4274-9bf4-a20129747156
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:16.399000+00:00
-- started: 2026-07-28T10:05:16.479000+00:00
-- ended: 2026-07-28T10:05:16.570000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
