-- job_id: e7923ce1-e37d-464a-9746-df483b91fb98
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:56.512000+00:00
-- started: 2026-08-03T12:26:56.590000+00:00
-- ended: 2026-08-03T12:26:56.734000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
