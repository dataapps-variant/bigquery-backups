-- job_id: 4b35f99f-5762-47ff-b6bb-996fd30d5902
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:32.935000+00:00
-- started: 2026-07-28T10:01:33.012000+00:00
-- ended: 2026-07-28T10:01:33.111000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
