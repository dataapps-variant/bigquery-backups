-- job_id: 84788d0c-bdb5-43a9-9873-94e1c0750073
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:22.479000+00:00
-- started: 2026-07-28T14:30:22.582000+00:00
-- ended: 2026-07-28T14:30:22.781000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT2788YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
