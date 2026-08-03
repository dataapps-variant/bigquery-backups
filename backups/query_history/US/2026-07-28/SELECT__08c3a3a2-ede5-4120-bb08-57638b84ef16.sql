-- job_id: 08c3a3a2-ede5-4120-bb08-57638b84ef16
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:18.770000+00:00
-- started: 2026-07-28T10:06:18.851000+00:00
-- ended: 2026-07-28T10:06:18.932000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
