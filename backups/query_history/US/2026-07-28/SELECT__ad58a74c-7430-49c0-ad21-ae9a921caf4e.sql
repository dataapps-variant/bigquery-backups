-- job_id: ad58a74c-7430-49c0-ad21-ae9a921caf4e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:51.191000+00:00
-- started: 2026-07-28T10:02:51.254000+00:00
-- ended: 2026-07-28T10:02:51.380000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD9600AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
