-- job_id: cd339a81-b70a-4d66-ba86-b1b5c27563d2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:36.199000+00:00
-- started: 2026-07-28T10:05:36.412000+00:00
-- ended: 2026-07-28T10:05:36.549000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
