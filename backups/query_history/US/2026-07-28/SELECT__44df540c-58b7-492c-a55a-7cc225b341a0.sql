-- job_id: 44df540c-58b7-492c-a55a-7cc225b341a0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:43.070000+00:00
-- started: 2026-07-28T10:04:43.148000+00:00
-- ended: 2026-07-28T10:04:43.288000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB6373YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
