-- job_id: ecc3feec-fc13-4c29-bb98-ce351e56b0ea
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:19.169000+00:00
-- started: 2026-07-28T10:00:19.304000+00:00
-- ended: 2026-07-28T10:00:19.668000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT2788YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
