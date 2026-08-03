-- job_id: 8d95c124-4299-4a51-9a67-2dbebfbe48d9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:13.329000+00:00
-- started: 2026-08-03T12:22:13.437000+00:00
-- ended: 2026-08-03T12:22:13.621000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2595ST' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
