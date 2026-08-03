-- job_id: 05ae6370-7cad-4c62-8346-5a453068044c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:36.480000+00:00
-- started: 2026-07-28T10:03:36.525000+00:00
-- ended: 2026-07-28T10:03:36.663000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
