-- job_id: 6bf8b17e-d01c-44d1-be09-a178336ac98b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:54.726000+00:00
-- started: 2026-07-28T10:04:54.780000+00:00
-- ended: 2026-07-28T10:04:54.977000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995MT' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
