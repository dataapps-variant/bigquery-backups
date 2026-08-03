-- job_id: 0c78a240-7fe0-405a-806e-971292bd4f0f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:42.373000+00:00
-- started: 2026-07-28T14:30:42.467000+00:00
-- ended: 2026-07-28T14:30:42.657000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1995YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
