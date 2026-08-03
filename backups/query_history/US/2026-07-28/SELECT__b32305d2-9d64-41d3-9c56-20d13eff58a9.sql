-- job_id: b32305d2-9d64-41d3-9c56-20d13eff58a9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:05.664000+00:00
-- started: 2026-07-28T14:33:05.754000+00:00
-- ended: 2026-07-28T14:33:05.920000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2995ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
