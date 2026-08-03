-- job_id: 1afd282d-3f28-4e8f-9c7c-93eefb294c44
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:23.941000+00:00
-- started: 2026-07-28T10:06:23.999000+00:00
-- ended: 2026-07-28T10:06:24.079000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB2788YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
