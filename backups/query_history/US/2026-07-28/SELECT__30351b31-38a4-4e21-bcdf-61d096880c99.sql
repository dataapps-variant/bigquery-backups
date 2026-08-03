-- job_id: 30351b31-38a4-4e21-bcdf-61d096880c99
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:47.110000+00:00
-- started: 2026-07-28T14:32:47.173000+00:00
-- ended: 2026-07-28T14:32:47.342000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2688ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
