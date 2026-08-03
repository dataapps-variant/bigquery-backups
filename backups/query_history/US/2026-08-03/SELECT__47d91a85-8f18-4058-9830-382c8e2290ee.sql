-- job_id: 47d91a85-8f18-4058-9830-382c8e2290ee
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:38.064000+00:00
-- started: 2026-08-03T12:23:38.151000+00:00
-- ended: 2026-08-03T12:23:38.354000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
