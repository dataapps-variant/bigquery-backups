-- job_id: 494d6079-feb0-4ca2-b304-96c0bcca1d96
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:34.346000+00:00
-- started: 2026-07-28T10:06:34.408000+00:00
-- ended: 2026-07-28T10:06:34.519000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995MT' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
