-- job_id: 12664f19-2fdf-4eb2-897c-98a9a9b025c1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:10.514000+00:00
-- started: 2026-08-03T12:26:10.619000+00:00
-- ended: 2026-08-03T12:26:10.829000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
