-- job_id: 3c85d035-a916-421e-a6af-11733a7b5c26
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:34.898000+00:00
-- started: 2026-07-28T14:33:34.940000+00:00
-- ended: 2026-07-28T14:33:35.123000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
