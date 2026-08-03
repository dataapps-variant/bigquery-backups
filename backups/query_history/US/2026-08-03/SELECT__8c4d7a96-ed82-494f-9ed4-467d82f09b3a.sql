-- job_id: 8c4d7a96-ed82-494f-9ed4-467d82f09b3a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:38.488000+00:00
-- started: 2026-08-03T12:25:38.567000+00:00
-- ended: 2026-08-03T12:25:38.767000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2995ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
