-- job_id: 3237720d-d4a1-4fde-b7e0-23fa603a1948
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:08.866000+00:00
-- started: 2026-07-28T10:05:08.963000+00:00
-- ended: 2026-07-28T10:05:09.175000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
