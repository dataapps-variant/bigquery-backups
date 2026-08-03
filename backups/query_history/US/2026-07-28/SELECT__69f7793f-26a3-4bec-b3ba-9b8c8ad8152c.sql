-- job_id: 69f7793f-26a3-4bec-b3ba-9b8c8ad8152c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:14.691000+00:00
-- started: 2026-07-28T10:00:14.823000+00:00
-- ended: 2026-07-28T10:00:15.016000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD9600AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
