-- job_id: 931b727b-c8cb-4557-8b2e-f0e07bdd1500
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:19.491000+00:00
-- started: 2026-08-03T12:26:19.578000+00:00
-- ended: 2026-08-03T12:26:19.772000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
