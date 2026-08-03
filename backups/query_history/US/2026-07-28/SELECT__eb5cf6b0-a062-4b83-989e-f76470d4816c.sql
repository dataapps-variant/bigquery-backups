-- job_id: eb5cf6b0-a062-4b83-989e-f76470d4816c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:38.707000+00:00
-- started: 2026-07-28T10:01:38.764000+00:00
-- ended: 2026-07-28T10:01:38.945000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995MT' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
