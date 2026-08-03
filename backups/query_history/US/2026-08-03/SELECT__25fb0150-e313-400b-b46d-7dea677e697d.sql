-- job_id: 25fb0150-e313-400b-b46d-7dea677e697d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:49.584000+00:00
-- started: 2026-08-03T12:23:49.656000+00:00
-- ended: 2026-08-03T12:23:49.955000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
