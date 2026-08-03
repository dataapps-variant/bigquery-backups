-- job_id: a5c1ea7c-28d2-4e8f-9806-674501e4fe84
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:53.505000+00:00
-- started: 2026-07-28T10:04:53.556000+00:00
-- ended: 2026-07-28T10:04:53.660000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2788ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
