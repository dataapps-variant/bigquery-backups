-- job_id: 5f0fdeba-68ed-437c-9ed2-d6f962d4087b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:55.155000+00:00
-- started: 2026-08-03T12:23:55.221000+00:00
-- ended: 2026-08-03T12:23:55.307000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
