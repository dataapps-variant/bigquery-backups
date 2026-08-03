-- job_id: fd70a398-e084-4e2a-b681-b20ab6540d11
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:15.027000+00:00
-- started: 2026-08-03T12:26:15.150000+00:00
-- ended: 2026-08-03T12:26:15.361000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
