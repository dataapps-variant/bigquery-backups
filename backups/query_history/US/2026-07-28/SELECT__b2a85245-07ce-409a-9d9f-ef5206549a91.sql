-- job_id: b2a85245-07ce-409a-9d9f-ef5206549a91
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:01.508000+00:00
-- started: 2026-07-28T10:05:01.575000+00:00
-- ended: 2026-07-28T10:05:01.670000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2995ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
