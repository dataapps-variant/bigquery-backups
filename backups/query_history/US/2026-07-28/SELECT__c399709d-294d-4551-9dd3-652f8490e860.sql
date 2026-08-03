-- job_id: c399709d-294d-4551-9dd3-652f8490e860
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:08.772000+00:00
-- started: 2026-07-28T10:00:08.829000+00:00
-- ended: 2026-07-28T10:00:09.176000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1440AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
