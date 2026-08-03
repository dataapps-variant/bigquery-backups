-- job_id: 382e5c2f-4437-4f41-b013-08b649210406
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:24.399000+00:00
-- started: 2026-07-28T10:01:24.477000+00:00
-- ended: 2026-07-28T10:01:24.594000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
