-- job_id: b0379c46-96a6-40b5-8afb-62d129a9667f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:19.505000+00:00
-- started: 2026-08-03T12:22:19.559000+00:00
-- ended: 2026-08-03T12:22:19.754000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
