-- job_id: 2f4385cc-b978-41c7-a7e9-413ad265a94a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:42.503000+00:00
-- started: 2026-07-28T10:06:42.581000+00:00
-- ended: 2026-07-28T10:06:42.669000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
