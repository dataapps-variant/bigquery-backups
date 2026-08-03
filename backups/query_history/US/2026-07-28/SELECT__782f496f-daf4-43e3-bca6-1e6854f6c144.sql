-- job_id: 782f496f-daf4-43e3-bca6-1e6854f6c144
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:55.731000+00:00
-- started: 2026-07-28T14:32:55.802000+00:00
-- ended: 2026-07-28T14:32:55.970000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'IQ2788YT' AND App_Name = 'IQ'
            ORDER BY Billing_Cycle, SOT_Days
