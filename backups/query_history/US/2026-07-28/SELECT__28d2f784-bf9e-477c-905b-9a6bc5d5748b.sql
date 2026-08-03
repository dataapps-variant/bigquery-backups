-- job_id: 28d2f784-bf9e-477c-905b-9a6bc5d5748b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:12.450000+00:00
-- started: 2026-07-28T10:04:12.532000+00:00
-- ended: 2026-07-28T10:04:12.655000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'EN2788YT' AND App_Name = 'EN'
            ORDER BY Billing_Cycle, SOT_Days
