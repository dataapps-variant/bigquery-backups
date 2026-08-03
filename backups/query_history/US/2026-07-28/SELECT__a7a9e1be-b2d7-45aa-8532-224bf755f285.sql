-- job_id: a7a9e1be-b2d7-45aa-8532-224bf755f285
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:49.159000+00:00
-- started: 2026-07-28T14:30:49.442000+00:00
-- ended: 2026-07-28T14:30:49.659000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1495NT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
