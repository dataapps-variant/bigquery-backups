-- job_id: a6f3ac4c-a544-401c-a679-cb40a09520fa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:27.043000+00:00
-- started: 2026-07-28T10:02:27.125000+00:00
-- ended: 2026-07-28T10:02:27.224000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2595ST' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
