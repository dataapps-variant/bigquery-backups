-- job_id: 258a3334-b402-4f6c-b847-63681fc0544c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:28.942000+00:00
-- started: 2026-07-28T10:06:28.997000+00:00
-- ended: 2026-07-28T10:06:29.083000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB5178YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
