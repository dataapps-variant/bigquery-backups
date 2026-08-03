-- job_id: cab79096-5532-487b-bce3-17c0870b8ee3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:43.558000+00:00
-- started: 2026-08-03T12:27:43.638000+00:00
-- ended: 2026-08-03T12:27:43.786000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF8970ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
