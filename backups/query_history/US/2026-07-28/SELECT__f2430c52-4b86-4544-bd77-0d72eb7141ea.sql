-- job_id: f2430c52-4b86-4544-bd77-0d72eb7141ea
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:18.861000+00:00
-- started: 2026-07-28T10:04:18.908000+00:00
-- ended: 2026-07-28T10:04:19.092000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
