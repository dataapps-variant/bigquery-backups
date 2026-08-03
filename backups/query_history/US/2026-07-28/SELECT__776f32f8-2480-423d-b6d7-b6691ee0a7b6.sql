-- job_id: 776f32f8-2480-423d-b6d7-b6691ee0a7b6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:59.079000+00:00
-- started: 2026-07-28T10:04:59.150000+00:00
-- ended: 2026-07-28T10:04:59.297000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF8970ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
