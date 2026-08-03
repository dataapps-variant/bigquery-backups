-- job_id: 98726a8f-5653-4eee-ba6f-54037a4af04e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:04.717000+00:00
-- started: 2026-07-28T10:04:04.767000+00:00
-- ended: 2026-07-28T10:04:04.856000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
