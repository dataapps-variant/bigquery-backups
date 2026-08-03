-- job_id: 1c9aa3a2-d96d-484a-b3f2-6154a6347d1b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:01.743000+00:00
-- started: 2026-07-28T10:00:01.860000+00:00
-- ended: 2026-07-28T10:00:01.999000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2995MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
