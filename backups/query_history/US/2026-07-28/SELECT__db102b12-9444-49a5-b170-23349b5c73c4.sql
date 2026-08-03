-- job_id: db102b12-9444-49a5-b170-23349b5c73c4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:31.423000+00:00
-- started: 2026-07-28T10:06:31.489000+00:00
-- ended: 2026-07-28T10:06:31.565000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB3983YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
