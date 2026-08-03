-- job_id: 08e8d764-a32d-4e6a-b3f1-34d0493eb1e2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:49.778000+00:00
-- started: 2026-07-28T10:06:49.889000+00:00
-- ended: 2026-07-28T10:06:50.027000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF5985ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
