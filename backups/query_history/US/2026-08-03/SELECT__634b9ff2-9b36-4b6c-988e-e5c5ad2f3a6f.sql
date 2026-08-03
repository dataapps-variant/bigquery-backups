-- job_id: 634b9ff2-9b36-4b6c-988e-e5c5ad2f3a6f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:08.802000+00:00
-- started: 2026-08-03T12:24:08.887000+00:00
-- ended: 2026-08-03T12:24:09.121000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995MT' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
