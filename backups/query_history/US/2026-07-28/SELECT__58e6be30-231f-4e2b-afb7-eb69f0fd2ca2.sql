-- job_id: 58e6be30-231f-4e2b-afb7-eb69f0fd2ca2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:32.468000+00:00
-- started: 2026-07-28T10:03:32.533000+00:00
-- ended: 2026-07-28T10:03:32.778000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
