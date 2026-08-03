-- job_id: 329bd31b-b9b5-469d-bac6-766d5cdbcb09
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:35.167000+00:00
-- started: 2026-08-03T12:22:35.245000+00:00
-- ended: 2026-08-03T12:22:35.430000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1440AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
