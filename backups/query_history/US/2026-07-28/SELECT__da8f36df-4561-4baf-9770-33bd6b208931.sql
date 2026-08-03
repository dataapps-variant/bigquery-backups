-- job_id: da8f36df-4561-4baf-9770-33bd6b208931
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:07.444000+00:00
-- started: 2026-07-28T14:32:07.538000+00:00
-- ended: 2026-07-28T14:32:07.734000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
