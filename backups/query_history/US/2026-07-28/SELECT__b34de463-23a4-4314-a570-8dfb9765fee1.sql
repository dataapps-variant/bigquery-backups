-- job_id: b34de463-23a4-4314-a570-8dfb9765fee1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:27.518000+00:00
-- started: 2026-07-28T10:05:27.575000+00:00
-- ended: 2026-07-28T10:05:28.069000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3983YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
