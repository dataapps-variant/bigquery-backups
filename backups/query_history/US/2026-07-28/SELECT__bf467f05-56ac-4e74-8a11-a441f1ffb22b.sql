-- job_id: bf467f05-56ac-4e74-8a11-a441f1ffb22b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:23.784000+00:00
-- started: 2026-07-28T14:31:23.846000+00:00
-- ended: 2026-07-28T14:31:24.014000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
