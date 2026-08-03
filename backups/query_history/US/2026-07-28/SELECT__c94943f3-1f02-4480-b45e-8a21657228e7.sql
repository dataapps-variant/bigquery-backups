-- job_id: c94943f3-1f02-4480-b45e-8a21657228e7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:56.196000+00:00
-- started: 2026-07-28T10:04:56.276000+00:00
-- ended: 2026-07-28T10:04:56.381000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV1988ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
