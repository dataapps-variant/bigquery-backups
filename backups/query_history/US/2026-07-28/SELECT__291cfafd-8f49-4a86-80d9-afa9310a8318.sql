-- job_id: 291cfafd-8f49-4a86-80d9-afa9310a8318
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:13.988000+00:00
-- started: 2026-07-28T10:06:14.060000+00:00
-- ended: 2026-07-28T10:06:14.168000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
