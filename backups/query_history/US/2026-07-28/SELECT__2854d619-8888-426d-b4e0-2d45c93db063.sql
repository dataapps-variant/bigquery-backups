-- job_id: 2854d619-8888-426d-b4e0-2d45c93db063
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:07.802000+00:00
-- started: 2026-07-28T14:31:07.886000+00:00
-- ended: 2026-07-28T14:31:08.072000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3999ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
